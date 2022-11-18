{include "../header.tpl"}

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">
    <h3 class=" pl-8 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite mb-8 ">Configuracion de {$area->name}</h3>
   <div class=" mx-auto grid sm:grid-cols-2 items-center ">     
        <div class="  flex flex-col justify-center"> 


        {if $admin}
            <form class="mt-8 flex flex-col justify-center w-60 sm:w-80 mx-auto" action="db-area-assign-nurse" method="POST">
                <select class=" bg-cblue text-cwhite border-none w-full p-2 leading-tight focus:font-semibold" name="nurseid" required>
                    {foreach from=$nurses item=nurse}
                        <option value="{$nurse->id}">{$nurse->lastname} {$nurse->name}</option>
                    {/foreach}
                </select>
                <input type="hidden" name="areaid" value="{$area->id}">
                <button class=" bg-white/70 font-bold mx-auto px-4 py-1 btn"> Asignar personal</button>
            </form>
        {/if}

        
        {if $assignedNurses}
            
            {foreach from=$assignedNurses item=nurse}
                <div class="grid grid-cols-2"> 
                <form action="nurse" method="GET">
            
                        <input type="hidden" name="id" value="{$nurse->nurseid}">
                        
                            <button class="block mx-auto ">{$nurse->lastname}, {$nurse->name}</button>
                        </form>
                    {if $admin}
                        <form action="db-area-deassign-nurse" method="POST">
                            <input type="hidden" name="nurseid" value="{$nurse->nurseid}">
                            <input type="hidden" name="areaid" value="{$area->id}">
                            <button class="block mx-auto text-cwhite px-4 py-1 bg-cpink btn-white"> Desasignar</button>
                        </form>
            
                    {/if}
                </div>    
            {/foreach}
        
            {else}
                <h3 class="pb-4 text-center font-semibold text-cblue">Aun no hay enfermeros asignados.</h3>
            {/if}
        </div> 
    <div class="box-with-shadow  w-72 sm:w-80   mx-auto bg-clightgreen/50 "> 
            {if $admin}
                <form class=" box-with-shadow w-60 mx-auto items-center" action="db-area-assign-patient " method="POST">
                    <select class=" mb-2 bg-cwhite  border-none w-2/3  p-2 leading-tight focus:font-semibold" name="patientid" required>
                        {foreach from=$patients item=patient}
                            <option value="{$patient->id}">{$patient->lastname} {$patient->name}</option>
                        {/foreach}
                    </select>
                    <input type="hidden" name="areaid" value="{$area->id}">
                    <button class="block mx-auto  px-4 py-1 bg-clightgreen btn-blue">Asignar paciente</button>
                </form>
            {/if}
            {if $assignedPatients}
                <div class="mb-10 grid grid-cols-2  items-center">
                <h3 class="col-start-1 col-end-3 mb-4 text-center pl-2 font-semibold uppercase text-xl text-cwhite"> Pacientes en el area</h3>
                
                {foreach from=$assignedPatients item=patient}
                    
                    
                    <form action="patient" method="GET">
                        <input type="hidden" name="id" value="{$patient->id}">
                        <button class=" block mx-auto  px-2  bg-cblue text-cwhite  btn-cwhite my-2">{$patient->lastname}, {$patient->name}</button>
                    </form>
                    {if $admin}
                    <form action="db-area-deassign-patient" method="POST">
                        <input type="hidden" name="patientid" value="{$patient->id}">
                        <button class="block mx-auto bg-cwhite/60 text-lg px-2 m-0 btn"> Desasignar</button>
                    </form>
                    
                    {/if}
                {/foreach}
                </div>
        {else}
            <h3 class="text-center font-semibold text-cblue">Aun no hay pacientes asignados.</h3>
            
        {/if}

        </div> 

</div>
    <div class="mt-6 flex flex-col items-center justify-center bg-cwhite "> 
                    
        {if $admin}
            
            <form class="w-80 mx-auto"  action="db-area-assign-origin" method="POST">
                <h3 class="my-4 text-center pl-2 font-semibold uppercase text-xl ">Llamadas </h3>
                <input class="mx-auto bg-clightgreen text-cwhite py-2 border-none w-80 leading-tight pl-4 placeholder-cwhite focus:font-semibold" type="text" name="origin" placeholder="Ingresar origen de la llamada" maxlength="50" required/>
                <input type="hidden" name="areaid" value="{$area->id}">
                <button class=" btn-blue mt-2 font-bold block mx-auto px-4 py-1 ">Asignar origen </button>
            </form>
        {/if}

        {if $assignedOrigins}
            {foreach from=$assignedOrigins item=origin}
                <p class="bg-cgray/20 w-full text-center mt-4">{$origin->origin}</p>
                {if $admin}
                    <form action="db-area-deassign-origin" method="POST">
                        <input  type="hidden" name="areaid" value="{$area->id}">
                        <input type="hidden" name="origin" value="{$origin->origin}">
                        <button class="btn bg-white/70 mb-4 px-2">Desasignar origen</button>
                    </form>
                {/if}
            {/foreach}
        {else}
            <h3 class="text-center font-semibold text-cblue">Aun no hay formas de llamado desde esta area.</h3>
        {/if}
    </div>


</body>