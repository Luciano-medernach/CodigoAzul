{include "../header.tpl"}

<body>
    {if $admin}
        <a href="nurse-add">Agregar Personal</a>
    {/if}
    {if $nurses}
        {foreach from=$nurses item=nurse }
            <div>
                <p>{$nurse->name} {$nurse->lastname}</p>
                <form action="nurse" method="GET">
                    <input type="hidden" name="id" value="{$nurse->id}">
                    <button>Ver</button>
                </form>
                {if $admin}
                    <form action="nurse-edit" method="GET">
                        <input type="hidden" name="id" value="{$nurse->id}">
                        <button>Editar</button>
                    </form>
                    <form action="db-nurse-delete" method="POST" onsubmit="return window.confirm('¿Seguro que desea eliminar el enfermero?')">
                        <input type="hidden" name="id" value="{$nurse->id}">
                        <button>Eliminar</button>
                    </form>
                {/if}
            </div>
        {/foreach}
    {else}
        <h3>Aun no tenemos personal registrado.</h3>

    {/if}
</body>