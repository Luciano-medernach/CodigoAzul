{include "../header.tpl"}

<body>
    <form class="flex flex-col items-center text-lg  w-1/2 mx-auto box-with-shadow p-4 mt-12"  action="db-nurse-add" method="POST">
        <h1 class="py-4 text-3xl font-bold text-cblue">Ingresar un enfermero/medico</h1>
        <input class="py-4 text-cdarkgray inputs-form"  type="text" name="name" placeholder="Nombre" maxlength="50" required />
        <input class="py-4 text-cdarkgray inputs-form"  type="text" name="lastname" placeholder="Apellido" maxlength="50" required />
        <button class="mt-2 btn-blue w-1/2 py-2">Agregar</button>
    </form>
</body>