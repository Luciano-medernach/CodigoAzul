{include "../header.tpl"}

<body>
    <h3>{$patient->name} {$patient->lastname}</h3>
    <p>DNI: {$patient->dni}</p>
    <p>Edad: {$patient->age}</p>
    <p>Direccion: {$patient->address}</p>
    <p>Telefono: {$patient->phone}</p>
    <p>Telefono de un familiar: {$patient->family_phone}</p>
    <p>Peso: {$patient->weight}</p>
    <p>Altura: {$patient->height}</p>
    <p>Antecedentes medicos: {$patient->medical_history}</p>
    <p>Medicamentos que toma actualmente: {$patient->medicines}</p>

    {if $admin}
        <form action="patient-assign-area" method="GET">
            <input type="hidden" name="id" value="{$patient->id}">
            <button>Reasignar area</button>
        </form>
    {/if}
    <p>Area asignada: {$patient->area}</p>

    {if $admin}
        <form action="db-patient-assign-nurse" method="POST">
            <select name="nurse" required>
            {foreach from=$nurses item=nurse}
                <option value="{$nurse->id}">{$nurse->lastname} {$nurse->name}</option>
            {/foreach}

            <input type="hidden" name="id" value="{$patient->id}">

            <button>Asignar nuevo enfermero</button>
        </select>
        </form>
    {/if}

    <h4>Enfermeros asignados</h4>
    {if $assignedNurses}
        {foreach from=$assignedNurses item=nurse}
            <div>
                <p>{$nurse->name} {$nurse->lastname}</p>
                <form action="db-patient-deassign-nurse" method="POST">
                    <input type="hidden" name="patientid" value="{$patient->id}">
                    <input type="hidden" name="nurseid" value="{$nurse->id}">
                    <button>Desasignar enfermero</button>
                </form>
            </div>
        {/foreach}
    {else}
        <p>¡Este paciente no tiene personal medico asignado!</p>
    {/if}
</body>