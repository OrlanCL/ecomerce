<div class="page-header">
  				<h1>Avisos destacados <small>revisa estas oportunidades</small></h1>
			</div>
          <div class="row-fluid">
          	<?php
            	//debug(count($destacados)%3); 
            	foreach($destacados as $row => $anuncioArray) { 
            		//opendir('avisos/'.$anuncio['ANUNCIO']['ANU_IMG_DIR']);	
            ?>
            
            <ul class="thumbnails">
            	<?php 
            	foreach($anuncioArray as $cont => $anuncio) { 
            	?>
  				<li class="span4">
    			<div class="thumbnail" style="background-color: rgb(255, 252, 187)">
    				<?php echo $this->Html->image('avisos/'.$anuncio['a']['ANU_IMG_DIR'].'/01.jpg', array('alt' => '300x200', 'data-src' => 'holder.js/300x200', 'style' => 'width: 300px; height: 200px;')); ?>
      				<h4><?php echo $anuncio['mca']['MCA_NOM'] .' - '.$anuncio['m']['MOD_NOM']?></h4>
      				<p>Precio: <?php echo $this->number->currency(intval( $anuncio['a']['ANU_MTO']), null, array('decimals' => ',', 'thousands' => '.','places' => 0)); ?></p>
      				<p>
      					<a href="#" class="btn btn-primary">Ver más</a>
      				</p>
    			</div>
  				</li>
  				<?php } ?>
			</ul>
			<?php } ?>
			<?php if(1==2) { ?>
			<div class="page-header">
  				<h1>Resultados <small>de tu búsqueda</small></h1>
			</div>
			<?php } ?>
          
        </div><!--/span-->