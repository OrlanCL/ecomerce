    <?php echo $this->element('menusite'); ?>
    <?php 
    	if(isset($msg))
    	{
    		echo $this->element('success', array('msg' => 'Se ha creado el anuncio exitosamente.')); 
    	}
    ?>
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
        <form>
	  		<fieldset>
	    		<legend>Busque su auto ¡aquí!</legend>
	    		<label>Ingrese el texto a buscar.</label>
	    		<input id="query" type="text" placeholder="Ej: Toyota yaris 2010">
	    		<!--<span class="help-block">Opciones</span>
	    		<label class="checkbox"><input type="checkbox">Nuevo</label>-->
	    		<br>
	    		<button id="buscar" type="submit" class="btn">Buscar</button>
	    		<script>
	    			$(document).ready(function(){
	    				$("#loading").css("display", "inline");
      						$("#busqueda").load("/pry/ajax/search", function(){
         						$("#loading").css("display", "none");
      						});
	    				
	    				
   						$("#buscar").click(function(evento){
      					evento.preventDefault();
      					$("#loading").css("display", "inline");
      					var x = $("#query").val();
      						$("#busqueda").load("/pry/ajax/search/"+x, function(){
         						$("#loading").css("display", "none");
      						});
   						});
					});
	    		</script>
	  		</fieldset>
		</form>
        </div><!--/span-->
        
        <div id="busqueda" class="span9">
        	
      </div><!--/row-->

      <hr>
      <footer>
        <p align="center">&copy; compramiauto.cl - Todos los derechos reservados</p>
      </footer>

    </div><!--/.fluid-container-->
    
