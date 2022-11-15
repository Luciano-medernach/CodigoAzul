{include "../header.tpl"}

<body>
    {if $admin}
        <a href="user-add">Agregar usuario</a>
    {/if}

    {if $users}
        {foreach from=$users item=user }
            <div>
                <p>{$user->name} {$user->lastname}</p>
                <form action="user" method="GET">
                    <input type="hidden" name="id" value="{$user->id}">
                    <button>Ver</button>
                </form>
                {if $admin}
                    <form action="user-edit" method="GET">
                        <input type="hidden" name="id" value="{$user->id}">
                        <button>Editar</button>
                    </form>
                    <form action="db-user-delete" method="POST" onsubmit="return window.confirm('¿Seguro que desea eliminar el usuario?')">
                        <input type="hidden" name="id" value="{$user->id}">
                        <button>Eliminar</button>
                    </form>
                {/if}
            </div>
        {/foreach}
    {else}
        <h3>Aun no tenemos usuarios registrados.</h3>

    {/if}
</body>