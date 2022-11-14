<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Codigo Azul</title>
</head>
<header>
    <img src="./images/logo.png" alt="Logo Codigo Azul">
    {if $id}
        <p>Bienvenido {$username}!</p>
        <a href="logout">Cerrar sesion</a>
    {else}
        <a href="signin">Iniciar Sesion</a>
    {/if}
</header>