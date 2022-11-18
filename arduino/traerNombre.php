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

$query = $db->prepare("SELECT * FROM areas WHERE id = ?");
$query->execute([$id]);


echo "|" . $query->fetch(PDO::FETCH_OBJ)->name .  ">";

?>