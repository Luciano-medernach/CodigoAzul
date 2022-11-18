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
<header class=" flex  justify-between items-center h-24 text-cdarkblue w-full md:pt-2 ">
        <div class="bg-cblue mt-4 btn md:mt-0 md:btn-blue py-2 px-2 md:px-4" onclick="history.back()" >  
            <img class=" w-4 md:w-8" src="./images/volver-flecha.png"  alt="Logo Codigo Azul">
        </div>
        <img class="mt-2  w-36  lg:w-72" src="./images/logo.png"  alt="Logo Codigo Azul "  >
        <div class="flex flex-col md:flex-row md:items-baseline">
        {if $id}
            <p class="text-base  text-cdarkblue md:pr-2">¡Bienvenido, {$username}! </p>
            <a class="bg-cblue text-cwhite mt-0 btn md:btn-blue p-0 md:p-2 lg:pl-6 lg:pr-8" href="logout">Cerrar sesion</a>
        {else}
            <a class="bg-cblue text-cwhite mt-0 btn md:btn-blue p-0 md:p-2 lg:pl-6 lg:pr-8" href="signin">Iniciar Sesion</a>
        {/if}
        </div>



        
</header>