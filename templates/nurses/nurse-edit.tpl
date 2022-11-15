{include "../header.tpl"}

<body>
    <form action="db-nurse-edit" method="POST">
        <input type="text" name="name" placeholder="Nombre" maxlength="50" value="{$nurse->name}" required />
        <input type="text" name="lastname" placeholder="Apellido" maxlength="50" value="{$nurse->lastname}" required />

        <input type="hidden" value="{$nurse->id}" name="id">
        <button>Editar</button>
    </form>
</body>