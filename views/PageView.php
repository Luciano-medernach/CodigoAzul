<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class PageView extends Viewer {

        public function __construct() {
            parent::__construct();
        }

        // Muestra el inicio de la pagina
        function showHome(){
            $this->getSmarty()->display('templates/home.tpl');
        }

        // Pantalla de error
        function showError(){
            $this->getSmarty()->display('templates/error.tpl');
        }

    }
?>