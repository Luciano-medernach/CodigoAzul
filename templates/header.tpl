<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dist/output.css">
    <title> Codigo Azul </title>
</head>
<header class="flex justify-between items-center h-24 text-cdarkblue w-full mt-4 mb-8">
    {if $id}
        <a class="btn-blue p-2 pr-8" href="home">Volver</a>
        <img class=" blur-sm w-80" src="./images/logo.png" alt="Logo Codigo Azul">
        <p class="p-2  text-cdarkblue">¡Bienvenido {$username}!</p>
        <a class="btn-blue p-2 pr-8" href="logout">Cerrar sesion</a>
    {else}
        <img class=" ml-6 w-80" src="./images/logo.png" alt="Logo Codigo Azul">
        <a class="btn-blue p-2" href="signin">Iniciar Sesion</a>
    {/if}
</header>