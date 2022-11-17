{include "../header.tpl"}
<body class=" text-cdarkblue min-h-screen">
<h3 class="pl-4 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite ">{$patient->lastname}, {$patient->name} </h3>
<div class="bg-gradient-to-b from-cblue pb-20">
    <div class=" py-4 px-4  grid  grid-cols-2  grid-rows-2 gap-4 items-center justify-content-center pb-20">

        <div class=" grid w-full  row-start-1 row-end-3 justify-center">
            {if $patient->dni}
                <p class="pl-2 font-semibold text-cwhite uppercase">DNI</p>
                <p class="pl-8 text-cblue bg-clightblue w-60">{$patient->dni}</p>
            {/if}
            {if $patient->age}
                <p class="pl-2 font-semibold text-cwhite uppercase">Edad</p>
                <p class="pl-8 text-cblue bg-clightblue w-60"> {$patient->age}</Edad:>
            {/if}
            {if $patient->address}
                <p class="pl-2 font-semibold text-cwhite uppercase">Direccion</p>
                <p class="pl-8 text-cblue bg-clightblue w-60"> {$patient->age}</Edad:>
            {/if}
            {if $patient->phone}
                <p class="pl-2 font-semibold text-cwhite uppercase">Telefono</p>
                <p class="pl-8 text-cblue bg-clightblue w-60"> {$patient->age}</Edad:>
            {/if}
            {if $patient->family_phone}
                <p class="pl-2 font-semibold text-cwhite uppercase">Telefono de un familiar</p>
                <p class="pl-8 text-cblue bg-clightblue w-60"> {$patient->age}</Edad:>
            {/if}
            {if $patient->weight}
                <p class="pl-2 font-semibold text-cwhite uppercase">Peso</p>
                <p class="pl-8 text-cblue bg-clightblue w-60"> {$patient->age}</Edad:>
            {/if}
            {if $patient->height}
                <p class="pl-2 font-semibold text-cwhite uppercase">Altura</p>
                <p class="pl-8 text-cblue bg-clightblue w-60"> {$patient->age}</Edad:>
            {/if}
            
            
            <p class="pl-2 font-semibold text-cwhite uppercase bg-clightgreen w-60 mt-2">Antecedentes medicos</p>
            <p class="pl-8 text-cblue bg-clightblue w-60 h-10"> {$patient->medical_history}</>
            <p class="pl-2 font-semibold text-cwhite uppercase bg-clightgreen w-60 mt-2">Medicamentos que toma </p>
            <p class="pl-2 text-sm text-cwhite bg-clightgreen w-60"> (actualmente) </p>
            <p class="pl-8 text-cblue bg-clightblue w-60 h-10"> {$patient->medicines}</>

            
        </div>
        <div class="grid w-80 box-with-shadow mx-auto">
        
        <p>Area asignada: {$patient->area}</p>    
        {if $admin}
                <form action="db-area-assign-patient" method="POST">
                    <select class="w-2/3  bg-clightblue px-1 mb-4" name="areaid" required>
                        {foreach from=$areas item=area}
                            <option value="{$area->id}">{$area->name}</option>
                        {/foreach}
                    </select>
                    <input type="hidden" name="patientid" value="{$patient->id}">
                    <button class="w-2/3 cursor-pointer bg-cblue text-cwhite px-8">Reasignar area</button>
                </form>
            {/if}
            
        <img class=" p-2 w-20 mx-auto" src="./images/paciente2.png" alt="Logo Codigo Azul">
        {if $admin}
            <form action="db-patient-assign-nurse" method="POST">
                <select class="w-2/3  bg-clightblue px-1 mb-4" name="nurseid" required>
                    {foreach from=$nurses item=nurse}
                        <option value="{$nurse->id}">{$nurse->lastname}, {$nurse->name}</option>
                    {/foreach}
                </select>
                <input type="hidden" name="patientid" value="{$patient->id}">

                <button class="w-2/3 cursor-pointer bg-cblue text-cwhite ">Asignar enfermero</button>
            
            </form>
        </div>
        
            <div class="mx-auto grid w-80 text-cwhite ">
            <h3 class="text-center pl-2 font-semibold uppercase text-2xl text-cwhite">Enfermeros asignados</h3>
            {if $assignedNurses}
                <div class="mt-4 bg-clightgreen box-with-shadow text-cwhite">
                {foreach from=$assignedNurses item=nurse}
                        <p>{$nurse->name} {$nurse->lastname}</p>
                        <form action="db-patient-deassign-nurse" method="POST">
                            <input type="hidden" name="patientid" value="{$patient->id}">
                            <input type="hidden" name="nurseid" value="{$nurse->nurseid}">
                            <button class="  italic font-semibold btn bg-clightblue text-cdarkgray px-2 " >Desasignar enfermero</button>
                        </form>
                        <div class="mt-4 border-b-2 border-cwhite"></div>
                {/foreach} 
                </div>
            {else}
                <p>¡Este paciente no tiene personal medico asignado!</p>
            {/if}
            </div>
        {/if}    

    </div>
</div>
</body>