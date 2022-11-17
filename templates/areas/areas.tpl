{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">
<h3 class="pl-4 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite"> Areas  </h3>

    {if $admin}
        <form class="mt-4 flex justify-center" action="db-area-add" method="POST">
            <input class="px-8 py-2" type="text" name="name" placeholder="Nombre" maxlength="50" required>
            <button class="px-4 text-2xl font-semibold text-cwhite bg-cpink ">+</button>
        </form>
    {/if}

    <div class="max-w-2xl  justify-items-center  mx-auto mt-12 pb-12">
        
        {if $areas}
            <div class=" flex flex-col box-with-shadow w-full grid gap-6  grid-cols-2 "> 
            {foreach from=$areas item=area }
                <div id="area-container">
                    <p class="font-bold text-2xl pb-2" id="area-{$area->id}">{$area->name}</p>
                    <form action="area" method="GET">
                        <input type="hidden" name="id" value="{$area->id}">
                        <button class="px-8 font-semibold bg-clightblue uppercase">Ver </button>
                    </form>
                    <div id="sub-area-container" class="mt-2 flex justify-center  w-full mx-auto">
                    {if $admin}
                    
                        <button id="button-{$area->id}" onclick="edit({$area->id})" class="text-base px-4 font-semibold text-cwhite bg-cpink  rounded-2xl">Editar</button>
    
                        <form action="db-area-delete" onsubmit="return window.confirm('¿Seguro que desea eliminar el area?')" method="POST">
                            <input type="hidden" name="id" value="{$area->id}">
                            <button class="text-base px-4 font-semibold text-cwhite bg-cpink  rounded-2xl">Eliminar</button>
                
                        </form>
                    {/if}
                    </div>
                </div>
            {/foreach}
            </div>
        {else}
            <h3>Aun no tenemos areas registradas.</h3>

        {/if}
    </div>
    <script src="./js/area.js"></script>
</body>