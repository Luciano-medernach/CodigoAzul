{include "../header.tpl"}	

<body>
    
<form class="flex flex-col items-center text-lg  w-1/2 mx-auto box-with-shadow p-4 mt-12"  action="db-patient-add" method="POST">
        <input class="text-cdarkgray inputs-form"  type="text" name="name" placeholder="Nombre" maxlength="50" required />
        <input class="text-cdarkgray inputs-form"  type="text" name="lastname" placeholder="Apellido" maxlength="50" required />
        <input class="text-cdarkgray inputs-form"  type="number" name="dni" placeholder="DNI" max="100000000" required />
        <input class="text-cdarkgray inputs-form"  type="number" name="age" placeholder="Edad" max="150" required />
        <input class="text-cdarkgray inputs-form"  type="text" name="address" placeholder="Direccion" maxlength="50" required />
        <input class="text-cdarkgray inputs-form"  type="text" name="phone" placeholder="Telefono" maxlength="15" required />
        <input class="text-cdarkgray inputs-form"  type="text" name="family_phone" placeholder="Telefono de un familiar" maxlength="15" required />
        <input class="text-cdarkgray inputs-form"  type="number" name="height" placeholder="Altura" step="0.01" max="4" required />
        <input class="text-cdarkgray inputs-form"  type="number" name="weight" placeholder="Peso" step="0.1" max="500" required />
        <textarea name="medical_history" placeholder="Historia medica"></textarea>
        <textarea name="medicines" placeholder="Medicamentos actuales del paciente"></textarea>
        
        <label class="text-cdarkgray font-semibold" for=" area">Sector donde ingresa</label>
        <select class="select-form" name="area" required>
            {foreach from=$areas item=area}
                <option value="{$area->id}">{$area->name}</option>
            {/foreach}
        </select>
        
        <label class="text-cdarkgray font-semibold"for="nurse">Enfermero/Medico a cargo</label>
        <select class="select-form mb-8" name="nurse" required>
            {foreach from=$nurses item=nurse}
                <option value="{$nurse->id}">{$nurse->lastname}, {$nurse->name}</option>
            {/foreach}
        </select>
        <button class=" btn-blue w-1/2 py-2">Agregar</button>
    </form>
</body>