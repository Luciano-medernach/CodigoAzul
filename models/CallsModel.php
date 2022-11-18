<?php

require_once('Model.php');

class CallsModel extends Model {

    // Retorna todas las llamadas indexado
    function getAllByPage($page = 0){
        $page = $page * 50;
        $query = $this-> getDb()->prepare('SELECT * FROM calls LEFT JOIN areas ON areas.id = calls.area LIMIT '.$page.', 50');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna todas las llamadas
    function getAll(){
        $query = $this-> getDb()->prepare('SELECT * FROM calls LEFT JOIN areas ON areas.id = calls.area');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna el conteo de llamadas
    function getCount(){
        $query = $this-> getDb()->prepare('SELECT Count(calls.id) as count FROM calls LEFT JOIN areas ON areas.id = calls.area');
        $query->execute();
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Retorna el conteo de llamadas del area
    function getCountArea($area){
        $query = $this-> getDb()->prepare('SELECT Count(calls.id) as count FROM calls WHERE area LIKE ? ');
        $query->execute([$area."%"]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Retorna llamadas por area
    function getByArea($page, $area){
        $page = $page * 50;
        $query = $this-> getDb()->prepare('SELECT * FROM calls LEFT JOIN areas ON areas.id = calls.area WHERE areas.name LIKE ? LIMIT '.$page.', 50');
        $query->execute([$area."%"]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna las llamadas por tipo
    function getByType($type){
        $query = $this-> getDb()->prepare('SELECT * FROM calls WHERE type = ? ORDER BY date DESC LIMIT 3;');
        $query->execute([$type]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna el tiempo promedio en que se atienden las llamadas
    function getAverageTime(){
        $query = $this-> getDb()->prepare('SELECT AVG(time) as averageTime FROM calls');
        $query->execute();
        return floor($query->fetch(PDO::FETCH_OBJ)->averageTime);
    }   

    // Retorna la cantidad de llamadas por dia
    function getCountByDate(){


        $query = $this-> getDb()->prepare("SELECT COUNT(id) as count, date FROM calls WHERE date >= DATE_SUB(now(), INTERVAL 7 DAY) GROUP BY date");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna la cantidad de llamadas por area
    function getCountByArea(){
        $query = $this-> getDb()->prepare("SELECT COUNT(calls.id) as count, area, name FROM calls LEFT JOIN areas ON calls.area = areas.id GROUP BY area");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna la cantidad de llamadas por hora
    function getCountByHour(){
        $query = $this-> getDb()->prepare("SELECT COUNT(calls.id) as count, hour(hour) as hour FROM calls GROUP BY hour(hour)");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna la cantidad de llamadas por origen
    function getCountByOrigin(){
        $query = $this-> getDb()->prepare("SELECT COUNT(calls.id) as count, origin FROM calls GROUP BY origin");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
?>