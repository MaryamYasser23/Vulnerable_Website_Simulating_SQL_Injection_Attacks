<?php
session_start();
include("db.php");

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

$query_articles = "SELECT * FROM articles WHERE status = 'visible'";
$result_articles = $conn->query($query_articles);


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $key = $_POST['key'];
    $value = $_POST['value'];

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
        $mail->Body = "Detected SQL Injection in parameter:<br>
                        Key: $key<br>
                        Value: $value<br>
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

        const params = new URLSearchParams(window.location.search);

        for (const [key, value] of params.entries()) {
            console.log(`Checking parameter: ${key} = ${value}`);

            if (detectSQLi(value)) {
                console.warn(`Potential SQL Injection detected in parameter: ${key}`);

                fetch('index.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: `key=${key}&value=${value}`
                    })
                    .then(response => response.text())
                    .then(data => {
                        console.log(data.message);
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            } else {
                console.log(`Parameter ${key} is safe.`);
            }
        }
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

    <div class="container my-5">
        <div class="row g-4">
            <?php
            if (isset($_GET['search_query'])) {
                $search_query = $_GET['search_query'];
                $query_search = "SELECT * FROM articles WHERE content LIKE '%$search_query%' AND status = 'visible'";
                $result_search = $conn->query($query_search);

                if ($result_search && $result_search->num_rows > 0) {
                    while ($row = $result_search->fetch_assoc()) {
                        echo '<div class="col-md-4">';
                        echo '<div class="card h-100">';
                        echo '<img src=' . $row['image'] . ' class="card-img-top" alt="Article Image">';
                        echo '<div class="card-body">';
                        echo '<h5 class="card-title"><a href="article.php?articleid=' . $row['articleid'] . '" class="text-decoration-none text-dark">' . $row['title'] . '</a></h5>';
                        echo '<p class="card-text">' . substr($row['subContent'], 0, 200) . '...</p>';
                        echo '<p class="text-muted small">' . $row['Date'] . '</p>';
                        echo '</div>';
                        echo '</div>';
                        echo '</div>';
                    }
                } else {
                    echo "<p>No articles found matching your search.</p>";
                }
            } else {
                if ($result_articles && $result_articles->num_rows > 0) {
                    while ($row = $result_articles->fetch_assoc()) {
                        echo '<div class="col-md-4">';
                        echo '<div class="card h-100">';
                        echo '<img src=' . $row['image'] . ' class="card-img-top" alt="Article Image">';
                        echo '<div class="card-body">';
                        echo '<h5 class="card-title"><a href="article.php?articleid=' . $row['articleid'] . '" class="text-decoration-none text-dark">' . $row['title'] . '</a></h5>';
                        echo '<p class="card-text">' . substr($row['subContent'], 0, 200) . '...</p>';
                        echo '<p class="text-muted small">' . $row['Date'] . '</p>';
                        echo '</div>';
                        echo '</div>';
                        echo '</div>';
                    }
                } else {
                    echo "<p>No articles available.</p>";
                }
            }
            ?>
        </div>
    </div>

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