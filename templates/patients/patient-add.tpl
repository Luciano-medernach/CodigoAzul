{include "../header.tpl"}	

<body>
    <form action="db-patient-add" method="POST">
        <input type="text" name="name" placeholder="Nombre" maxlength="50" required />
        <input type="text" name="lastname" placeholder="Apellido" maxlength="50" required />
        <input type="number" name="dni" placeholder="DNI" max="100000000" required />
        <input type="number" name="age" placeholder="Edad" max="150" required />
        <input type="text" name="address" placeholder="Direccion" maxlength="50" required />
        <input type="text" name="phone" placeholder="Telefono" maxlength="15" required />
        <input type="text" name="family_phone" placeholder="Telefono de un familiar" maxlength="15" required />
        <input type="number" name="height" placeholder="Altura" step="0.01" max="4" required />
        <input type="number" name="weight" placeholder="Peso" step="0.1" max="500" required />
        <textarea name="medical_history" placeholder="Historia medica"></textarea>
        <textarea name="medicines" placeholder="Medicamentos actuales del paciente"></textarea>

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