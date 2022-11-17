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
        $query = $this-> getDb()->prepare("SELECT COUNT(id) as count, date FROM calls GROUP BY date");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
?>