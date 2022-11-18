{include "../header.tpl"}
<body class=" bg-gradient-to-b from-cwhite to-cblue min-h-screen ">   
<h1 class="md:pl-36 text-4xl font-bold text-cblue mb-2">LLAMADAS</h1>  
    
    <form action="calls" method="GET" class=" mb-4 bg-cdarkblue  flex flex-col md:flex-row items-baseline w-full lg:pl-40 mt-2 ">
    <div class="flex">    
        <h2 class="bg-cblue w-28  text-cwhite text-md lg:text-lg font-semibold uppercase px-2 lg:pr-8 py-2 mr-2 lg:mr-8"> Buscador </h2>
        <input class=" mr-4 pr-4 inputs-search w-40 lg:w-60 " id="area-input" type="text" name="area" placeholder="Area" value="{$area}" maxlength="50">
        <button class="cursor-pointer h-10 bg-cblue px-2">
            <img class=" w-4 lg:w-6  h-4  lg:h-6" src="./images/buscar.png" alt="Logo Codigo Azul">
        </button>
    </div>
    <div class="flex">
        <label class="text-cdarkblue py-2 px-4 bg-cwhite" for="page"> Pagina</label>
        <select class="bg-cwhite w-12 text-center" name="page" id="page-select">
            {for $i = 0 to $count}
                <option value={$i}>{$i}</option>
            {/for}
        </select>    
    </div>     
    </form>


    <div class=" grid md:grid-cols-2 md:items-center mx-auto gap-4 mx-2 md:mx-20 "  action="db-nurse-add" method="POST">
            
        <h1 class=" w-full text-center text-xl font-bold text-cblue mb-6">URGENTES NO ATENDIDAS</h1>      
        <div class=" md:col-start-1 md:col-end-4 mb-12 " id="container-UNA">
        </div>
        <h1 class="text-center text-xl font-bold text-cblue mb-2">NORMALES NO ATENDIDAS</h1>      
        
        <div class=" md:col-start-1 md:col-end-2" id="container-NNA">
        </div>
        <h1 class="md:col-start-2 md:col-end-3 text-center md:row-start-3 md:row-end-4 text-xl font-bold text-cblue mb-2"> ATENDIDAS</h1> 
        
        <div class=" md:col-start-2 md:col-end-3 md:row-start-4 md:row-end-6" >     
            <div class=" " id="container-UA" >
            </div>
            <div class=" " id="container-NA">
            </div>
        </div>

        
        
    </div>
     <script src="./js/calls.js"></script>
</body>