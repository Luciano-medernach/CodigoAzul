{include "../header.tpl"}	

<body>
    <form class="box-with-shadow w-60 mt-12" action="db-patient-add" method="POST">
        <input type="text" name="name" placeholder="Nombre" maxlength="50" required />
        <input type="text" name="lastname" placeholder="Apellido" maxlength="50" required />
        <input type="number" name="age" placeholder="Edad" maxlength="50" required />
        <input type="number" name="height" placeholder="Altura" step="0.01" maxlength="50" required />
        <input type="number" name="weight" placeholder="Peso" step="0.1" maxlength="50" required />
        <select name="area" required>
            {foreach from=$areas item=area}
                <option value="{$area->id}">{$area->name}</option>
            {/foreach}
        </select>

        <select name="nurse" required>
            {foreach from=$nurses item=nurse}
                <option value="{$nurse->id}">{$nurse->lastname} {$nurse->name}</option>
            {/foreach}
        </select>
        <button>Agregar</button>
    </form>
</body>