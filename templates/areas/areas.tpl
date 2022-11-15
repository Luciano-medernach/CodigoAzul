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
            <div id="area-container">
                <p id="area-{$area->id}">{$area->name}</p>

                {if $admin}
                    <button id="button-{$area->id}" onclick="edit({$area->id})">Editar</button>

                    <form action="db-area-delete" onsubmit="return window.confirm('¿Seguro que desea eliminar el area?')" method="POST">
                        <input type="hidden" name="id" value="{$area->id}">
                        <button>Eliminar</button>
                    </form>
                {/if}
            </div>
        {/foreach}
    {else}
        <h3>Aun no tenemos areas registradas.</h3>

    {/if}

    <script src="./js/area.js"></script>
</body>