{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">
<h3 class="font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite"> Usuarios  </h3>
    
    
        <form action="users" method="get" class="bg-cdarkblue inline-flex w-full pl-40 mt-2 ">
            <h2 class="bg-cblue w-48 text-md text-cwhite text-lg font-bold uppercase pl-2 pr-8 py-1 mr-8"> B u s c a d o r </h2>
            <input class="mr-8 pr-4 inputs-search w-60 " type="text" name="name" placeholder="Nombre o apellido" value="{$name}" maxlength="50">
            
            <button class="cursor-pointer h-10 bg-cblue px-2">
                <img class=" w-6  h-6 " src="./images/buscar.png" alt="Logo Codigo Azul">
            </button>
            <label class="text-cdarkblue py-2 px-4 bg-cwhite" for="page"> Pagina</label>
            <select class="bg-cwhite w-12 text-center" name="page">
                {for $i = 0 to $count}
                    <option value={$i}>{$i}</option>
                {/for}
            </select>  
            
        </form >

        {if $users}
        <div class="max-w-2xl grid gap-6 grid-cols-2   justify-items-center  mx-auto mt-12 pb-12">
        {foreach from=$users item=user }
            <div class=" flex flex-col box-with-shadow w-80">
            {if $user->admin}
                <p class="name text-xl font-bold mb-4 text-cwhite bg-cblue " >{$user->lastname}, {$user->name}</p>
            {else}
                <p class="text-xl font-bold mb-4" >{$user->lastname}, {$user->name}</p>
            {/if}

            <div class="flex justify-center  w-full mx-auto">
                <form action="user-edit" method="GET">
                    <input type="hidden" name="id" value="{$user->id}">
                    <button class="text-base font-semibold text-cwhite pl-2 pr-4 bg-clightgreen rounded-l-2xl">Editar</button>
                </form>
                <form action="db-user-delete" method="POST" onsubmit="return window.confirm('¿Seguro que desea eliminar el usuario?')">
                    <input type="hidden" name="id" value="{$user->id}">
                    <button class="text-base font-semibold text-cwhite bg-cpink pr-2 pl-1 rounded-r-2xl">Eliminar</button>
                </form>
            </div>
        </div>
        {/foreach}
        </div>
    {else}
        <h3>Aun no hay usuarios registrados.</h3>

    {/if}

    <a class=" block mx-auto p-2 w-60 text-xl text-cwhite  bg-cblue btn-white " href="user-add">Agregar usuario</a>
    <script src="./js/userSearch.js"></script>
</body>
