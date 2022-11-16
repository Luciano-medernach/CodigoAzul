{include "../header.tpl"}	

<body>
<form class="flex flex-col items-center text-lg  w-1/2 mx-auto box-with-shadow p-4 mt-12"  action="db-user-add" method="POST">
            <input class="py-4 text-cdarkgray inputs-form"  type="text" name="name" placeholder="Nombre" maxlength="50" required />
            <input class="py-4 text-cdarkgray inputs-form" name="lastname" placeholder="Apellido" maxlength="50" required />
            <input class="py-4 text-cdarkgray inputs-form" type="text" name="username" placeholder="Nombre de usuario" maxlength="50" required />
            <input class="py-4 text-cdarkgray inputs-form mb-2" type="password" name="password" placeholder="Contraseña" maxlength="64" required />
            
            <p class=" py-1 text-cdarkgray bg-cpink px-4"><input  type="checkbox" name="admin"  /> ADMIN</p> 
            <button class="mt-2 btn-blue w-1/2 py-2">Crear</button>
    </form>
</body>


