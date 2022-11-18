{include "../header.tpl"}	

<body class="bg-gradient-to-b from-cwhite to-clightblue  min-h-screen text-cdarkblue pb-20">
    <h3 class="pl-4 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite"> Crear usuario  </h3>
    <form class="flex flex-col items-center text-lg w-full max-w-2xl mx-auto box-with-shadow p-4 mt-12"  action="db-user-add" method="POST">
        <label class="mt-4 bg-cpink w-full text-cdarkgray font-semibold" for="name">Nombre</label>
        <input class="py-4 text-cdarkgray inputs-form"  type="text" name="name" placeholder="Nombre" maxlength="50" required />
        <label class="mt-4 bg-cpink w-full text-cdarkgray font-semibold" for="name">Apellido</label>
        <input class="py-4 text-cdarkgray inputs-form" name="lastname" placeholder="Apellido" maxlength="50" required />
        <label class="mt-4 bg-cpink w-full text-cdarkgray font-semibold" for="username">Nombre de usuario</label>
        <input class="py-4 text-cdarkgray inputs-form" type="text" name="username" placeholder="Nombre de usuario" maxlength="50" required />
        <label class="mt-4 bg-cpink w-full text-cdarkgray font-semibold" for="password">Contraseña</label>
        <input class="py-4 text-cdarkgray inputs-form mb-2" type="password" name="password" placeholder="Contraseña" maxlength="64" required />
        
        <p class=" py-1 text-cdarkgray bg-cpink px-4"><input  type="checkbox" name="admin"  /> ADMIN</p> 
        <button class="mt-2 btn-blue w-1/2 py-2">Crear</button>
    </form>
</body>


