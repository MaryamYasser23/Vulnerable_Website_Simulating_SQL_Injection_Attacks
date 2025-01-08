<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

include("db.php");

session_start();

if (isset($_GET['articleid'])) {
    $articleid = $_GET['articleid'];

    $query = "SELECT * FROM articles WHERE articleid = $articleid AND status = 'visible'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        $msg = "Article not found.";
    }
} else {
    $msg = "Invalid request.";
}


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $full_url = isset($_POST['full_url']) ? $_POST['full_url'] : 'Unknown URL';
    $username = isset($_SESSION['username']) ? $_SESSION['username'] : 'Unknown User';

    $mail = new PHPMailer(true);

    try {
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'username@gmail.com';
        $mail->Password = 'aaaa aaaa aaaa aaaa';
        $mail->SMTPSecure = 'tls';
        $mail->Port = 587;

        $mail->setFrom('sender@gmail.com', 'Cyber Teller');
        $mail->addAddress('receiver@gmail.com');

        $mail->isHTML(true);
        $mail->Subject = 'SOC Alert! Potential SQLi detected';
        $mail->Body = "Detected SQL Injection in URL:<br>
                        Full URL: $full_url<br>
                        Attempted by User: $username";

        $mail->send();
        echo "Email sent successfully!";
    } catch (Exception $e) {
        echo "Failed to send email. Error: {$mail->ErrorInfo}";
    }
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyber Teller</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="index.css">

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const currentURL = window.location.href;

            function detectSQLi(value) {
                const sqlKeywords = ["SELECT", "UNION", "DROP", "INSERT", "UPDATE", "DELETE", "WHERE", "OR 1=1"];
                const sqlSpecialChars = ["'", "\"", "--", ";", "/*", "*/"];

                const upperValue = value.toUpperCase();

                for (let keyword of sqlKeywords) {
                    if (upperValue.includes(keyword)) {
                        return true;
                    }
                }

                for (let char of sqlSpecialChars) {
                    if (value.includes(char)) {
                        return true;
                    }
                }

                return false;
            }

            if (detectSQLi(currentURL)) {
                console.warn(`Potential SQL Injection detected in URL: ${currentURL}`);

                fetch('index.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: `full_url=${encodeURIComponent(currentURL)}`
                    })
                    .then(response => response.text())
                    .then(data => {
                        console.log(data);
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            } else {
                console.log(`URL is safe: ${currentURL}`);
            }
        });
    </script>

</head>

<body>

    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid d-flex justify-content-between">
            <a class="navbar-brand" href="index.php">Cyber Teller</a>
            <div class="d-flex align-items-center">
                <form class="d-flex" action="index.php" method="GET">
                    <input class="form-control me-1" type="search" name="search_query" placeholder="Search" aria-label="Search" required>
                    <button class="btn btn-primary me-3" type="submit">Search</button>
                </form>
                <?php if (isset($_SESSION['username'])): ?>
                    <span class="me-3">Hello, <?php echo $_SESSION['username']; ?>!</span>
                    <?php if (isset($_SESSION['email'])): ?>
                        <span class="me-3"><?php echo htmlspecialchars($_SESSION['email']); ?></span>
                    <?php endif; ?>
                    <a href="logout.php" class="btn btn-primary me-3">Logout</a>
                <?php else: ?>
                    <a href="sign-in.php" class="btn btn-o me-1">Sign in</a>
                    <a href="sign-up.php" class="btn btn-primary me-1">Sign up</a>
                <?php endif; ?>
            </div>
        </div>
    </nav>

    <div class="hero">
        <h1>Cyber Teller</h1>
        <p>Your go-to source for the latest cyber news.</p>
    </div>

    <?php if (isset($msg)): ?>
        <div class="container my-5">
            <?php echo htmlspecialchars($msg); ?>
        </div>
    <?php else: ?>
        <div class="container my-5">
            <?php echo '<h2>' . htmlspecialchars($row['title']) . '</h2>'; ?>
            <?php echo '<img src=' . $row['image'] . ' class="card-img-top" alt="Article Image">'; ?>
            <?php echo '<p>' . nl2br(htmlspecialchars($row['content'])) . '</p>'; ?>
        </div>
    <?php endif; ?>

    <footer class="py-5">
        <div class="container text-center">
            <p>&copy; 2024 Cyber Teller. All rights reserved.</p>
            <p><a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

</body>

</html>