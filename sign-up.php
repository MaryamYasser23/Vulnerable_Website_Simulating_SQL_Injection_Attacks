<?php

session_start();
include("db.php");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    $confirmPassword = mysqli_real_escape_string($conn, $_POST['confirm-password']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);

    $checkUsernameQuery = "SELECT * FROM user_accounts WHERE username = ?";
    $stmt = $conn->prepare($checkUsernameQuery);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $msgu = "Username is already taken. Please choose a different one.";
    } else {
        $checkEmailQuery = "SELECT * FROM user_accounts WHERE email = ?";
        $stmt = $conn->prepare($checkEmailQuery);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $msgu = "Email is already registered. Please choose a different one.";
        } else {
            if ($password !== $confirmPassword) {
                $msgu = "Passwords do not match. Please try again.";
            } else {
                $hashedPassword = $password;

                $insertQuery = "INSERT INTO user_accounts (username, password, email) VALUES (?, ?, ?)";
                $stmt = $conn->prepare($insertQuery);
                $stmt->bind_param("sss", $username, $hashedPassword, $email);

                if ($stmt->execute()) {
                    $msgu = "Registration successful!, Sign-in Now! ";
                } else {
                    $msgu = "Error: " . $stmt->error;
                }
            }
        }
    }

    $stmt->close();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="sign-up.css" rel="stylesheet">
</head>

<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">Cyber Teller</a>
            <div class="auth-buttons">
                <a href="sign-in.php" class="btn btn-primary">Sign In</a>
            </div>
        </div>
    </nav>

    <?php
    if (isset($msgu)): ?>
        <div class="alert" role="alert" style="background-color: #683c9e; color: white;">
            <?php echo htmlspecialchars($msgu); ?>
        </div>
    <?php endif; ?>

    <div class="container">
        <form action="sign-up.php" method="POST" class="sign-up-form">
            <h2>Sign Up</h2>
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="confirm-password" class="form-label">Confirm Password:</label>
                <input type="password" id="confirm-password" name="confirm-password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-danger">Sign Up</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
</body>

</html>