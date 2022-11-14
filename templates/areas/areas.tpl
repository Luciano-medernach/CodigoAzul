{include "../header.tpl"}

<body>
    {if $admin}
        <form action="db-area-add" method="POST">
            <input type="text" name="title" placeholder="Nombre" maxlength="50" required>
            <button>+</button>
        </form>
    {/if}

    {if $areas}
        {foreach from=$areas item=area }
            <div>
                <p>{$area->name}</p>

                {if $admin}
                    <form action="area-edit" method="GET">
                        <input type="hidden" name="id" value="{$area->id}">
                        <button>Editar</button>
                    </form>
                    <form action="db-area-delete" onclick="return window.confirm('¿Seguro que desea eliminar el area?')" method="POST">
                        <input type="hidden" name="id" value="{$area->id}">
                        <button>Eliminar</button>
                    </form>
                {/if}
            </div>
        {/foreach}
    {else}
        <h3>Aun no tenemos areas registradas.</h3>

    {/if}


</body>