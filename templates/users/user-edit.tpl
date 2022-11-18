{include "../header.tpl"}	


<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">
<h3 class="pl-4 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite"> Editar usuario  </h3>
    
 
    <form class=" mx-auto items-center flex flex-col box-with-shadow w-full max-w-2xl mt-12" action="db-user-edit" method="POST">
        <label class="mt-4 bg-cpink w-full text-cdarkgray font-semibold" for="name">Nombre</label>
        <input class="inputs-form" type="text" name="name" placeholder="Nombre" maxlength="50" value="{$user->name}" required />
        <label class="bg-cpink w-full text-cdarkgray font-semibold" for="name">Apellido</label>
        <input class="inputs-form" type="text" name="lastname" placeholder="Apellido" maxlength="50" value="{$user->lastname}" required />
        <label class="bg-cpink w-full text-cdarkgray font-semibold" for="username">Nombre de usuario</label>
        <input class="inputs-form" type="text" name="username" placeholder="Nombre de usuario" maxlength="50" value="{$user->username}" required />
        <label class="bg-cpink w-full text-cdarkgray font-semibold" for="password">Contraseña</label>
        <input class="inputs-form" type="password" name="password" placeholder="Contraseña" maxlength="255" value="{$user->password}" required />
        <div class="flex pb-4">
            {if $user->admin}
                <label class=" text-cdarkgray font-semibold" for="admin">Es admin</label>
                <input class="ml-4 " type="checkbox" name="admin" checked />
            {else}
                <input type="checkbox" name="admin" />
            {/if}
        </div>
        <input type="hidden" name="id" value="{$user->id}" >
        <button class="btn-blue w-40">Editar</button>
    </form>
</body>