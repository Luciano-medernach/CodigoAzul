{include "../header.tpl"}	

<body>
    <form action="db-patient-edit" method="POST">
        <input type="text" name="name" placeholder="Nombre" maxlength="50" value="{$patient->name}" required />
        <input type="text" name="lastname" placeholder="Apellido" maxlength="50" value="{$patient->lastname}" required />
        <input type="number" name="age" placeholder="Edad" maxlength="50" value="{$patient->age}" required />
        <input type="number" name="height" placeholder="Altura" step="0.01" maxlength="50" value="{$patient->height}" required />
        <input type="number" name="weight" placeholder="Peso" step="0.1" maxlength="50" value="{$patient->weight}" required />
        <select name="area" required>
            <option value="none" selected>- Area -</option>
            {foreach from=$areas item=area}
                <option value="{$area->id}">{$area->name}</option>
            {/foreach}
        </select>

        <select name="nurse" required>
            <option value="none" selected>- Enfermero a cargo -</option>
            {foreach from=$nurses item=nurse}
                <option value="{$nurse->id}">{$nurse->lastname} {$nurse->name}</option>
            {/foreach}
        </select>

        <input type="hidden" value="{$patient->id}" name="id" />
        <button>Agregar</button>
    </form>
</body>