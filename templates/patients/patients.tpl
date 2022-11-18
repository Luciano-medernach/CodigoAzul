{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">

    {if $patients}
        <div class="bg-cdarkblue inline-flex w-full pl-40 mt-2 ">
            <h2 class="bg-cblue w-48 text-md text-cwhite text-lg font-bold uppercase pl-2 pr-8 py-1 mr-8"> B u s c a d o r </h2>

            <input class="inputs-search mr-8 pr-4 inputs-form w-60" type="text" id="name-search" placeholder="Nombre" maxlength="50">
            <input class="inputs-search inputs-form w-60" type="text" id="lastname-search" placeholder="Apellido" maxlength="50">
            <button class="cursor-pointer h-10 bg-cblue px-2">
                <img class=" w-6  h-6 " src="./images/buscar.png" alt="Logo Codigo Azul">
            </button>
                        
        </div>
        <div class="max-w-xl grid gap-8 grid-cols-3 justify-items-center mx-auto mt-8">
        {foreach from=$patients item=patient }
            <div class=" flex flex-col box-with-shadow ">
                    
                <form class="card-paciente " action="patient" method="GET">
                    <img class=" w-20  mx-auto" src="./images/paciente2.png" alt="Logo Codigo Azul">
                    <button class="text-cblue text-lg font-semibold">Ver más</button>
                    <input type="hidden" name="id" value="{$patient->id}"> 
                </form>
                {if $patient->lastname}
                    <p class="lastname text-md font-bold" >{$patient->lastname},</p>
                {/if}
                <p class="name text-base font-bold mb-2" >{$patient->name}</p>
                    
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
        </input>
    {/if}

    <script src="./js/search.js"></script>
</body>