<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BBMS</title>
    
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Favicon -->
    <link rel="shortcut icon" href="images/blood-drop.svg" type="image/x-icon">
    
    <style>
        /* Ensure full-page layout */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: rgb(239, 164, 239) !important;
        }

        /* Navbar styles */
        .navbar {
            background-color: rgb(160, 82, 157)!important;
        }

        /* Navbar links */
        .navbar-nav .nav-item .nav-link {
            color: rgb(0, 0, 0) !important;
            margin-right: 10px;
            text-decoration: none;
        }

        /* Hover effect for Navbar links */
        .navbar-nav .nav-item .nav-link:hover {
            color: rgb(0, 0, 0) !important;
        }

        /* Content section */
        .content {
            text-align: center;
            padding: 100px 20px;
            flex: 1;
        }

        /* Footer styles */
        .footer {
            background-color: rgb(160, 82, 157);
            color: #FFF;
            padding: 15px;
            text-align: center;
            width: 100%;
            position: relative;
            bottom: 0;
        }

        /* Footer links */
        .footer a {
            color: #FFF;
            text-decoration: none;
            font-weight: bold;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.php" style="color: #FFF;font-size:22px;letter-spacing:2px;">BBMS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="patient/register.php">REGISTER</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="patient/login.php">LOGIN</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container content">
        <h1 class="display-6">Blood Bank Management System</h1>
        <div class="row align-items-center">
            <div class="col-lg-6">
                <p class="lead mt-3">
                    This system is designed to efficiently manage blood donations, donors, and recipients, ensuring the availability of safe and life-saving blood for those in need.
                </p>
                <p class="lead mt-3 mb-5">
                    Join us in the mission to save lives. Register as a donor or recipient and help make a difference!
                </p>
            </div>
            <div class="col-lg-6">
                <img id="animated-image" src="images/home.svg" alt="Blood Donation" class="img-fluid d-none d-lg-block">
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        &copy;
        <a href="https://github.com/Farheen-18/Blood_Bank_Management_System/tree/main" target="_blank" aria-label="Visit Blood Bank Management System repository">Team</a>
    </footer>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
