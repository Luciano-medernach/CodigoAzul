{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">
<h3 class="pl-4 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite"> Areas  </h3>

    {if $areas}
        <form class="bg-cdarkblue  flex flex-col md:flex-row items-baseline w-full lg:pl-40 mt-2  " action="areas" method="GET">
        <div class="flex">
            <h2 class="bg-cblue w-28  text-cwhite text-md lg:text-lg font-semibold uppercase px-2 lg:pr-8 py-2 mr-2 lg:mr-8"> Buscador </h2>
            <input class=" mr-4 pr-4 inputs-search w-40 lg:w-60" type="text" name="name" placeholder="Nombre" value="{$name}" maxlength="50">
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
        </form >
    {/if}   

    {if $admin}
        <form class="mt-4 flex justify-center" action="db-area-add" method="POST">
            <input class="px-8 py-2" type="text" name="name" placeholder="Nombre" maxlength="50" required>
            <button class="px-4 text-2xl font-semibold text-cwhite bg-cpink ">+</button>
        </form>
    {/if}

    <div class="max-w-2xl  justify-items-center  mx-auto mt-12 pb-12">
        
        {if $areas}
            <div class=" flex flex-col mx-auto w-full grid gap-6-full max-w-xl  sm:grid-cols-2 "> 
            {foreach from=$areas item=area }
                <div class="box-with-shadow mx-2" id="area-container">
                    <p class="name font-bold text-2xl pb-2" id="area-{$area->id}">{$area->name}</p>
                    <form action="area" method="GET">
                        <input type="hidden" name="id" value="{$area->id}">
                        <button class="px-8 font-semibold bg-clightblue uppercase">Ver </button>
                    </form>
                    <div id="sub-area-container" class="mt-2 flex justify-center  w-full mx-auto">
                    {if $admin}
                    
                        <button id="button-{$area->id}" onclick="edit({$area->id})" class="text-md font-semibold text-cwhite px-2 bg-clightgreen rounded-l-2xl">Editar</button>
    
                        <form action="db-area-delete" onsubmit="return window.confirm('¿Seguro que desea eliminar el area?')" method="POST">
                            <input type="hidden" name="id" value="{$area->id}">
                            <button class="text-md font-semibold text-cwhite bg-cpink px-2 rounded-r-2xl">Eliminar</button>
                
                        </form>
                    {/if}
                    </div>
                </div>
            {/foreach}
            </div>
        {else}
            <h3 class="text-lg font-semibold">Aun no tenemos areas registradas.</h3>

        {/if}
    </div>
    <script src="./js/area.js"></script>
</body>