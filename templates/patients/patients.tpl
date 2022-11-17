{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">

    {if $patients}
        <div class="max-w-xl grid gap-6 grid-cols-3   justify-items-center  mx-auto mt-12">
        {foreach from=$patients item=patient }
            <div class=" flex flex-col box-with-shadow w-xl">
                    
                <form class="card-paciente " action="patient" method="GET">
                    <img class=" w-20  mx-auto" src="./images/paciente2.png" alt="Logo Codigo Azul">
                    <button class="text-cblue text-lg font-semibold">Ver más</button>
                    <input type="hidden" name="id" value="{$patient->id}"> 
                </form>
                <p class="text-md font-bold" >{$patient->lastname},</p>
                <p class="text-base font-bold mb-2" >{$patient->name}</p>
                    
                {if $admin}
                    <div class="flex justify-center  w-full mx-auto">
                        <form  action="patient-edit" method="GET">
                            <input type="hidden" name="id" value="{$patient->id}">
                            <button class="text-base font-semibold text-cwhite pl-2 pr-4 bg-clightgreen rounded-l-2xl">Editar</button>
                        </form>
                        <form  action="db-patient-delete" method="POST" onsubmit="return window.confirm('¿Seguro que desea eliminar el paciente?')">
                            <input type="hidden" name="id" value="{$patient->id}">
                            <button class="text-base font-semibold text-cwhite bg-cpink pr-2 pl-1 rounded-r-2xl">Eliminar</button>
                        </form>
                    </div>
                {/if}
            </div>
        {/foreach}
        {if $admin}
            <div class="mt-12 h-40 w-40 flex flex-col font-bold text-xl box-with-shadow justify-center items-center bg-cpink ">
                <img class=" w-12 mx-auto" src="./images/paciente.png" alt="Logo Codigo Azul">
                <a class=" w-full text-md text-cwhite cursor-pointer" href="patient-add">Agregar paciente</a>
            </div>
        {/if}
        </div>
    {else}
        <h3>Aun no tenemos pacientes registrados.</h3>
        {if $admin}
            <div class="mt-12 h-40 w-40 flex flex-col font-bold text-xl box-with-shadow justify-center items-center bg-cpink cursor-pointer">
                <img class=" w-12 mx-auto" src="./images/paciente.png" alt="Logo Codigo Azul">
                <a class=" w-full text-md text-cwhite " href="patient-add">Agregar paciente</a>
            </div>
        {/if}
        </div>
    {/if}
</body>