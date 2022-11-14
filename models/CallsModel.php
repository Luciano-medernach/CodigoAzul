<?php

require_once('Model.php');

class CallsModel extends Model {

    // Retorna todas las llamadas
    function getAll(){
        $query = $this-> getDb()->prepare('SELECT * FROM calls ORDER BY date DESC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

}
?>