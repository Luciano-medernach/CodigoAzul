{include "header.tpl"}

<body class=" bg-gradient-to-b from-cwhite to-cpink/50 min-h-screen ">

<h3 class="mt-4 pl-4 font-bold uppercase text-2xl bg-clightgreen/50 text-cwhite mb-8"> Estadisticas  </h3>

<div class="flex justify-center   ">
    <select class="text-cwhite text-xl border-none bg-clightgreen  h-10 p-2  " name="filter" id="data-filter">
        <option value="none" selected>- Seleccione filtro -</option>
        <option value="area">Area</option>
        <option value="day">Dia</option>
        <option value="hour">Hora</option>
        <option value="origin">Origen</option>
    </select>

    <select class="text-cwhite text-xl bg-cpink border-none  h-10 p-2 " name="filter" id="type-filter">
    <option value="none" selected>- Seleccione tipo de grafico -</option>
        <option value="pie">Pastel</option>
        <option value="column">Columnas</option>
        <option value="bar">Barras</option>
    </select>
    </div>

    <div class=""  id="chartContainer">
        <div class="flex flex-col items-center text-cblue" id="chart" style="height: 370px; width: 50%;">
        </div>
    </div>


    <script src="./js/canvasjs.min.js"></script>
    <script src="https://unpkg.com/jspdf@latest/dist/jspdf.umd.min.js"></script>
    <script src="./js/report.js"></script>
 
</body>