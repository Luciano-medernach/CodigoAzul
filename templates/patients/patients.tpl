{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue h-screen ">
    {if $admin}
        <a class=" text-center bg-cpink btn-white mb-12 " href="patient-add">Agregar paciente</a>
    {/if}
    {if $patients}
        <div class=" grid gap-6 grid-cols-2 grid-rows-3 justify-items-center mx-auto   mx-20">
        {foreach from=$patients item=patient }
        
            <div class="box-with-shadow w-60 mt-12">
                <form action="patient" method="GET">
                    <input type="hidden" name="id" value="{$patient->id}">
                    <button>{$patient->name} {$patient->lastname}</button>
                </form>
                {if $admin}
                    <form class="inline w-full" action="patient-edit" method="GET">
                        <input type="hidden" name="id" value="{$patient->id}">
                        <button class=" px-2 bg-clightgreen rounded-l-2xl">Editar</button>
                    </form>
                    <form class="inline" action="db-patient-delete" method="POST" onsubmit="return window.confirm('¿Seguro que desea eliminar el paciente?')">
                        <input type="hidden" name="id" value="{$patient->id}">
                        <button class=" bg-cpink px-2 rounded-r-2xl">Eliminar</button>
                    </form>
                {/if}
            </div>
        {/foreach}
        </div>
    {else}
        <h3>Aun no tenemos pacientes registrados.</h3>

    {/if}
</body>