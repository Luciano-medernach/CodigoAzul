{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">
    <h3 class=" pl-8 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite mb-8 ">Configuracion de {$area->name}</h3>
        {if $admin}

            <div class=" box-with-shadow w-2/3 max-w-xl mx-auto grid grid-cols-2 items-center ">
    
            <form class="" action="db-area-assign-patient " method="POST">
                <select class=" mb-2 bg-cwhite  border-none w-2/3  p-2 leading-tight focus:font-semibold" name="patientid" required>
                    {foreach from=$patients item=patient}
                        <option value="{$patient->id}">{$patient->lastname} {$patient->name}</option>
                    {/foreach}
                </select>
                <input type="hidden" name="areaid" value="{$area->id}">
                <button class="block mx-auto  px-4 py-1 bg-clightgreen btn-blue">Asignar paciente</button>
            </form>
        {/if}

        <div class="bg-clightgreen/50 ">
            {if $assignedPatients}
                <h3 class="text-center text-lg font-semibold">Pacientes en el area</h3>
                {foreach from=$assignedPatients item=patient}
                    
                    <form action="patient" method="GET">
                        <input type="hidden" name="id" value="{$patient->patientid}">
                        <button class=" block mx-auto  px-2 py- bg-clightgreen  btn-cwhite">{$patient->lastname}, {$patient->name}</button>
                    </form>
                    {if $admin}
                        <form action="db-area-deassign-patient" method="POST">
                            <input type="hidden" name="patientid" value="{$patient->patientid}">
                            <input type="hidden" name="areaid" value="{$area->id}">
                            <button class="block mx-auto  px-4 py-1 btn-blue"> Desasignar</button>
                        </form>
                    {/if}
                {/foreach}
        </div> 
        {else}
            <h3>Aun no hay pacientes asignados.</h3>
        {/if}
        <div class="bg-cpink flex justify-center col-start-1 col-end-3 py-2 "> 
            {if $admin}
                <form class="w-1/2" action="db-area-assign-nurse" method="POST">
                    <select class="mb-2 bg-cwhite  border-none w-2/2 p-2 leading-tight focus:font-semibold" name="nurseid" required>
                        {foreach from=$nurses item=nurse}
                            <option value="{$nurse->id}">{$nurse->lastname} {$nurse->name}</option>
                        {/foreach}
                    </select>
                    <input type="hidden" name="areaid" value="{$area->id}">
                    <button class="block mx-auto px-4 py-1 btn-blue"> Asignar personal</button>
                </form>
            {/if}
        
            {if $assignedNurses}
                <div class="flex flex-col w-1/2 items-center" >
                <h3 class=" text-end text-lg font-semibold">Enfermeros/medicos </h3>
                {foreach from=$assignedNurses item=nurse}
                    
                        <form action="nurse" method="GET">
                        <input type="hidden" name="id" value="{$nurse->nurseid}">
                        
                            <button>{$nurse->lastname}, {$nurse->name}</button>
                        </form>
                        {if $admin}
                            <form action="db-area-deassign-nurse" method="POST">
                                <input type="hidden" name="nurseid" value="{$nurse->nurseid}">
                                <input type="hidden" name="areaid" value="{$area->id}">
                                <button class="block mx-auto px-4 py-1 bg-cwhite btn-white"> Desasignar</button>
                            </form>
                        {/if}
                        </div>
                {/foreach}
        </div> 
            {else}
                <h3>Aun no hay enfermeros asignados.</h3>
            {/if}

        {if $admin}
            
            <form action="db-area-assign-origin" method="POST">
                <h3 class="py-2 text-end uppercase text-xl font-semibold">Llamada </h3>
                <input class="mb-2 bg-clightblue  border-none w-2/3 leading-tight focus:font-semibold" type="text" name="origin" maxlength="50" required/>
                <input type="hidden" name="areaid" value="{$area->id}">
                <button class="block mx-auto px-4 py-1 text-lg btn-white">Asignar origen </button>
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

    </div>
</body>