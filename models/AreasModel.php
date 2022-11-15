<?php

require_once('Model.php');

class AreasModel extends Model {

    // Retorna todas las areas
    function getAll(){
        $query = $this-> getDb()->prepare('SELECT * FROM areas ORDER BY name ASC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna las ultimas cinco
    function getLast(){
        $query = $this-> getDb()->prepare('SELECT * FROM areas ORDER BY id DESC LIMIT 5');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    
    // Retorna un area por id
    function getById($id){
        $query = $this-> getDb()->prepare('SELECT * FROM areas WHERE id = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Verifica si aun quedan pacientes en el area
    function checkPatients($id){
        $query = $this-> getDb()->prepare('SELECT * FROM patients WHERE area = ?');
        $query->execute([$id]);
        return $query->rowCount();
    }

    // Agregar un area
    function add($name){
        $query = $this-> getDb()->prepare('INSERT INTO areas (name) VALUES (?)');
        $query->execute([$name]);
    }

    // Edita un area
    function edit($id, $name){
        $query = $this-> getDb()->prepare('UPDATE areas SET name = ? WHERE id = ?');
        $query->execute([$name, $id]);
    }

    // Elimina un area
    function delete($id){
        $query = $this-> getDb()->prepare('DELETE FROM areas WHERE id = ?');
        $query->execute([$id]);
    }

}
?>