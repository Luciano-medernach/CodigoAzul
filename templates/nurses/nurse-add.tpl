{include "../header.tpl"}

<body>
    <form action="db-nurse-add" method="POST">
        <input type="text" name="name" placeholder="Nombre" maxlength="50" required />
        <input type="text" name="lastname" placeholder="Apellido" maxlength="50" required />
        <button>Agregar</button>
    </form>
</body>