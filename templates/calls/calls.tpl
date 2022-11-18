{include "../header.tpl"}

<body>
    
<body class=" bg-gradient-to-b from-cwhite to-cblue min-h-screen ">
    <h1 class="pl-36 text-4xl font-bold text-cblue mb-2">LLAMADAS</h1>  
    <form action="calls" method="GET">
    <input class="mr-8 pr-4 inputs-form w-60 " id="area-input" type="text" name="area" placeholder="Area" value="{$area}" maxlength="50">

    <select name="page" id="page-select">
        {for $i = 0 to $count}
            <option value={$i}>{$i}</option>
        {/for}
    </select>    
    <button>Buscar</button>  
    <form>

    <div class=" grid grid-cols-2 items-center m-4 mx-20 "  action="db-nurse-add" method="POST">
            
        <h1 class="text-center text-xl font-bold text-cblue mb-6">URGENTES NO ATENDIDAS</h1>      
        <div class=" col-start-1 col-end-4 mb-12 " id="container-UNA">
        </div>
        <h1 class="text-center text-xl font-bold text-cblue mb-2">NORMALES NO ATENDIDAS</h1>      
        
        <div class=" col-start-1 col-end-2" id="container-NNA">
        </div>
        <h1 class="col-start-2 col-end-3 text-center row-start-3 row-end-4 text-xl font-bold text-cblue mb-2"> ATENDIDAS</h1> 
        
        <div class=" col-start-2 col-end-3 row-start-4 row-end-6" >     
            <div class=" " id="container-UA" >
            </div>
            <div class=" " id="container-NA">
            </div>
        </div>

       
        
    </div>
     <script src="./js/calls.js"></script>
</body>