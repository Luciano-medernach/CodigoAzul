<?php

require_once('Model.php');

class PatientsModel extends Model {

    // Retorna todos los pacientes
    function getAll(){
        $query = $this-> getDb()->prepare('SELECT * FROM patients ORDER BY lastname ASC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna los ultimos 5 pacientes
    function getLast(){
        $query = $this-> getDb()->prepare('SELECT * FROM patients GROUP BY id DESC LIMIT 5');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    
    // Retorna un paciente por id
    function getById($id){
        $query = $this-> getDb()->prepare('SELECT * FROM patients WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Agregar un paciente
    function add($name, $lastname, $age, $height, $weight, $area, $nurse){
        $query = $this-> getDb()->prepare('INSERT INTO patients (name, lastname, age, height, weight, area, nurse) VALUES (?, ?, ?, ?, ?, ?, ?)');
        $query->execute([$name, $lastname, $age, $height, $weight, $area, $nurse]);
    }

    // Edita un paciente
    function edit($id, $name, $lastname, $age, $height, $weight, $area, $nurse){
        $query = $this-> getDb()->prepare('UPDATE patients SET name = ?, lastname = ?, age = ?, height = ?, weight = ?, area = ?, nurse = ? WHERE id = ?');
        $query->execute([$name, $lastname, $age, $height, $weight, $area, $nurse, $id]);
    }

    // Elimina un paciente
    function delete($id){
        $query = $this-> getDb()->prepare('DELETE FROM patients WHERE id = ?');
        $query->execute([$id]);
    }

}
?>