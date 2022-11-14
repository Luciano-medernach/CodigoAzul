<?php
    // Define la URL base
    define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');


    // Requiere los controladores
    require_once("controllers/UsersController.php");
    require_once("controllers/PageController.php");
    require_once("controllers/PatientsController.php");
    require_once("controllers/AreasController.php");
    require_once("controllers/NursesController.php");


    // Instancia los controladores
    $usersController = new UsersController();
    $pageController = new PageController();
    $patientsController = new PatientsController();
    $areasController = new AreasController();
    $nursesController = new NursesController();



    // Si la accion esta vacia, redirige al home
    if($_GET['action']=='')
    $_GET['action']= 'home';

    // Divide la URL para obtener los valores
    $urlParts = explode('/',$_GET['action']);

    switch($urlParts[0]){
        // * VIEW ACTIONS
        // * Page View
        case "home":
            $pageController->showHome(); 
            break;

        // * Patients View
        case "patients":
            $patientsController->showList();
            break;

        case "patient":
            $patientsController->show();
            break;

        case "patient-add":
            $patientsController->showAdd();
            break;

        // * Nurses View
        case "nurses":
            $nursesController->showList();
            break;

        case "nurse-add":
            $nursesController->showAdd();
            break;

        // * Areas View
        case "areas":
            $areasController->showList();
            break;

        // * Users View
        case "signin":
            $usersController->showSignin();
            break;
        

        // * DB ACTIONS
        // * Nurses Model
        case "db-nurse-add":
            $nursesController->add();
            break;

        case "db-nurse-delete":
            $nursesController->delete();
            break;
            
        // * Areas Model
        case "db-area-add":
            $areasController->add();
            break;

        case "db-area-delete":
            $areasController->delete();
            break;

        // * Users Model
        case "db-signin":
            $usersController->signin();
            break;



        case "logout":
            $usersController->logout();
            break;

        default:
            $pageController->showError();
            break;
    }
?>