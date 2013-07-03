<div class="page">
	<div class="page-region">
		<div class="page-region-content">
			<h1>Modificar un registro.</h1>
			<br>
			<?php
			echo $this->Form->create('Comuna');
			echo $this->Form->input('COM_NOM', array('div' => 'input-control text span4', 'label' => 'Nombre de la comuna', 'value' => $comuna['Comuna']['COM_NOM']));
			echo $this->Form->input('REG_ID', array('div' => 'input-control select span4', 'label' => 'Región', 'options' => $regiones, 'selected' => $comuna['Comuna']['REG_ID']));
			?>
			<br>
			<?php echo $this->Js->submit('Guardar', array(
			'update' => '#mensaje',
			'url' => array('controller' => 'mantenedores', 'action' => 'editComuna', $comuna['Comuna']['COM_ID']),
			'before' => $this->Js->get('#divEspera')->effect('fadeIn', array('buffer' => false)),
    		'complete' => $this->Js->get('#divEspera')->effect('fadeOut', array('buffer' => false))
			)); ?>
		</div>
	</div>
</div>

<?php echo $this->Js->writeBuffer(); ?>

