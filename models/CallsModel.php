<?php

require_once('Model.php');

class CallsModel extends Model {

    // Retorna todas las llamadas
    function getAll(){
        $query = $this-> getDb()->prepare('SELECT * FROM calls LEFT JOIN areas ON areas.id = calls.area');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna las llamadas por tipo
    function getByType($type){
        $query = $this-> getDb()->prepare('SELECT * FROM calls WHERE type = ? ORDER BY date DESC LIMIT 5;');
        $query->execute([$type]);
        return $query->fetchAll(PDO::FETCH_OBJ);
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