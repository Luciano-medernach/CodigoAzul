{include "../header.tpl"}	


<body>

    <form class="flex flex-col items-center text-lg  w-1/2 mx-auto box-with-shadow p-4 mt-12"  action="db-patient-edit" method="POST">
        <input class="text-cdarkgray inputs-form" type="text" name="name" placeholder="Nombre" maxlength="50" value="{$patient->name}" required />
        <input class="text-cdarkgray inputs-form" type="text" name="lastname" placeholder="Apellido" maxlength="50" value="{$patient->lastname}" required />
        <input class="text-cdarkgray inputs-form" type="number" name="dni" placeholder="DNI" max="100000000" value="{$patient->dni}" required />
        <input class="text-cdarkgray inputs-form" type="number" name="age" placeholder="Edad" max="150" value="{$patient->age}" required />
        <input class="text-cdarkgray inputs-form" type="text" name="address" placeholder="Direccion" maxlength="50" value="{$patient->address}" required />
        <input class="text-cdarkgray inputs-form" type="text" name="phone" placeholder="Telefono" maxlength="15" value="{$patient->phone}" required />
        <input class="text-cdarkgray inputs-form" type="text" name="family_phone" placeholder="Telefono de un familiar" maxlength="15" value="{$patient->family_phone}" required />
        <input class="text-cdarkgray inputs-form" type="number" name="height" placeholder="Altura" step="0.01" max="4" value="{$patient->height}" required />
        <input class="text-cdarkgray inputs-form" type="number" name="weight" placeholder="Peso" step="0.1" max="500" value="{$patient->weight}" required />
        <textarea name="medical_history" placeholder="Historia medica">{$patient->medical_history}</textarea>
        <textarea name="medicines" placeholder="Medicamentos actuales del paciente">{$patient->medicines}</textarea>

        <label class="text-cdarkgray font-semibold"for="nurse">Area</label>
        <select class="select-form" name="area" required>
            <option value="none" selected>- Area -</option>
            {foreach from=$areas item=area}
                <option value="{$area->id}">{$area->name}</option>
            {/foreach}
        </select>

        <select class="select-form mb-8" name="nurse" required>
            <option value="none" selected>- Enfermero a cargo -</option>
            {foreach from=$nurses item=nurse}
                <option value="{$nurse->id}">{$nurse->lastname} {$nurse->name}</option>
            {/foreach}
        </select>

        <input type="hidden" name="id" value="{$patient->id}">
        <button class=" btn-blue w-1/2 py-2">Guardar cambios</button>
    </form>
</body>
