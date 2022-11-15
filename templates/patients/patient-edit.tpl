{include "../header.tpl"}	


<body>
    <form action="db-patient-edit" method="POST">
        <input type="text" name="name" placeholder="Nombre" maxlength="50" value="{$patient->name}" required />
        <input type="text" name="lastname" placeholder="Apellido" maxlength="50" value="{$patient->lastname}" required />
        <input type="number" name="dni" placeholder="DNI" max="100000000" value="{$patient->dni}" required />
        <input type="number" name="age" placeholder="Edad" max="150" value="{$patient->age}" required />
        <input type="text" name="address" placeholder="Direccion" maxlength="50" value="{$patient->address}" required />
        <input type="text" name="phone" placeholder="Telefono" maxlength="15" value="{$patient->phone}" required />
        <input type="text" name="family_phone" placeholder="Telefono de un familiar" maxlength="15" value="{$patient->family_phone}" required />
        <input type="number" name="height" placeholder="Altura" step="0.01" max="4" value="{$patient->height}" required />
        <input type="number" name="weight" placeholder="Peso" step="0.1" max="500" value="{$patient->weight}" required />
        <textarea name="medical_history" placeholder="Historia medica">{$patient->medical_history}</textarea>
        <textarea name="medicines" placeholder="Medicamentos actuales del paciente">{$patient->medicines}</textarea>

        <select name="area" required>
            <option value="none" selected>- Area -</option>
            {foreach from=$areas item=area}
                <option value="{$area->id}">{$area->name}</option>
            {/foreach}
        </select>

        <input type="hidden" name="id" value="{$patient->id}">
        <button>Editar</button>
    </form>
</body>
