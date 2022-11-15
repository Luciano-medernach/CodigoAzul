<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dist/output.css">
    <title> Codigo Azul </title>
</head>
<header class="flex justify-between items-center h-24 text-cdarkblue w-full mt-8">
    {if $id}
        <p class="font-bold pl-12">¡Bienvenido {$username}!</p>
        <img class=" blur-sm w-80" src="./images/logo.png" alt="Logo Codigo Azul">
        <a class="btn-blue p-2 pr-12" href="logout">Cerrar sesion</a>
    {else}
        <img class=" ml-6 w-80" src="./images/logo.png" alt="Logo Codigo Azul">
        <a class="btn-blue p-2" href="signin">Iniciar Sesion</a>
    {/if}
</header>