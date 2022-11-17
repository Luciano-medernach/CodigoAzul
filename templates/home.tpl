{include "header.tpl"}

<body class=" bg-gradient-to-b from-cwhite to-clightblue min-h-screen ">
    <div class="w-1/2 grid gap-8 grid-cols-3 mt-10 max-w-3xl mx-auto pb-20">

        <div onclick="window.location='calls';" class="cursor-pointer col-start-1 col-end-3 bg-cpink/25 box-with-shadow w-full h-full ">
            <img class=" w-16 mx-auto" src="./images/latido-del-corazon.png" alt="Logo Codigo Azul">
            <h2>Llamadas</h2>
            {if $calls}
                {foreach from=$calls item=call}
                    <p>Urgencia en: {$call->area}</p>
                    <p>Fecha: {$call->date}</p>
                {/foreach}
           
            {/if}
        </div>
        <div class=" text-cdarkblue/80 box-with-shadow bg-clightblue w-full h-full uppercase flex flex-col justify-center">
            <h1 class="text-md">Tiempo estimado de respuesta </h1> 
            <p class="text-5xl font-bold ">{$averageTime}</p>
            <p class="text-md uppercase"> s e g u n d o s </p>
        </div>

        <div onclick="window.location='patients';" class="cursor-pointer box-with-shadow w-full h-full">    
            <img class=" w-24 mx-auto" src="./images/reporte-de-salud.png" alt="Logo Codigo Azul">
            <h2>Pacientes</h2>
            {* {if $patients}
                {foreach from=$patients item=patient}
                    <p>{$patient->lastname}, {$patient->name}</p>
                {/foreach}
            {else}
                <p>Aun no hay ningun paciente.</p>
            {/if} *}
        </div>

        <div onclick="window.location='nurses';" class="cursor-pointer box-with-shadow w-full h-full">
            <img class=" w-24 mx-auto" src="./images/medico.png" alt="Logo Codigo Azul">
            <h2>Personal medico</h2>
            {* {if $nurses}
                {foreach from=$nurses item=nurse}
                    <p>{$nurse->name} {$nurse->lastname}</p>
                {/foreach}
            {else}
                <p>Aun no tenemos personal.</p>
            {/if} *}
        </div>

        <div onclick="window.location='areas';" class="cursor-pointer box-with-shadow w-full h-full">
            <img class=" w-24 mx-auto" src="./images/latido-del-corazon.png" alt="Logo Codigo Azul">
            <h2>Areas</h2>
            {* {if $areas}
                {foreach from=$areas item=area}
                    <p>{$area->name}</p>
                {/foreach}
            {else}
                <p>Aun no hay ningun area.</p>
            {/if} *}
        </div>

        <div onclick="window.location='reports';" class="cursor-pointer box-with-shadow w-full h-full">
            <img class=" w-24 mx-auto" src="./images/estadistica-inferencial.png" alt="Logo Codigo Azul">
            <h2>Reportes</h2> 
            {* {if $areas}
                {foreach from=$areas item=area}
                    <p>{$area->name}</p>
                {/foreach}
            {else}
                <p>Aun no hay reportes.</p>
            {/if} *}
        </div>
        
        {if $admin}
            <div onclick="window.location='users';" class=" cursor-pointer box-with-shadow w-full h-full">
                <img class=" w-24 mx-auto" src="./images/usuario.png" alt="Logo Codigo Azul">
                <h2>Usuarios</h2>
                {* {if $users}
                    {foreach from=$users item=user}
                        <p>{$user->name} {$user->lastname}</p>
                    {/foreach}
                {else}
                    <p>Aun no hay ningun usuario.</p>
                {/if} *}
            </div>
        {/if}
    </div>

    
</body>