<div class="page">
	<div class="page-region">
		<div class="page-region-content">
			<h1>Agregar un registro.</h1>
			<br>
			<?php
			echo $this->Form->create('Region');
			echo $this->Form->input('REG_NOM', array('div' => 'input-control text span4', 'label' => 'Nombre de la región'));
			?>
			<br>
			<?php echo $this->Js->submit('Guardar', array(
			'update' => '#mensaje',
			'url' => array('controller' => 'mantenedores', 'action' => 'addRegion'),
			'before' => $this->Js->get('#divEspera')->effect('fadeIn', array('buffer' => false)),
    		'complete' => $this->Js->get('#divEspera')->effect('fadeOut', array('buffer' => false))
			)); ?>
		</div>
	</div>
</div>

<?php echo $this->Js->writeBuffer(); ?>

