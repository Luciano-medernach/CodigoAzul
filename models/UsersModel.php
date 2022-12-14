<?php

require_once('Model.php');

class UsersModel extends Model {

    // Retorna todos los usuarios indexado
    function getAllByPage($page){
        $page = $page * 50;
        $query = $this-> getDb()->prepare('SELECT * FROM users LIMIT '.$page.' , 50');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

     // Retorna todos los usuarios
    function getAll(){
        $query = $this-> getDb()->prepare('SELECT * FROM users');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna la cantidad de usuarios
    function getCount(){
        $query = $this-> getDb()->prepare('SELECT Count(id) as count FROM users');
        $query->execute();
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Retorna la cantidad de usuarios por nombre
    function getCountByName($name){
        $query = $this-> getDb()->prepare('SELECT Count(id) as count FROM users WHERE name LIKE ? OR lastname LIKE ?');
        $query->execute([$name."%", $name."%"]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Retorna usuarios por nombre
    function getByName($name, $page){
        $query = $this-> getDb()->prepare('SELECT * FROM users WHERE name LIKE ? OR lastname LIKE ? LIMIT '.$page.', 50');
        $query->execute([$name."%", $name."%"]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna los ultimos usuarios
    function getLast(){
        $query = $this-> getDb()->prepare('SELECT * FROM users ORDER BY id DESC LIMIT 5');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    // Retorna un usuario por id
    function getById($id){
        $query = $this-> getDb()->prepare('SELECT * FROM users WHERE id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    // Retorna un usuario por su nombre de usuario
    function getByUsername($username){
        $query = $this-> getDb()->prepare('SELECT * FROM users WHERE username = ?');
        $query->execute([$username]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
    
    // Agregar un usuario
    function add($name, $lastname, $username, $password, $admin){
        $query = $this-> getDb()->prepare('INSERT INTO users (name, lastname, username, password, admin) VALUES (?, ?, ?, ?, ?)');
        $query->execute([$name, $lastname, $username, $password, $admin]);
    }

    // Edita un usuario
    function edit($id, $name, $lastname, $username, $password, $admin){
        $query = $this-> getDb()->prepare('UPDATE users SET name = ?, lastname = ?, username = ?, password = ?, admin = ? WHERE id = ?');
        $query->execute([$name, $lastname, $username, $password, $admin, $id]);
    }

    // Elimina un usuario
    function delete($id){
        $query = $this-> getDb()->prepare('DELETE FROM users WHERE id = ?');
        $query->execute([$id]);
    }

    // Verifica que el nombre de usuario no exista
    function checkUsername($username){
        $query = $this-> getDb()->prepare('SELECT * FROM users WHERE username = ?');
        $query->execute([$username]);
        return $query->rowCount();
    }

}
?>