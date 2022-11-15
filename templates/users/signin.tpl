<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./dist/output.css">
    
    <title> Codigo Azul </title>
</head>

<body class=" bg-gradient-to-r from-cblue  to-cdarkblue h-screen ">
    <img class=" mx-auto w-60 pt-6" src="./images/logo2white.png" alt="Logo Codigo Azul">
    <h1 class="py-12 font-bold text-center text-cwhite text-4xl">Iniciar sesion</h1>



    <form class="mx-auto flex flex-col items-center " action="db-signin" method="POST">
        <div class="bg-cdarkblue/60 w-80 box-with-shadow py-12">
            <input class="text-cwhite inputs-form" type="text" name="user" placeholder="Usuario" maxlength="50" required>
            <div class="w-2/3 h-1 mx-auto bg-gradient-to-r from-cblue  to-cdarkblue"></div>
            <input class="text-cwhite inputs-form " type="password" name="password" placeholder="Contraseña" maxlength="64" required>
            <div class="w-2/3 h-1 mx-auto  bg-gradient-to-r from-cblue  to-cdarkblue"></div>
            {if $error}
                    <p>{$error}</p>
                {/if}
        </div>
        <input class="btn-white " type="submit" value="Ingresar">
    </form>
</body>