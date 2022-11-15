{include "../header.tpl"}	

<body>
    <form action="db-user-edit" method="POST">
        <input type="text" name="name" placeholder="Nombre" maxlength="50" value="{$user->name}" required />
        <input type="text" name="lastname" placeholder="Apellido" maxlength="50" value="{$user->lastname}" required />
        <input type="text" name="username" placeholder="Nombre de usuario" maxlength="50" value="{$user->username}" required />
        <input type="password" name="password" placeholder="Contraseña" maxlength="255" value="{$user->password}" required />
        {if $user->admin}
            <input type="checkbox" name="admin" checked />
        {else}
            <input type="checkbox" name="admin"  />
        {/if}

        <input type="hidden" name="id" value="{$user->id}" >
        <button>Editar</button>
    </form>
</body>