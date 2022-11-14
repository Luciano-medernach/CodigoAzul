{include "../header.tpl"}

<body>
    {if $patients}
        {foreach from=$patients item=patient }
            <div>
                <p>{$patient->firstname} {$patient->lastname}</p>
                <form action="patient" method="GET">
                    <input type="hidden" name="id" value="{$patient->id}">
                    <button>Ver</button>
                </form>
                {if $admin}
                    <form action="patient-edit" method="GET">
                        <input type="hidden" name="id" value="{$patient->id}">
                        <button>Editar</button>
                    </form>
                    <form action="patient-delete" method="POST">
                        <input type="hidden" name="id" value="{$patient->id}">
                        <button>Eliminar</button>
                    </form>
                {/if}
            </div>
        {/foreach}
    {else}
        <h3>Aun no tenemos pacientes registrados.</h3>

    {/if}
</body>