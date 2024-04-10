<?php
// Database connection setup
$servername = "localhost";
$username = "root"; // Your MySQL username (default is root)
$password = "root"; // Your MySQL password (default is root)
$dbname = "weather_app"; // Your database name

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve data from Ajax request
    $location = $_POST['location'];
    $temperature = $_POST['temperature'];
    $weather = $_POST['weather'];
    $timeSearched = date('Y-m-d H:i:s'); // Current timestamp

    // Insert data into the database table
    $query = "INSERT INTO weather_history (location, temperature, weather, time_searched)
              VALUES ('$location', '$temperature', '$weather', '$timeSearched')";

    $conn->query($query);
}

// Close database connection
$conn->close();
