<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dist/output.css">
    <link rel="icon" href="./images/logo2.png">
    <title> Codigo Azul </title>
</head>
<header class="  flex justify-between items-center h-24 text-cdarkblue w-full pt-2 ">
        <div class="btn-blue y-2 px-8" onclick="history.back()" >  
            <img class="w-12" src="./images/volver-flecha.png"  alt="Logo Codigo Azul">
        </div>
        <img class="  w-72" src="./images/logo.png"  alt="Logo Codigo Azul "  >
    {if $id}
        <p class="  text-cdarkblue font-semibold">¡Bienvenido {$username}! <a class=" btn-blue p-2 lg:pl-6 lg:pr-8" href="logout">Cerrar sesion</a></p>
    {else}
        <a class="btn-blue p-2" href="signin">Iniciar Sesion</a>
    {/if}
</header>