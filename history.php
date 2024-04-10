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

// Retrieve location from GET parameter
$location = $_GET['location'];

// Retrieve historical weather data from the database
$query = "SELECT * FROM weather_history WHERE location = '$location'";
$result = $conn->query($query);

// Display historical results
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<p>Time: {$row['time_searched']}, Temperature: {$row['temperature']} °C, Weather: {$row['weather']}</p>";
    }
} else {
    echo "<p>No historical data found for $location</p>";
}

// Close database connection
$conn->close();
