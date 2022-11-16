{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue min-h-screen text-cdarkblue pb-20">
    {if $admin}
        <a class=" block mx-auto p-2 w-1/3 text-xl text-cwhite  bg-cpink btn-white " href="nurse-add">Agregar Personal</a>
    {/if}
    {if $nurses}
        <div class="max-w-2xl grid gap-8 grid-cols-3  justify-items-center  mx-auto mt-12 mx-20">
        
        {foreach from=$nurses item=nurse }
            
            <div class=" flex flex-col box-with-shadow w-80 ">   
                <form class="card-nurse " action="nurse" method="GET">
                    <img class=" w-32  mx-auto" src="./images/medico2.png" alt="Logo Codigo Azul">
                    <input type="hidden" name="id" value="{$nurse->id}">
                    <button class="text-lg font-semibold">Ver más</button>
                </form>
                <p class="text-2xl font-bold" >{$nurse->lastname},</p>
                <p class="text-2xl font-bold mb-4" >{$nurse->name}</p>
                 

                {if $admin}
                    <div class="flex justify-center py-2 w-full ">
                    <form action="nurse-edit" method="GET">
                        <input type="hidden" name="id" value="{$nurse->id}">
                        <button class="text-lg font-semibold text-cwhite px-4 bg-clightgreen rounded-l-2xl">Editar</button>
                    </form>
                    <form action="db-nurse-delete" method="POST" onsubmit="return window.confirm('¿Seguro que desea eliminar el enfermero?')">
                        <input type="hidden" name="id" value="{$nurse->id}">
                        <button class="text-lg font-semibold text-cwhite bg-cpink px-4 rounded-r-2xl">Eliminar</button>
                        </form>
                    </div>
                {/if}
            </div>
        {/foreach}
    {else}
        <h3>Aun no tenemos personal registrado.</h3>

    {/if}
    
    </div>
</body>