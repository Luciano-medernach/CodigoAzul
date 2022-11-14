<?php
    class AuthHelper{
        // Inicia la sesion si no esta ya iniciada
        static private function start() {
            if (session_status() != PHP_SESSION_ACTIVE){
                session_start();
            }
        }
    
        // Establece todas las variables del usuario en su sesion
        static public function login($user) {
            self::start();
            $_SESSION['id'] = $user->id;
            $_SESSION['username'] = $user->name;
            $_SESSION['admin'] = $user->admin;
        }
    
        // Destruye la sesion
        public static function logout() {
            self::start();
            session_destroy();
        }
    
        // Checkea que el usuario este logueado, de lo contrario lo envia al login
        public static function checkLoggedIn() {
            self::start();
            if (!isset($_SESSION['id'])){
                header('Location: ' . BASE_URL . "login");
                die;
            }
        }

        public static function getLoggedUserId(){
            self::start();
            if (isset($_SESSION['id'])) {
                return $_SESSION['id'];
            } else {
                return false;
            }
        }
    
        // Retorna el nombre de usuario actual
        public static function getLoggedUserName() {
            self::start();
            if (isset($_SESSION['username'])) {
                return $_SESSION['username'];
            } else {
                return false;
            }
        }
    
        // Verifica si el usuario es administrador o no
        public static function adminStatus() {
            self::start();
            if (isset($_SESSION['admin'])) {
                return ($_SESSION['admin']);
            } else {
                return false;
            }
        }
    }
?>