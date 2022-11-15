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
                <p>{$patient->name} {$patient->lastname}</p>
            {/foreach}
        {else}
            <p>Aun no hay ningun paciente.</p>
        {/if}
    </div>

    <div onclick="window.location='nurses';">
        <h2>Personal medico</h2>
        {if $nurses}
            {foreach from=$nurses item=nurse}
                <p>{$nurse->name} {$nurse->lastname}</p>
            {/foreach}
        {else}
            <p>Aun no tenemos personal.</p>
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

    {if $admin}
        <div onclick="window.location='users';">
            <h2>Usuarios</h2>
            {if $users}
                {foreach from=$users item=user}
                    <p>{$user->name} {$user->lastname}</p>
                {/foreach}
            {else}
                <p>Aun no hay ningun usuario.</p>
            {/if}
        </div>
    {/if}
</body>