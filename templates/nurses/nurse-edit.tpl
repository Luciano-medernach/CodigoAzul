{include "../header.tpl"}

<body class=" bg-gradient-to-b from-cwhite to-clightblue min-h-screen ">
    <form class=" mt-32 flex flex-col  items-center text-lg h-68 w-full max-w-2xl mx-auto box-with-shadow p-4 "  action="db-nurse-add" method="POST">
    <h1 class=" py-4 text-2xl sm:text-3xl font-bold text-cblue">Editar un enfermero/medico</h1>      
        <input class="py-4 text-cdarkgray inputs-form" type="text" name="name" placeholder="Nombre" maxlength="50" value="{$nurse->name}" required />
        <input class="py-4 text-cdarkgray inputs-form"  type="text" name="lastname" placeholder="Apellido" maxlength="50" value="{$nurse->lastname}" required />

        <input type="hidden" value="{$nurse->id}" name="id">
        <button class="mt-4 sm:mt-2 btn-blue py-2 px-2 mx-auto ">Guardar cambios</button>
    </form>
</body>