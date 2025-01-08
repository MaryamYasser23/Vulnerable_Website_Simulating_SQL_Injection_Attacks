<?php

session_start();
include("db.php");

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

function detectSQLi($value)
{
    $sqlKeywords = ["SELECT", "UNION", "DROP", "INSERT", "UPDATE", "DELETE", "WHERE", "OR 1=1"];
    $sqlSpecialChars = ["'", "\"", "--", ";", "/*", "*/"];

    $upperValue = strtoupper($value);

    foreach ($sqlKeywords as $keyword) {
        if (strpos($upperValue, $keyword) !== false) {
            return true;
        }
    }

    foreach ($sqlSpecialChars as $char) {
        if (strpos($value, $char) !== false) {
            return true;
        }
    }

    return false;
}


if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $inputs = $_POST;

    foreach ($inputs as $key => $value) {
        if (detectSQLi($value)) {
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

                $body = "Detected SQL Injection in the following parameters:<br><br>";
                foreach ($inputs as $key => $value) {
                    $body .= "Key: $key <br> Value: $value <br>";
                }
                $mail->Body = $body;

                $mail->send();
                echo "Email sent successfully!";
            } catch (Exception $e) {
                echo "Failed to send email. Error: {$mail->ErrorInfo}";
            }
            break;
        }
    }


    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "SELECT * FROM user_accounts WHERE username = '$username' AND password = '$password'";
    $result = $conn->query($query);
    $username = isset($_SESSION['username']) ? $_SESSION['username'] : 'Unknown User';

    if ($result && $result->num_rows > 0) {
        $user = $result->fetch_assoc();

        $_SESSION['username'] = $user['username'];
        $_SESSION['user_id'] = $user['id'];

        header("Location: index.php?username=" . $user['username']);
        exit();
    } else {
        $msg = "Invalid username or password.";
    }
}

$conn->close();
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="sign-in.css" rel="stylesheet">
</head>

<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">Cyber Teller</a>
            <div class="auth-buttons">
                <a href="sign-up.php" class="btn btn-primary">Sign up</a>
            </div>
        </div>
    </nav>

    <?php if (isset($msg)): ?>
        <div class="alert" role="alert" style="background-color: #683c9e; color: white;">
            <?php echo htmlspecialchars($msg); ?>
        </div>
    <?php endif; ?>

    <div class="container">
        <form action="sign-in.php" method="POST" class="sign-in-form">
            <h2>Sign In</h2>
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-danger">Sign In</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
</body>

</html>