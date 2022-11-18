{include "../header.tpl"}	

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">
    <h3 class="pl-4 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite mb-4"> Ingresar paciente  </h3>
    <div id="unknown-container ">
        <label class=" w-full sm:mx-4 bg-clightgreen py-2 px-2 sm:px-4 mr-4 text-cdarkgray text-sm sm:text-lg font-semibold">¿No conoce los datos de este paciente?</label>
        <input class="w-4 h-4 py-2"  type="checkbox" id="unknown-check" />
    </div>
    <form id="add-form" class="text-base box-with-shadow w-64 sm:w-80 mx-auto  p-4 mt-8 max-w-xl "  action="db-patient-add" method="POST">
    <div class="grid grid-cols-2 gap-2 mx-4  justify-items-center  pb-2">
            <label class="text-cdarkgray font-semibold" for="name">Nombre</label>
            <label class="removable text-cdarkgray font-semibold" for="lastname">Apellido</label>
            
            <br class="space hidden">
            <input class=" w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form " type="text" name="name" placeholder="Nombre" maxlength="50" required />  
            <br class="space hidden">
            <input class="removable w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="text" name="lastname" placeholder="Apellido" maxlength="50" required />
            <label class="removable text-cdarkgray font-semibold" for="dni">DNI</label>
            <label class="removable text-cdarkgray font-semibold" for="age">Edad</label>
            <input class="removable w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="number" name="dni" placeholder="DNI" max="100000000"  required />
            <input class="removable w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="number" name="age" placeholder="Edad" max="150"  required />
            <label class="removable text-cdarkgray font-semibold" for="adress">Direccion</label>
            <label class="removable text-cdarkgray font-semibold" for="phone">Telefono</label>
            <input class="removable w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="text" name="address" placeholder="Direccion" maxlength="50" required />
            <input class="removable w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="text" name="phone" placeholder="Telefono" maxlength="15" required />
            <label class="removable text-cdarkgray font-semibold" for="family_phone">Telefono de familiar</label>
            <label class="removable text-cdarkgray font-semibold" for="height">Altura</label>
            <input class="removable w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="text" name="family_phone" placeholder="Telefono " maxlength="15"/>
            <input class="removable w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="number" name="height" placeholder="Altura" step="0.01" max="4"  />
            <label class="removable text-cdarkgray font-semibold" for="weight">Peso</label>
            <label class=" text-cdarkgray font-semibold" for="area">Seleccione area</label>
            <br class="space hidden">
            
            <input class="removable w-full text-cdarkgray pl-2 bg-clightblue  h-10 inputs-form" type="number" name="weight" placeholder="Peso" step="0.1" max="500" />
            
            <select class=" w-full select-form" name="area" required>
                {foreach from=$areas item=area}
                    <option value="{$area->id}">{$area->name}</option>
                {/foreach}
            </select>
            <br class="space hidden">


            <label class=" text-cdarkgray font-semibold" for="area">Seleccione enfermero</label>
            <br>
            <br class="space hidden">


            <select class=" w-full select-form" name="nurse" required>
                {foreach from=$nurses item=nurse}
                    <option value="{$nurse->id}">{$nurse->name} {$nurse->lastname}</option>
                {/foreach}
            </select>
            <br>


            <p class="text-cdarkgray font-semibold">Medicamentos</p>
            <p class="text-cdarkgray font-semibold">Historia medica/ antecedentes</p>
            
            <textarea class=" h-20 text-cdarkgray pl-2 bg-cpink w-full" name="medicines" placeholder="Medicamentos actuales del paciente"></textarea>
            <textarea class=" h-20 text-cdarkgray pl-2 bg-cpink w-full" name="medical_history" placeholder="Historia medica"></textarea>
        
              
        </div>
        
        <button class="block mx-auto mt-4 mb-2 px-4 py-1 btn-blue">Añadir</button>
</form> 
        <script src="./js/patient.js"></script>
</body>