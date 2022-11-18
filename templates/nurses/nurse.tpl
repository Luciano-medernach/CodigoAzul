{include "../header.tpl"}

<body class=" text-cdarkblue min-h-screen bg-gradient-to-b from-cwhite to-clightgreen/50 ">
<h3 class="pl-4 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite mb-12">{$nurse->lastname}, {$nurse->name} </h3>

<div class=" pb-20 grid gap-4 md:grid-cols-2 md:grid-rows-3 sm:mx-10 pt-4 mx-auto ">
    <div class="bg-cblue/50 box-with-shadow w-60 sm:w-80 mx-auto">     
    {if $admin}
        <form class="justify-center flex flex-col mx-auto " action="db-area-assign-nurse" method="POST">
        <h3 class=" mb-2 text-center font-semibold uppercase text-xl text-cwhite">Areas</h3>
            <select class="w-44 mx-auto" name="areaid" required>
                {foreach from=$areas item=area}
                    <option value="{$area->id}">{$area->name}</option>
                {/foreach}
            </select>
            <input type="hidden" name="nurseid" value="{$nurse->id}">
            <button class="btn-blue mx-auto px-2 mt-2 mb-2">Asignar area</button>
        </form>
        
    {/if}
                
    {if $assignedAreas}
            <h3 class="mt-4 mb-2 text-center pl-2 font-semibold uppercase text-xl text-cwhite">Areas asignadas</h3>
                        
                {foreach from=$assignedAreas item=area }
                <div >
                    <div class="mt-4 border-b-2 border-cwhite"></div>
                    <form  action="area" method="GET">
                        <input type="hidden" name="id" value="{$area->areaid}">
                        <button class="px-8 mx-auto mb-4 text-cwhite font-bold btn bg-cwhite/10">{$area->name}</button>
                    </form>
                    {if $admin}
                        <form action="db-area-deassign-nurse" method="POST">
                            <input type="hidden" name="areaid" value="{$area->areaid}">
                            <input type="hidden" name="nurseid" value="{$nurse->id}">
                            <button class="px-4 py-1 btn-blue">Desasignar area</button>
                        </form>
                    {/if}
                </div>
                    
                
                {/foreach}
            {else}
                    <h3 class="msg-vacio">No tiene ningun area asignada aun.</h3>
    
    {/if}

    </div>
    
   

    <div class=" flex flex-col bg-clightgreen box-with-shadow w-60 sm:w-80 mx-auto ">
        {if $assignedPatients}
        
            <div class="justify-center mt-4 flex flex-col mx-auto items-center ">
            <h3 class="mt-4 mb-2 text-center pl-2 font-semibold uppercase text-lg sm:text-xl bg-cpink px-2 sm:px-4 text-cwhite">Pacientes asignados</h3>
                {foreach from=$assignedPatients item=patient}   
                    <div class="flex flex-col sm:flex-row my-2 ">
                    <form class="  text-lg font-bold text-cblue pr-4" action="patient" method="GET">
                        <input type="hidden" name="id" value="{$patient->patientid}">
                        <button>{$patient->name} {$patient->lastname}</button>
                    </form>
                    {if $admin}
                        <form action="db-patient-deassign-nurse" method="POST">
                            <input type="hidden" name="patientid" value="{$patient->patientid}">
                            <input type="hidden" name="nurseid" value="{$nurse->id}">
                            <button class="btn-blue text-lg px-4 rounded-full">Desasignar paciente</button>
                        </form>
                    {/if}
                    </div >
            {/foreach}
        {else}
            <p class="msg-vacio">¡No tiene ningun paciente asignado!</p>
            
            </>
        {/if}
    <div>
        {if $admin}
            <form class=" justify-center mt-4 flex flex-col  mx-auto items-center " action="db-patient-assign-nurse" method="POST">
                <h3 class=" mb-2 text-center pl-2 font-semibold uppercase text-lg sm:text-xl  text-cwhite">Pacientes</h3>
            
                <select class="w-48 sm:w-60 text-cwhite focus:bg-cblue font-semibold bg-cpink select-form" name="patientid" required>
                    {foreach from=$patients item=patient}
                        <option value="{$patient->id}">{$patient->lastname} {$patient->name}</option>
                    {/foreach}
                </select>
                <input type="hidden" name="nurseid" value="{$nurse->id}">

                <button class="bg-clightblue btn ">Asignar nuevo paciente.</button>
                
            </form>
            
        {/if}
        </div>
    </div>
    
   


</div>
</body>