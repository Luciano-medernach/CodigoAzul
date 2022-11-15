{include "header.tpl"}

<body class=" bg-gradient-to-b from-cwhite to-clightblue h-screen">
    <div class="grid gap-8 grid-cols-3  mt-10 max-w-3xl mx-auto ">

        <div onclick="window.location='calls';" class="col-start-1 col-end-3 bg-cpink/25 box-with-shadow w-full h-full ">
            <img class=" w-20 mx-auto" src="./images/latido-del-corazon.png" alt="Logo Codigo Azul">
            <h2>Llamadas</h2>
            {if $calls}
                {foreach from=$calls item=call}
                    <p>Urgencia en: {$call->area}</p>
                    <p>Fecha: {$call->date}</p>
                {/foreach}
            {else}
                <p>Aun no hay ninguna urgencia.</p>
            {/if}
        </div>
        <div onclick="window.location='areas';" class=" text-cdarkblue/80 box-with-shadow bg-clightblue w-full h-full uppercase flex flex-col justify-center">
            <h1 class="text-md">Tiempo estimado de respuesta </h1> 
            <p class="text-7xl font-bold ">01:35</p>
            <p class="text-md uppercase"> m i n u t o s </p>
        </div>

        <div onclick="window.location='patients';" class="box-with-shadow w-full h-full">    
            <img class=" w-32 mx-auto" src="./images/reporte-de-salud.png" alt="Logo Codigo Azul">
            <h2>Pacientes</h2>
            {if $patients}
                {foreach from=$patients item=patient}
                    <p>{$patient->name} {$patient->lastname}</p>
                {/foreach}
            {else}
                <p>Aun no hay ningun paciente.</p>
            {/if}
        </div>

        <div onclick="window.location='nurses';" class="box-with-shadow w-full h-full">
            <img class=" w-32 mx-auto" src="./images/medico.png" alt="Logo Codigo Azul">
            <h2>Personal medico</h2>
            {if $nurses}
                {foreach from=$nurses item=nurse}
                    <p>{$nurse->name} {$nurse->lastname}</p>
                {/foreach}
            {else}
                <p>Aun no tenemos personal.</p>
            {/if}
        </div>

        <div onclick="window.location='areas';" class="box-with-shadow w-full h-full">
            <img class=" w-32 mx-auto" src="./images/latido-del-corazon.png" alt="Logo Codigo Azul">
            <h2>Areas</h2>
            {if $areas}
                {foreach from=$areas item=area}
                    <p>{$area->name}</p>
                {/foreach}
            {else}
                <p>Aun no hay ningun area.</p>
            {/if}
        </div>

        <div onclick="window.location='areas';" class="box-with-shadow w-full h-full">
            <img class=" w-32 mx-auto" src="./images/estadistica-inferencial.png" alt="Logo Codigo Azul">
            <h2>Reportes</h2> 
            {if $areas}
                {foreach from=$areas item=area}
                    <p>{$area->name}</p>
                {/foreach}
            {else}
                <p>Aun no hay reportes.</p>
            {/if}
        </div>
        
        {if $admin}
            <div onclick="window.location='users';" class="box-with-shadow w-full h-full">
                <img class=" w-32 mx-auto" src="./images/usuario.png" alt="Logo Codigo Azul">
                <h2>Usuarios</h2>
                {if $users}
                    {foreach from=$users item=user}
                        <p>{$user->name} {$user->lastname}</p>
                    {/foreach}
                {else}
                    <p>Aun no hay ningun usuario.</p>
                {/if}
            </div>
        {/if}
    </div>

    
</body>