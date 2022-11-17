{include "../header.tpl"}	

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">
    <h3 class="pl-4  font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite"> Editar datos  </h3>
            
    <form class="text-base box-with-shadow  w-2/3 mx-auto p-4 mt-6 max-w-xl"  action="db-patient-edit" method="POST">
        <div class="grid grid-cols-2 gap-2 justify-items-center  pb-2">
            <label class="text-cdarkgray font-semibold" for="name">Nombre</label>
            <label class="text-cdarkgray font-semibold" for="lastname">Apellido</label>
            <input class=" w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form " type="text" name="name" placeholder="Nombre" maxlength="50" value="{$patient->name}" required />
            <input class=" w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="text" name="lastname" placeholder="Apellido" maxlength="50" value="{$patient->lastname}" required />
            <label class="text-cdarkgray font-semibold" for="dni">DNI</label>
            <label class="text-cdarkgray font-semibold" for="age">Edad</label>
            <input class=" w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="number" name="dni" placeholder="DNI" max="100000000" value="{$patient->dni}" required />
            <input class=" w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="number" name="age" placeholder="Edad" max="150" value="{$patient->age}" required />
            <label class="text-cdarkgray font-semibold" for="adress">Direccion</label>
            <label class="text-cdarkgray font-semibold" for="phone">Telefono</label>
            <input class=" w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="text" name="address" placeholder="Direccion" maxlength="50" value="{$patient->address}" required />
            <input class=" w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="text" name="phone" placeholder="Telefono" maxlength="15" value="{$patient->phone}" required />
            <label class="text-cdarkgray font-semibold" for="family_phone">Telefono de familiar</label>
            <label class="text-cdarkgray font-semibold" for="height">Altura</label>
            <input class=" w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="text" name="family_phone" placeholder="Telefono de un familiar" maxlength="15" value="{$patient->family_phone}" required />
            <input class=" w-full text-cdarkgray pl-2 bg-clightblue  h-8 inputs-form" type="number" name="height" placeholder="Altura" step="0.01" max="4" value="{$patient->height}" required />
            <label class="text-cdarkgray font-semibold" for="weight">Peso</label>
            <label class="text-cdarkgray font-semibold" for="height">Seleccione area</label>
            <input class=" w-full text-cdarkgray pl-2 bg-clightblue  h-10 inputs-form" type="number" name="weight" placeholder="Peso" step="0.1" max="500" value="{$patient->weight}" required />
            
            <select class=" w-full select-form" name="area" required>
                <option value="none" selected>- Area -</option>
                {foreach from=$areas item=area}
                    <option value="{$area->id}">{$area->name}</option>
                {/foreach}
            </select>
            <p class="text-cdarkgray font-semibold">Medicamentos</p>
            <p class="text-cdarkgray font-semibold">Historia medica/ antecedentes</p>
            <textarea class="h-20 text-cdarkgray pl-2 bg-cpink w-full" name="medicines" placeholder="Medicamentos actuales del paciente">{$patient->medicines}</textarea>
            <textarea class="h-20 text-cdarkgray pl-2 bg-cpink w-full" name="medical_history" placeholder="Historia medica">{$patient->medical_history}</textarea>
        
            <input type="hidden" name="id" value="{$patient->id}">       
           
            
        </div>
        <button class="block mx-auto mt-4 mb-2 px-4 py-1 btn-blue">Guardar cambios</button>
    </form>
    
</body>
