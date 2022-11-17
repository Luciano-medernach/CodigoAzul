<?php

require_once('Model.php');

class PatientsModel extends Model {

    // Devuelve el id del ultimo insertado
    function getLastInserted(){
        return $this->getDb()->lastInsertId();
    }


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
    function add($name, $lastname, $dni, $age, $address, $phone, $family_phone, $height, $weight, $medical_history, $medicines, $area){
        $query = $this-> getDb()->prepare('INSERT INTO patients (name, lastname, dni, age, address, phone, family_phone, height, weight, medical_history,
         medicines, area) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');
        $query->execute([$name, $lastname, $dni, $age, $address, $phone, $family_phone, $height, $weight, $medical_history, $medicines, $area]);
    }

    // Agregar un paciente desconocido
    function addUnknown($name, $medical_history, $medicines, $area){
        $query = $this-> getDb()->prepare('INSERT INTO patients (name, medical_history, medicines, area) VALUES ( ?, ?, ?, ?)');
        $query->execute([$name, $medical_history, $medicines, $area]);
    }

    // Edita un paciente
    function edit($id, $name, $lastname, $dni, $age, $address, $phone, $family_phone, $height, $weight, $medical_history, $medicines, $area){
        $query = $this-> getDb()->prepare('UPDATE patients SET name = ?, lastname = ?, dni = ?, age = ?, address = ?, phone = ?, family_phone = ?, height = ?,
         weight = ?, medical_history = ?, medicines = ?, area = ? WHERE id = ?');
        $query->execute([$name, $lastname, $dni, $age, $address, $phone, $family_phone, $height, $weight, $medical_history, $medicines, $area, $id]);
    }

    // Elimina un paciente
    function delete($id){
        $query = $this-> getDb()->prepare('DELETE FROM patients WHERE id = ?');
        $query->execute([$id]);
    }


    // Obtiene los pacientes asignados a un area determinada
    function getAssignedToArea($id){
        $query = $this-> getDb()->prepare('SELECT * FROM patients WHERE area = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Asigna un paciente a un area
    function reassignArea($areaid, $patientid){
        $query = $this-> getDb()->prepare('UPDATE patients SET area = ? WHERE id = ?');
        $query->execute([ $areaid, $patientid]);
    }

    // Desasigna un paciente de su area
    function deassignToArea($patientid){
        $query = $this-> getDb()->prepare('UPDATE patients SET area = NULL WHERE id = ?');
        $query->execute([$patientid]);
    }


}
?>