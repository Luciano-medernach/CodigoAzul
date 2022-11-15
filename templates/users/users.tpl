{include "../header.tpl"}

<body>
    <a href="user-add">Agregar usuario</a>


    {if $users}
        {foreach from=$users item=user }
            <div>
                <p>{$user->name} {$user->lastname}</p>
    
                <form action="user-edit" method="GET">
                    <input type="hidden" name="id" value="{$user->id}">
                    <button>Editar</button>
                </form>
                <form action="db-user-delete" method="POST" onsubmit="return window.confirm('¿Seguro que desea eliminar el usuario?')">
                    <input type="hidden" name="id" value="{$user->id}">
                    <button>Eliminar</button>
                </form>

            </div>
        {/foreach}
    {else}
        <h3>Aun no hay usuarios registrados.</h3>

    {/if}
</body>