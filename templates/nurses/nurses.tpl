{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue min-h-screen text-cdarkblue pb-20">
        
    <form action="nurses" method="GET" class="bg-cdarkblue  flex flex-col md:flex-row items-baseline w-full lg:pl-40 mt-2 ">
        <div class="flex">
            <h2 class="bg-cblue w-28  text-cwhite text-md lg:text-lg font-semibold uppercase px-2 lg:pr-8 py-2 mr-2 lg:mr-8"> Buscador </h2>
            <input class=" mr-4 pr-4 inputs-search w-40 lg:w-60 "type="text" id="name-search" name="name" value="{$name}" placeholder="Nombre" maxlength="50">
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

    {if $admin}
        <a class="mt-4 block mx-auto p-2 w-60 sm:w-80 text-xl text-cwhite  bg-cpink btn-white " href="nurse-add">Agregar Personal</a>
    {/if}
    {if $nurses}




       
        <div class=" grid gap-8 sm:grid-cols-2 lg:grid-cols-4 justify-items-center  mx-auto mt-8 mx-20">
        
        {foreach from=$nurses item=nurse }
            
            <div class=" flex flex-col box-with-shadow w-44 ">   
                <form class="card-nurse " action="nurse" method="GET">
                    <img class=" w-20 m-2 mx-auto" src="./images/medico2.png" alt="Logo Codigo Azul">
                    <input type="hidden" name="id" value="{$nurse->id}">
                    <button class="text-cblue/50 text-lg font-semibold">Ver más</button>
                </form>
                <p class="lastname text-xl font-bold" >{$nurse->lastname},</p>
                <p class="name text-lg font-bold mb-4" >{$nurse->name}</p>
                 

                {if $admin}
                    <div class="flex justify-center w-full ">
                    <form action="nurse-edit" method="GET">
                        <input type="hidden" name="id" value="{$nurse->id}">
                        <button class="text-lg font-semibold text-cwhite px-2 bg-clightgreen rounded-l-2xl">Editar</button>
                    </form>
                    <form action="db-nurse-delete" method="POST" onsubmit="return window.confirm('¿Seguro que desea eliminar el enfermero?')">
                        <input type="hidden" name="id" value="{$nurse->id}">
                        <button class="text-lg font-semibold text-cwhite bg-cpink px-2 rounded-r-2xl">Eliminar</button>
                        </form>
                    </div>
                {/if}
            </div>
        {/foreach}
    {else}
        <h3>Aun no tenemos personal registrado.</h3>

    {/if}
    
    </div>
    <script src="./js/search.js"></script>
</body>