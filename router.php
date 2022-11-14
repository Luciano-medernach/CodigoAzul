<?php
    // Define la URL base
    define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');


    // Requiere los controladores
    require_once("controllers/UsersController.php");
    require_once("controllers/PageController.php");


    // Instancia los controladores
    $usersController = new UsersController();
    $pageController = new PageController();



    // Si la accion esta vacia, redirige al home
    if($_GET['action']=='')
    $_GET['action']= 'home';

    // Divide la URL para obtener los valores
    $urlParts = explode('/',$_GET['action']);

    switch($urlParts[0]){
        // Show interactions
        // * Page View
        case "home":
            $pageController->showHome(); 
            break;

        default:
            $pageController->showError();
            break;
    }
?>