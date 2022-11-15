{include "../header.tpl"}	

<body>
    <form class="flex flex-col items-center text-lg  w-1/2 mx-auto box-with-shadow p-4 mt-12" action="db-patient-edit" method="POST">
        <h1 class="text-3xl font-bold text-cblue">Editar un paciente</h1>    
        <input class="text-cdarkgray inputs-form"  type="text" name="name" placeholder="Nombre" maxlength="50" value="{$patient->name}" required />
        <input class="text-cdarkgray inputs-form"  type="text" name="lastname" placeholder="Apellido" maxlength="50" value="{$patient->lastname}" required />
        <input class="text-cdarkgray inputs-form"  type="number" name="age" placeholder="Edad" maxlength="50" value="{$patient->age}" required />
        <input class="text-cdarkgray inputs-form"  type="number" name="height" placeholder="Altura" step="0.01" maxlength="50" value="{$patient->height}" required />
        <input class="text-cdarkgray inputs-form"  type="number" name="weight" placeholder="Peso" step="0.1" maxlength="50" value="{$patient->weight}" required />
        <label class="text-cdarkgray font-semibold" for=" area">Sector donde ingresa</label>
        <select class="select-form" name="area" required>
            <option value="none" selected>- Area -</option>
            {foreach from=$areas item=area}
                <option value="{$area->id}">{$area->name}</option>
            {/foreach}
        </select>
        <label class="text-cdarkgray font-semibold"for="nurse">Enfermero/Medico a cargo</label>
        <select class="select-form mb-8" name="nurse" required>
            <option value="none" selected>- Enfermero a cargo -</option>
            {foreach from=$nurses item=nurse}
                <option value="{$nurse->id}">{$nurse->lastname} {$nurse->name}</option>
            {/foreach}
        </select>

        <input type="hidden" value="{$patient->id}" name="id" />
        <button class=" btn-blue w-1/2 py-2">Guardar cambios</button>
    </form>
</body>