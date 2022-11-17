{include "header.tpl"}

<body >
    <select name="filter" id="data-filter">
        <option value="area">Area</option>
        <option value="day">Dia</option>
        <option value="hour">Hora</option>
        <option value="origin">Origen</option>
    </select>

    <select name="filter" id="type-filter">
        <option value="pie">Pastel</option>
        <option value="column">Columnas</option>
        <option value="bar">Barras</option>
    </select>

    <div id="chartContainer">
        <div id="chart" style="height: 370px; width: 50%;"></div>
    
    </div>



    <script src="./js/canvasjs.min.js"></script>
    <script src="https://unpkg.com/jspdf@latest/dist/jspdf.umd.min.js"></script>
    <script src="./js/report.js"></script>
</body>