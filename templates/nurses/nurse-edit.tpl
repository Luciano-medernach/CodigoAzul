{include "../header.tpl"}

<body>
    <form class="flex flex-col items-center text-lg  w-1/2 mx-auto box-with-shadow p-4 mt-12"  action="db-nurse-edit" method="POST">
        <h1 class="text-3xl font-bold text-cblue mb-8">Editar un enfermero/medico</h1>      
        <input class="text-cdarkgray inputs-form" type="text" name="name" placeholder="Nombre" maxlength="50" value="{$nurse->name}" required />
        <input class="text-cdarkgray inputs-form mb-8"  type="text" name="lastname" placeholder="Apellido" maxlength="50" value="{$nurse->lastname}" required />

        <input type="hidden" value="{$nurse->id}" name="id">
        <button class=" btn-blue w-1/2 py-2">Guardar cambios</button>
    </form>
</body>