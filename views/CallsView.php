<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class CallsView extends Viewer {

        public function __construct() {
            parent::__construct();
        }

        // Muestra el listado de llamadas
        function showList($calls){
            $this->getSmarty()->assign('calls', $calls);
            $this->getSmarty()->display('templates/calls.tpl');
        }

    }
?>