{include "../header.tpl"}
<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">
<h3 class="font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite">{$patient->lastname}, {$patient->name} </h3>

<div class="max-w-2xl py-12 bg-cblue grid grid-cols-3 gap-4 items-center justify-content-center mx-auto w-full ">
    <div class="grid w-2/3">
        <p class="px-4 text-cwhite ">DNI: {$patient->dni}</p>
        <p class="px-4 text-cwhite ">Edad: {$patient->age}</p>
        <p class="px-4 text-cwhite ">Direccion: {$patient->address}</>
        <p class="px-4 text-cwhite ">Telefono: {$patient->phone}</>
        <p class="px-4 text-cwhite ">Telefono de un familiar: {$patient->family_phone}</>
        <p class="px-4 text-cwhite ">Peso: {$patient->weight}</>
        <p class="px-4 text-cwhite ">Altura: {$patient->height}</>
        <p class="px-4 text-cwhite ">Antecedentes medicos: {$patient->medical_history}</>
        <p class="px-4 text-cwhite ">Medicamentos que toma actualmente: {$patient->medicines}</>

        
    </div>
    <div class="grid w-full box-with-shadow ">
    <img class=" p-2 w-40 mx-auto" src="./images/paciente2.png" alt="Logo Codigo Azul">
        
    {if $admin}
            <form action="patient-assign-area" method="GET">
                <input type="hidden" name="id" value="{$patient->id}">
                <button class="cursor-pointer bg-cblue text-cwhite px-8">Reasignar area</button>
            </form>
        {/if}
        <p>Area asignada: {$patient->area}</p>
    {if $admin}
        <form action="db-patient-assign-nurse" method="POST">
            <select class="bg-clightblue px-1 mb-4" name="nurseid" required>
                {foreach from=$nurses item=nurse}
                    <option value="{$nurse->id}">{$nurse->lastname}, {$nurse->name}</option>
                {/foreach}
            </select>
            <input type="hidden" name="patientid" value="{$patient->id}">

            <button class="cursor-pointer bg-cblue text-cwhite ">Asignar nuevo enfermero</button>
        
        </form>
    {/if}
    </div>
    
    <div class="mx-auto grid w-56 text-cwhite ">
    <h3 class="pl-2 font-semibold uppercase text-2xl text-cwhite">Enfermeros asignados</h3>
    {if $assignedNurses}
        <div class="m-2 bg-cpink box-with-shadow text-cwhite">
        {foreach from=$assignedNurses item=nurse}
                <p>{$nurse->name} {$nurse->lastname}</p>
                <form action="db-patient-deassign-nurse" method="POST">
                    <input type="hidden" name="patientid" value="{$patient->id}">
                    <input type="hidden" name="nurseid" value="{$nurse->nurseid}">
                    <button class=" bg-clightblue btn-white " >Desasignar enfermero</button>
                </form>
                <div class="border-b-2 border-cwhite"></div>
        {/foreach} 
        </div>
    {else}
        <p>¡Este paciente no tiene personal medico asignado!</p>
    {/if}
    </div>
</div>

</body>