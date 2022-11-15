{include "../header.tpl"}

<body class=" bg-gradient-to-r from-cblue  to-cdarkblue">
    <form class="" action="db-signin" method="POST">
        <input type="text" name="user" placeholder="Usuario" maxlength="50" required>
        <input type="password" name="password" placeholder="Contraseña" maxlength="64" required>
        {if $error}
            <p>{$error}</p>
        {/if}

        <button class="btn-blue">Ingresar</button>
    </form>
</body>