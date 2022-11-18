<?php

$host="localhost";
$userName="root";
$password="";
$database="codigoazul";

try {
    $db = new PDO("mysql:host=$host;dbname=$database;charset=utf8", $userName, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
} catch (Exception $e) {
    var_dump($e);
}

$type = $_GET["type"];
$area = $_GET["area"];
$origin = $_GET["origin"];

$query = $db->prepare("INSERT INTO calls (type, area, origin) VALUES (?, ?, ?)");
$query->execute([$type, $area, $origin]);

echo "|" . $db->lastInsertId() .  ">";
?>
