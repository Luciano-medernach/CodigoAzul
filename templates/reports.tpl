{include "header.tpl"}

<body class=" bg-gradient-to-b from-cwhite to-cdarkblue min-h-screen ">

<h3 class="mt-4 pl-4 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite mb-8"> Estadisticas  </h3>

<div class="flex flex-col md:flex-row justify-center   ">
    <label class="pl-8 bg-cdarkblue text-cwhite font-bold h-10 p-2 text-lg" for="filter">Seleccione filtro</label>
    <select class="text-cwhite text-xl border-none bg-clightgreen  h-10 p-2  " name="filter" id="data-filter">
        <option value="area" selected>Area</option>
        <option value="day">Dia</option>
        <option value="hour">Hora</option>
        <option value="origin">Origen</option>
    </select>
    <label class="bg-cdarkblue text-cwhite font-bold h-10 p-2 text-lg" for="filter">Seleccione tipo de grafico</label>
    
    <select class="pl-4 text-cwhite text-xl bg-cblue border-none  h-10 p-2 " name="filter" id="type-filter">
        <option value="pie" selected>Pastel</option>
        <option value="column">Columnas</option>
        <option value="bar">Barras</option>
    </select>
    </div>

    <div class="pb-12"  id="chartContainer">
        <div class="flex flex-col items-center text-cblue  " id="chart" style="height: 370px; width: 50%;">
        </div>
    </div>


    <script src="./js/canvasjs.min.js"></script>
    <script src="https://unpkg.com/jspdf@latest/dist/jspdf.umd.min.js"></script>
    <script src="./js/report.js"></script>
 
</body>