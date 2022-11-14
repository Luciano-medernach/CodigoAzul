{include "header.tpl"}

<body>
    <div onclick="window.location='calls';">
        <h2>Llamadas</h2>
        {if $calls}
            {foreach from=$calls item=call}
                <p>Urgencia en: {$call->area}</p>
                <p>Fecha: {$call->date}</p>
            {/foreach}
        {else}
            <p>Aun no hay ninguna urgencia.</p>
        {/if}
    </div>

    <div onclick="window.location='patients';">
        <h2>Pacientes</h2>
        {if $patients}
            {foreach from=$patients item=patient}
                <p>{$patient->firstname} {$patient->lastname}</p>
            {/foreach}
        {else}
            <p>Aun no hay ningun paciente.</p>
        {/if}
    </div>

    <div onclick="window.location='areas';">
        <h2>Areas</h2>
        {if $areas}
            {foreach from=$areas item=area}
                <p>{$area->name}</p>
            {/foreach}
        {else}
            <p>Aun no hay ningun area.</p>
        {/if}
    </div>
</body>