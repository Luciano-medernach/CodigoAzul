<?php

require_once('Model.php');

class AreasModel extends Model {

    // Retorna todas las areas
    function getAll($page){
        $page = $page * 50;
        $query = $this-> getDb()->prepare('SELECT * FROM areas WHERE id LIMIT '.$page.' , 50');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna todas las areas
    function getAllAbsolute(){
        $query = $this-> getDb()->prepare('SELECT * FROM areas WHERE id');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna la cantidad de areas
    function getCount(){
        $query = $this-> getDb()->prepare('SELECT Count(id) as count FROM areas');
        $query->execute();
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Retorna la cantidad de areas por nombre
    function getCountByName($name){
        $query = $this-> getDb()->prepare('SELECT Count(id) as count FROM areas WHERE name LIKE ?');
        $query->execute([$name."%"]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Retorna areas por nombre
    function getByName($name, $page){
        $query = $this-> getDb()->prepare('SELECT * FROM areas WHERE name LIKE ? LIMIT '.$page.', 50');
        $query->execute([$name."%"]);
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
        return $query->fetch(PDO::FETCH_OBJ);
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


    // Asigna un origen a un area
    function assignToArea($origin, $areaid){
        $query = $this-> getDb()->prepare('INSERT area_origin (origin, areaid) VALUES (?, ?)');
        $query->execute([$origin, $areaid]);
    }

    // Obtiene los origenes asignadas a un area determinada
    function getOriginsAssigned($id){
        $query = $this-> getDb()->prepare('SELECT * FROM area_origin WHERE areaid = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Verifica que el origen no este ya asignado
    function checkAssignedOrigin($origin, $areaid){
        $query = $this-> getDb()->prepare('SELECT * FROM area_origin WHERE origin = ? AND areaid = ?');
        $query->execute([$origin, $areaid]);
        return $query->rowCount();
    }

    // Desasigna un origen de un area
    function deassignToArea($origin, $areaid){
        $query = $this-> getDb()->prepare('DELETE FROM area_origin WHERE origin = ? AND areaid = ?');
        $query->execute([$origin, $areaid]);
    }

}
?>