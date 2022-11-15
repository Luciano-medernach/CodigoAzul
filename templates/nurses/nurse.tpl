{include "../header.tpl"}

<body>
    <h3>{$nurse->name} {$nurse->lastname}</h3>

    {if $admin}
        <form action="db-area-assign-nurse" method="POST">
            <select name="areaid" required>
                {foreach from=$areas item=area}
                    <option value="{$area->id}">{$area->name}</option>
                {/foreach}
            </select>
            <input type="hidden" name="nurseid" value="{$nurse->id}">
            <button>Asignar area</button>
        </form>
    {/if}
    
    {if $assignedAreas}
        <h3>Areas asignadas</h3>
        {foreach from=$assignedAreas item=area }
            <form action="area" method="GET">
                <input type="hidden" name="id" value="{$area->areaid}">
                <button>{$area->name}</button>
            </form>
            {if $admin}
                <form action="db-area-deassign-nurse" method="POST">
                    <input type="hidden" name="areaid" value="{$area->areaid}">
                    <input type="hidden" name="nurseid" value="{$nurse->id}">
                    <button>Desasignar area</button>
                </form>
            {/if}
        {/foreach}
    {else}
        <h3>No tiene ningun area asignada aun.</h3>
    {/if}


    {if $admin}
        <form action="db-patient-assign-nurse" method="POST">
            <select name="patientid" required>
                {foreach from=$patients item=patient}
                    <option value="{$patient->id}">{$patient->lastname} {$patient->name}</option>
                {/foreach}
            </select>
            <input type="hidden" name="nurseid" value="{$nurse->id}">

            <button>Asignar nuevo paciente.</button>
            
        </form>
    {/if}

    <h4>Pacientes asignados</h4>
    {if $assignedPatients}
        {foreach from=$assignedPatients item=patient}
            <div>
                <form action="patient" method="GET">
                    <input type="hidden" name="id" value="{$patient->patientid}">
                    <button>{$patient->name} {$patient->lastname}</button>
                </form>
                {if $admin}
                    <form action="db-patient-deassign-nurse" method="POST">
                        <input type="hidden" name="patientid" value="{$patient->patientid}">
                        <input type="hidden" name="nurseid" value="{$nurse->id}">
                        <button>Desasignar paciente</button>
                    </form>
                {/if}
            </div>
        {/foreach}
    {else}
        <p>¡No tiene ningun paciente asignado!</p>
    {/if}

</body>