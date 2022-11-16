{include "../header.tpl"}

<body>
    <h3>{$area->name}</h3>

    {if $admin}
        <form action="db-area-assign-patient" method="POST">
            <select name="patientid" required>
                {foreach from=$patients item=patient}
                    <option value="{$patient->id}">{$patient->lastname} {$patient->name}</option>
                {/foreach}
            </select>
            <input type="hidden" name="areaid" value="{$area->id}">
            <button>Asignar paciente</button>
        </form>
    {/if}

    {if $assignedPatients}
        {foreach from=$assignedPatients item=patient}
            <form action="patient" method="GET">
                <input type="hidden" name="id" value="{$patient->patientid}">
                <button>{$patient->lastname} {$patient->name}</button>
            </form>
            {if $admin}
                <form action="db-area-deassign-patient" method="POST">
                    <input type="hidden" name="patientid" value="{$patient->patientid}">
                    <input type="hidden" name="areaid" value="{$area->id}">
                    <button>Desasignar</button>
                </form>
            {/if}
        {/foreach}
    {else}
        <h3>Aun no hay pacientes asignados.</h3>
    {/if}

    {if $admin}
        <form action="db-area-assign-nurse" method="POST">
            <select name="nurseid" required>
                {foreach from=$nurses item=nurse}
                    <option value="{$nurse->id}">{$nurse->lastname} {$nurse->name}</option>
                {/foreach}
            </select>
            <input type="hidden" name="areaid" value="{$area->id}">
            <button>Asignar enfermero</button>
        </form>
    {/if}

    {if $assignedNurses}
        {foreach from=$assignedNurses item=nurse}
            <form action="nurse" method="GET">
                <input type="hidden" name="id" value="{$nurse->nurseid}">
                <button>{$nurse->lastname} {$nurse->name}</button>
            </form>
            {if $admin}
                <form action="db-area-deassign-nurse" method="POST">
                    <input type="hidden" name="nurseid" value="{$nurse->nurseid}">
                    <input type="hidden" name="areaid" value="{$area->id}">
                    <button>Desasignar</button>
                </form>
            {/if}
        {/foreach}
    {else}
        <h3>Aun no hay enfermeros asignados.</h3>
    {/if}

    {if $admin}
        <form action="db-area-assign-origin" method="POST">
            <input type="text" name="origin" maxlength="50" required/>
            <input type="hidden" name="areaid" value="{$area->id}">
            <button>Asignar origen de llamadas.</button>
        </form>
    {/if}

    {if $assignedOrigins}
        {foreach from=$assignedOrigins item=origin}
            <p>{$origin->origin}</p>
            {if $admin}
                <form action="db-area-deassign-origin" method="POST">
                    <input type="hidden" name="areaid" value="{$area->id}">
                    <input type="hidden" name="origin" value="{$origin->origin}">
                    <button>Desasignar</button>
                </form>
            {/if}
        {/foreach}
    {else}
        <h3>Aun no hay formas de llamado desde esta area.</h3>
    {/if}
</body>