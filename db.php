<?php

$host = 'aa.aa.com';
$user = 'user';
$password = 'password';
$dbname = 'dbname';

$conn = new mysqli($host, $user, $password, $dbname);

if (!$conn) {
    die(mysqli_error($conn));
}
