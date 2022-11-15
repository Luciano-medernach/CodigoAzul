{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue h-screen text-cdarkblue">
    {if $admin}
        <a class=" block mx-auto p-2 w-1/3 text-3xl text-cwhite  bg-cpink btn-white " href="patient-add">Agregar paciente</a>
    {/if}
    {if $patients}
        <div class="mt-12 grid gap-6 grid-cols-2 grid-rows-3 justify-items-center mx-auto   mx-20">
        {foreach from=$patients item=patient }
            <div class=" flex flex-col box-with-shadow w-2/3  ">
                    
                <form class="card-paciente " action="patient" method="GET">
                    <img class=" w-28  mx-auto" src="./images/paciente2.png" alt="Logo Codigo Azul">
                    <button class="mt-2 text-2xl font-semibold">Ver más</button>
                    <input type="hidden" name="id" value="{$patient->id}"> 
                </form>
                <p class="text-2xl font-bold" >{$patient->lastname},</p>
                <p class="text-2xl font-bold mb-4" >{$patient->name}</p>
                    
                {if $admin}
                    <div class="flex justify-center py-2 w-full ">
                        <form  action="patient-edit" method="GET">
                        
                            <input type="hidden" name="id" value="{$patient->id}">
                            <button class="text-lg font-semibold text-cwhite px-4 bg-clightgreen rounded-l-2xl">Editar</button>
                        </form>
                        <form  action="db-patient-delete" method="POST" onsubmit="return window.confirm('¿Seguro que desea eliminar el paciente?')">
                            <input type="hidden" name="id" value="{$patient->id}">
                            <button class="text-lg font-semibold text-cwhite bg-cpink px-4 rounded-r-2xl">Eliminar</button>
                        </form>
                    </div>
                {/if}
            </div>
        {/foreach}
        </div>
    {else}
        <h3>Aun no tenemos pacientes registrados.</h3>

    {/if}
</body>