{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">

    {if $patients}
        <form action="patients" method="get" class="bg-cdarkblue flex flex-col md:flex-row items-baseline w-full lg:pl-40 mt-2 ">
            <div class="flex">
                <h2 class="bg-cblue w-28  text-cwhite text-md lg:text-lg font-semibold uppercase px-2 lg:pr-8 py-2 mr-2 lg:mr-8"> Buscador </h2>
                <input class=" mr-4 pr-4 inputs-search w-40 lg:w-60 " type="text" name="name" placeholder="Nombre o apellido" maxlength="50">
                
                <button class="cursor-pointer h-10 bg-cblue px-2">
                    <img class=" w-4 lg:w-6  h-4  lg:h-6" src="./images/buscar.png" alt="Logo Codigo Azul">
                </button>
            </div>
            <div class="flex">
                <label class="text-cdarkblue py-2 px-4 bg-cwhite" for="page"> Pagina</label>
                <select class="bg-cwhite w-12 text-center" name="page">
                    {for $i = 0 to $count}
                        <option value={$i}>{$i}</option>
                    {/for}
                </select>  
            </div>     
        </form>
        <div class="max-w-xl grid gap-8 sm:grid-cols-2 md:grid-cols-3 justify-items-center mx-auto mt-8">
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