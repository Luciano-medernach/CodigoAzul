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

$id = $_GET["id"];
$time = $_GET["time"];

$query = $db->prepare("UPDATE calls set attended = 1, time = ? WHERE id = ?");
$query->execute([$time, $id]);


?>
