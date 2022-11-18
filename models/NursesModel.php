<?php

require_once('Model.php');

class NursesModel extends Model {

   // Retorna todos los enfermeros indexado
   function getAllByPage($page){
    $page = $page * 50;
    $query = $this-> getDb()->prepare('SELECT * FROM nurses LIMIT '.$page.' , 50');
    $query->execute();
    return $query->fetchAll(PDO::FETCH_OBJ);
}

function getAll(){
    $query = $this-> getDb()->prepare('SELECT * FROM nurses');
    $query->execute();
    return $query->fetchAll(PDO::FETCH_OBJ);
}

    // Retorna la cantidad de enfermeros
    function getCount(){
        $query = $this-> getDb()->prepare('SELECT Count(id) as count FROM nurses');
        $query->execute();
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Retorna la cantidad de enfermeros por nombre
    function getCountByName($name){
        $query = $this-> getDb()->prepare('SELECT Count(id) as count FROM nurses WHERE name LIKE ? OR lastname LIKE ?');
        $query->execute([$name."%", $name."%"]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Retorna enfermeros por nombre
    function getByName($name, $page){
        $query = $this-> getDb()->prepare('SELECT * FROM nurses WHERE name LIKE ? OR lastname LIKE ? LIMIT '.$page.', 50');
        $query->execute([$name."%", $name."%"]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna los ultimos enfermeros
    function getLast(){
        $query = $this-> getDb()->prepare('SELECT * FROM nurses ORDER BY id DESC LIMIT 5');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna un enfermero por id
    function getById($id){
        $query = $this-> getDb()->prepare('SELECT * FROM nurses WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
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


    // * PATIENTS 
    // Obtiene los pacientes asignados a un enfermero determinado
    function getPatientsAssigned($id){
        $query = $this-> getDb()->prepare('SELECT * FROM patients LEFT JOIN nurse_patient ON patients.id = nurse_patient.patientid WHERE nurse_patient.nurseid = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna los enfermeros asignados a un paciente en particular
    function getAssignedToPatient($id){
        $query = $this-> getDb()->prepare('SELECT * FROM nurses LEFT JOIN nurse_patient ON nurses.id = nurse_patient.nurseid WHERE nurse_patient.patientid = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Asigna un enfermero a un paciente
    function assignToPatient($nurseid, $patientid){
        $query = $this-> getDb()->prepare('INSERT nurse_patient (nurseid, patientid) VALUES (?, ?)');
        $query->execute([$nurseid, $patientid]);
    }

    // Verifica que el paciente no este ya asignado
    function checkAssignedPatient($nurseid, $patientid){
        $query = $this-> getDb()->prepare('SELECT * FROM nurse_patient WHERE nurseid = ? AND patientid = ?');
        $query->execute([$nurseid, $patientid]);
        return $query->rowCount();
    }

    // Desasigna un enfermero a un paciente
    function deassignToPatient($nurseid, $patientid){
        $query = $this-> getDb()->prepare('DELETE FROM nurse_patient WHERE nurseid = ? AND patientid = ?');
        $query->execute([$nurseid, $patientid]);
    }



    // * AREAS
    // Retorna los enfermeros asignados a un area en particular
    function getAssignedToArea($id){
        $query = $this-> getDb()->prepare('SELECT * FROM nurses LEFT JOIN nurse_area ON nurses.id = nurse_area.nurseid WHERE nurse_area.areaid = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Asigna un enfermero a un area
    function assignToArea($nurseid, $areaid){
        $query = $this-> getDb()->prepare('INSERT nurse_area (nurseid, areaid) VALUES (?, ?)');
        $query->execute([$nurseid, $areaid]);
    }

    // Obtiene las areas asignadas a un enfermero determinado
    function getAreasAssigned($id){
        $query = $this-> getDb()->prepare('SELECT * FROM areas LEFT JOIN nurse_area ON areas.id = nurse_area.areaid WHERE nurse_area.nurseid = ?');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Verifica que el area no este ya asignado
    function checkAssignedArea($nurseid, $areaid){
        $query = $this-> getDb()->prepare('SELECT * FROM nurse_area WHERE nurseid = ? AND areaid = ?');
        $query->execute([$nurseid, $areaid]);
        return $query->rowCount();
    }

    // Desasigna un enfermero a un area
    function deassignToArea($nurseid, $areaid){
        $query = $this-> getDb()->prepare('DELETE FROM nurse_area WHERE nurseid = ? AND areaid = ?');
        $query->execute([$nurseid, $areaid]);
    }

}
?>