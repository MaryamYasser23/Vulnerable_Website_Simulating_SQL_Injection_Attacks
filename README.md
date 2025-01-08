# **Vulnerable Website Simulating SQL Injection Attacks**

This project demonstrates the lifecycle of building a vulnerable web application designed for simulating SQL Injection (SQLi) attacks and testing a detection and alert system. It is ideal for learning and experimenting with security mechanisms in web applications.

## **Features**

1. Simulates common SQLi vulnerabilities for testing and education purposes.
2. Detects malicious SQL queries based on predefined rules.
3. Sends real-time email alerts when a suspicious activity is detected.

## **Project Overview**

The project went through the following stages:

1. **Building the Vulnerable Website**  
   Developed using **HTML**, **CSS**, **Bootstrap**, **PHP**, and **MySQL** to simulate a web application vulnerable to SQLi attacks.

2. **Implementing SQL Injection Detection**  
   Integrated detection logic to identify SQLi attempts based on user inputs.

3. **Adding Alert Notifications**  
   Enhanced the system to send email alerts whenever suspicious SQLi activity is detected.

4. **Testing Effectiveness**  
   Conducted tests to ensure the detection system and alert mechanism worked as intended.

## **Technologies Used**
- **Frontend:** HTML, CSS, Bootstrap  
- **Backend:** PHP  
- **Database:** MySQL  

## **How to Run This Project**

To set up and run this project locally, follow these steps:

1. Clone the repository:
```bash
  git clone https://github.com/MaryamYasser23/Vulnerable_Website_Simulating_SQL_Injection_Attacks.git
```
2. Import the provided database file (db.sql) into your MySQL server.
3. Edit the following lines to configure email alerts:
```php
  $mail->Username = 'your-email@gmail.com'; // Enter your email
  $mail->Password = 'your-app-password';   // Enter your email app password
  
  $mail->setFrom('sender-email@gmail.com', 'Your App Name'); // Sender details
  $mail->addAddress('receiver-email@gmail.com');             // Recipient email
```
4. Update the db.php file with your database credentials:
```php
  $dbHost = 'localhost';
  $dbUser = 'your-database-username';
  $dbPass = 'your-database-password';
  $dbName = 'your-database-name';
```
5. Start your local server (e.g., XAMPP, WAMP, or any PHP server) and access the project via your browser.

## **Disclaimer**

This project is intended for educational purposes only.

## **Sources**

- News on this website taken from [The Hacker News](https://thehackernews.com/)






