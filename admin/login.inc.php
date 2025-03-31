<?php 
declare(strict_types=1);
require_once("../includes/session.inc.php");
require_once("../includes/dbh.inc.php");

// Define a basic logging function for troubleshooting
function log_debug($message) {
    // Create logs directory if it doesn't exist
    if (!file_exists('../logs')) {
        mkdir('../logs', 0777, true);
    }
    file_put_contents('../logs/debug.log', date('[Y-m-d H:i:s] ') . $message . PHP_EOL, FILE_APPEND);
}

log_debug("Login process started");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $pwd = isset($_POST["pwd"]) ? trim($_POST["pwd"]) : '';
    $username = isset($_POST["username"]) ? trim($_POST["username"]) : '';

    log_debug("Login attempt - Username: $username, Password length: " . strlen($pwd));

    try {
        // Errors array
        $errors = [];

        if (checkInput($pwd, $username)) {
            $errors["check_input"] = "Fill all fields!";
            log_debug("Error: Empty fields detected");
        }
        
        // Get database connection status
        log_debug("Checking database connection");
        try {
            $testQuery = "SELECT COUNT(*) FROM admin";
            $testStmt = $pdo->query($testQuery);
            $count = $testStmt->fetchColumn();
            log_debug("Database connection successful. Admin count: $count");
        } catch (PDOException $e) {
            log_debug("Database connection test failed: " . $e->getMessage());
        }

        // Authentication check
        $auth_result = username_exists($pdo, $username, $pwd);
        if (!$auth_result) {
            $errors["incorrect"] = "Incorrect Login Info!";
            log_debug("Authentication failed for user: $username");
        } else {
            log_debug("Authentication successful for user: $username");
        }

        if ($errors) {
            $_SESSION["admin_error_login"] = $errors;
            log_debug("Redirecting to login.php with errors: " . json_encode($errors));
            header("Location:login.php");
            die();
        }

        // Login successful
        $_SESSION["admin"] = $username;
        log_debug("Login successful. Setting session and redirecting");
        header("Location:login.php?login=success");
        die();
        
    } catch (PDOException $e) {
        log_debug("Critical error: " . $e->getMessage());
        die("Query failed: " . $e->getMessage());
    }
} else {
    header("Location:login.php");
    die();
}

function checkInput(string $pwd, string $username): bool
{
    return empty($pwd) || empty($username);
}

function username_exists(object $pdo, string $username, string $pwd): bool
{
    log_debug("Checking credentials for username: $username");
    
    // TEMPORARY FIX: For testing purposes only - Remove in production
    // This bypasses normal authentication to help troubleshoot the login issue
    if ($username === "admin" && $pwd === "test") {
        log_debug("Using hardcoded credentials match");
        return true;
    }
    
    // Normal authentication process
    try {
        $query = "SELECT * FROM admin WHERE username=:username;";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(":username", $username);
        
        if (!$stmt->execute()) {
            log_debug("Query execution failed for username: $username");
            return false;
        }
        
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($result) {
            log_debug("User found in database. Stored hash: " . substr($result["pwd"], 0, 10) . "...");
            
            // Check if password verification works
            $verify_result = password_verify($pwd, $result["pwd"]);
            log_debug("Password verification result: " . ($verify_result ? "true" : "false"));
            
            return $verify_result;
        } else {
            log_debug("No user found with username: $username");
            return false;
        }
        
    } catch (PDOException $e) {
        log_debug("Database query failed: " . $e->getMessage());
        return false;
    }
}
?>
