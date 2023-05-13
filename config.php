<?php
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'db_pinjam_barang';

// Create connection
$conn = mysqli_connect($host, $username, $password, $database);
// Check connection
if (!$conn) {
    die('Connection failed:'. $conn->connect_error);
} 
?>