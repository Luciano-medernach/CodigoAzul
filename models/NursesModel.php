<?php

require_once('Model.php');

class NursesModel extends Model {

    // Retorna todos los enfermeros
    function getAll(){
        $query = $this-> getDb()->prepare('SELECT * FROM nurses ORDER BY lastname ASC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna un enfermero por id
    function getById($id){
        $query = $this-> getDb()->prepare('SELECT * FROM nurses WHERE id = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    
    // Agregar un enfermero
    function add($name, $lastname){
        $query = $this-> getDb()->prepare('INSERT INTO nurses (name, lastname) VALUES (?, ?)');
        $query->execute([$name, $lastname]);
    }

    // Edita un enfermero
    function edit($id, $name, $lastname){
        $query = $this-> getDb()->prepare('UPDATE nurses SET name = ?, lastname = ? WHERE id = ?');
        $query->execute([$name, $lastname, $id]);
    }

    // Elimina un enfermero
    function delete($id){
        $query = $this-> getDb()->prepare('DELETE FROM nurses WHERE id = ?');
        $query->execute([$id]);
    }

}
?>