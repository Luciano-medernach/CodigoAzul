{include "header.tpl"}

<body class=" bg-gradient-to-b from-cwhite to-clightblue min-h-screen ">
    <div class=" lg:w-1/2 grid gap-4 md:gap-8 lg:grid-cols-3 mt-10  mx-4  lg:mx-auto pb-20">

        <form action="calls" method="GET" class=" cursor-pointer col-start-1 col-end-3 bg-cpink/25 box-with-shadow w-full h-full ">
            <button>
                <img class=" w-16 mx-auto" src="./images/latido-del-corazon.png" alt="Logo Codigo Azul">
                <h2>Llamadas</h2>
                <input type="hidden" name="area" value="">
                <input type="hidden" name="page" value="0">
            </button>
        </form>
        <div class=" text-cdarkblue/80 box-with-shadow bg-clightblue w-full h-full uppercase flex flex-col justify-center">
            <h1 class="text-md">Tiempo estimado de respuesta </h1> 
            <p class="text-5xl font-bold ">{$averageTime}</p>
            <p class= " text-sm md:text-md uppercase"> s e g u n d o s </p>
        </div>

        <form action="patients" method="GET" class="cursor-pointer box-with-shadow w-full h-full">    
            <button>
                <img class=" w-24 mx-auto" src="./images/reporte-de-salud.png" alt="Logo Codigo Azul">
                <h2>Pacientes</h2>
                <input type="hidden" name="name" value="">
                <input type="hidden" name="page" value="0">
            </button>
        </form>

        <form action="nurses" method="GET" class="cursor-pointer box-with-shadow w-full h-full">
            <button>
                <img class=" w-24 mx-auto" src="./images/medico.png" alt="Logo Codigo Azul">
                <h2>Personal medico</h2>
                <input type="hidden" name="name" value="">
                <input type="hidden" name="page" value="0">
            </button>
        </form>

        <form action="areas" method="GET" class="cursor-pointer box-with-shadow w-full h-full">
            <button>
                <img class=" w-24 mx-auto" src="./images/latido-del-corazon.png" alt="Logo Codigo Azul">

                <input type="hidden" name="page" value="0"/>
                <input type="hidden" name="name" value=""/>
                <h2>Areas</h2>
            </button>
        </form>

        <div onclick="window.location='reports';" class="cursor-pointer box-with-shadow w-full h-full">
            <img class=" w-24 mx-auto" src="./images/estadistica-inferencial.png" alt="Logo Codigo Azul">
            <h2>Reportes</h2> 
        </div>
        
        {if $admin}
            <form action="users" method="GET" class=" cursor-pointer box-with-shadow w-full h-full">
                <button>
                    <img class=" w-24 mx-auto" src="./images/usuario.png" alt="Logo Codigo Azul">
                    <h2>Usuarios</h2>
                    <input type="hidden" name="page" value="0"/>
                    <input type="hidden" name="name" value=""/>
                </button>
            </form>
        {/if}
    </div>

    
</body>