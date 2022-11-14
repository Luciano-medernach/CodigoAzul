<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class AreasView extends Viewer {

        public function __construct() {
            parent::__construct();
        }

        // Muestra el listado de areas
        function showList($areas){
            $this->getSmarty()->assign('areas', $areas);
            $this->getSmarty()->display('templates/areas.tpl');
        }

        // Muestra el formulario de adicion de areas
        function showAdd(){
            $this->getSmarty()->display('templates/areasAdd.tpl');
        }

        // Muestra el formulario de adicion de areas
        function showEdit($areas){
            $this->getSmarty()->assign('areas', $areas);
            $this->getSmarty()->display('templates/areasEdit.tpl');
        }

    }
?>