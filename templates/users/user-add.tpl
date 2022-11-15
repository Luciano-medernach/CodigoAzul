{include "../header.tpl"}	

<body>
    <form action="db-user-add" method="POST">
        <input type="text" name="name" placeholder="Nombre" maxlength="50" required />
        <input type="text" name="lastname" placeholder="Apellido" maxlength="50" required />
        <input type="text" name="username" placeholder="Nombre de usuario" maxlength="50" required />
        <input type="password" name="password" placeholder="Contraseña" maxlength="64" required />
        <input type="checkbox" name="admin" />

        <button>Agregar</button>
    </form>
</body>