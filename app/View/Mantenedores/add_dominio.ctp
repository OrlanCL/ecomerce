<div class="page">
	<div class="page-region">
		<div class="page-region-content">
			<h1>Agregar un registro.</h1>
			<br>
			<?php
			echo $this->Form->create('Dominio');
			echo $this->Form->input('DOM_COD', array('div' => 'input-control text span4', 'label' => 'Código'));
			echo $this->Form->input('DOM_VAL', array('div' => 'input-control text span4', 'label' => 'Valor', 'type' => 'text'));
			echo $this->Form->input('DOM_EST', array('div' => 'input-control select span4', 'label' => 'Estado', 'options' => array(1 => 'Activo', 2 => 'Inactivo')));
			echo $this->Form->input('DOM_TXT_VAL', array('div' => 'input-control textarea span4', 'label' => 'Descripción', 'type' => 'textarea'));
			?>
			<br>
			<?php echo $this->Js->submit('Guardar', array(
			'update' => '#mensaje',
			'url' => array('controller' => 'mantenedores', 'action' => 'addDominio'),
			'before' => $this->Js->get('#divEspera')->effect('fadeIn', array('buffer' => false)),
    		'complete' => $this->Js->get('#divEspera')->effect('fadeOut', array('buffer' => false))
			)); ?>
		</div>
	</div>
</div>

<?php echo $this->Js->writeBuffer(); ?>

