{include "../header.tpl"}	

<body>
    
    <form class="flex flex-col items-center text-lg  w-1/2 mx-auto box-with-shadow p-4 mt-12" action="db-patient-add" method="POST">
        <h1 class="text-3xl font-bold text-cblue">Ingresar un paciente</h1>
        <input class="text-cdarkgray inputs-form" type="text" name="name" placeholder="Nombre" maxlength="50" required />
        <input class="text-cdarkgray inputs-form"  type="text" name="lastname" placeholder="Apellido" maxlength="50" required />
        <input class="text-cdarkgray inputs-form"  type="number" name="age" placeholder="Edad" maxlength="50" required />
        <input class="text-cdarkgray inputs-form"  type="number" name="height" placeholder="Altura" step="0.01" maxlength="50" required />
        <input class="text-cdarkgray inputs-form"  type="number" name="weight" placeholder="Peso" step="0.1" maxlength="50" required />
        
        <label class="text-cdarkgray font-semibold" for=" area">Sector donde ingresa</label>
        <select class="select-form"  name="area" required>
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