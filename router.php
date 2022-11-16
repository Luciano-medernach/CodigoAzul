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
        // * AJAX
        case "ajax-report":
            $pageController->createReport();
            break;


        // * VIEW ACTIONS
        // * Page View
        case "home":
            $pageController->showHome(); 
            break;

        case "reports":
            $pageController->showReports();
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

        case "patient-edit":
            $patientsController->showEdit();
            break;

        // * Nurses View
        case "nurses":
            $nursesController->showList();
            break;

        case "nurse":
            $nursesController->show();
            break;

        case "nurse-add":
            $nursesController->showAdd();
            break;

        case "nurse-edit":
            $nursesController->showEdit();
            break;

        // * Areas View
        case "area":
            $areasController->show();
            break;

        case "areas":
            $areasController->showList();
            break;

        // * Users View
        case "signin":
            $usersController->showSignin();
            break;

        case "users":
            $usersController->showList();
            break;

        case "user-add":
            $usersController->showAdd();
            break;

        case "user-edit":
            $usersController->showEdit();
            break;

        // * DB ACTIONS
        // * Patients Model
        case "db-patient-add":
            $patientsController->add();
            break;

        case "db-patient-edit":
            $patientsController->edit();
            break;

        case "db-patient-delete":
            $patientsController->delete();
            break;

        case "db-patient-assign-nurse":
            $patientsController->assignNurse();
            break;

        case "db-patient-deassign-nurse":
            $patientsController->deassignNurse();
            break;

        // * Nurses Model
        case "db-nurse-add":
            $nursesController->add();
            break;

        case "db-nurse-edit":
            $nursesController->edit();
            break;

        case "db-nurse-delete":
            $nursesController->delete();
            break;
            
        // * Areas Model
        case "db-area-add":
            $areasController->add();
            break;

        case "db-area-edit":
            $areasController->edit();
            break;

        case "db-area-delete":
            $areasController->delete();
            break;

        case "db-area-assign-patient":
            $areasController->assignPatient();
            break;

        case "db-area-deassign-patient":
            $areasController->deassignPatient();
            break;

        case "db-area-assign-nurse":
            $areasController->assignNurse();
            break;

        case "db-area-deassign-nurse":
            $areasController->deassignNurse();
            break;

        case "db-area-assign-origin":
            $areasController->assignOrigin();
            break;

        case "db-area-deassign-origin":
            $areasController->deassignOrigin();
            break;

        // * Users Model
        case "db-signin":
            $usersController->signin();
            break;

        case "db-user-add":
            $usersController->add();
            break;

        case "db-user-edit":
            $usersController->edit();
            break;

        case "db-user-delete":
            $usersController->delete();
            break;


        case "logout":
            $usersController->logout();
            break;

        default:
            $pageController->showError();
            break;
    }
?>