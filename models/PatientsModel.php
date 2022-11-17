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
        $query = $this-> getDb()->prepare('SELECT * FROM patients LEFT JOIN patient_area ON patients.id = patient_area.patientid WHERE patient_area.areaid = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Asigna un paciente a un area
    function assignToArea($patientid, $areaid){
        $query = $this-> getDb()->prepare('INSERT patient_area (patientid, areaid) VALUES (?, ?)');
        $query->execute([$patientid, $areaid]);
    }

    // Desasigna un paciente de un area
    function deassignToArea($patientid){
        $query = $this-> getDb()->prepare('DELETE FROM patient_area WHERE patientid = ?');
        $query->execute([$patientid]);
    }

    // Verifica que el area no esta ya asignada
    function checkAssignedArea($patientid, $areaid){
        $query = $this-> getDb()->prepare('SELECT * FROM patient_area WHERE patientid = ? AND areaid = ?');
        $query->execute([$patientid, $areaid]);
        return $query->rowCount();
    }

}
?>