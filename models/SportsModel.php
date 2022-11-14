<?php

require_once('Model.php');

class SportsModel extends Model {

    // Retorna todos los deportes
    function getAll(){
        $query = $this-> getDb()->prepare('SELECT * FROM sports ORDER BY name ASC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    
    // Retorna el deporte por ID
    function get($id){
        $query = $this-> getDb()->prepare('SELECT * FROM sports WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Elimina un deporte por id
    function delete($id){
        $query = $this->getDb()->prepare('DELETE FROM sports WHERE id = ?');
        $query->execute([$id]);
    }

    // Crea un deporte
    function add($name){
        $query = $this->getDb()->prepare( 'INSERT INTO sports (name) VALUES(?)');
        $query->execute([$name]);
    }

    // Actualiza los valores del deporte
    function editAdmin($id,$name){
        $query = $this-> getDb()->prepare('UPDATE sports SET name = ? WHERE id = ?');
        $query->execute([$name,$id]);
    }
}
?>