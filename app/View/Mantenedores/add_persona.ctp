<div class="page">
	<div class="page-region">
		<div class="page-region-content">
			<h1>Agregar un registro.</h1>
			<br>
			<?php
			echo $this->Form->create('Persona');
			echo $this->Form->input('Interesado.IDO_USR', array('div' => 'input-control text span4', 'label' => 'Usuario'));
			echo $this->Form->input('Interesado.IDO_PWD', array('div' => 'input-control password span4', 'label' => 'Password', 'type' => 'password'));
			echo $this->Form->input('PER_NOM', array('div' => 'input-control text span4', 'label' => 'Nombre'));
			echo $this->Form->input('PER_APE', array('div' => 'input-control text span4', 'label' => 'Apellido'));
			echo $this->Form->input('PER_RUT', array('div' => 'input-control text span4', 'label' => 'RUT'));
			echo $this->Form->input('PER_DV', array('div' => 'input-control text span2', 'label' => 'Dígito verificador'));
			echo $this->Form->input('PER_MAIL', array('div' => 'input-control text span4', 'label' => 'E-Mail','type' => 'email'));
			echo $this->Form->input('PER_EST', array('div' => 'input-control select span4', 'label' => 'Estado','options' => array(0 => 'Desactivado',1 => 'Activado'), 'default' => 1));
			echo $this->Form->input('PER_TEL1', array('div' => 'input-control text span4', 'label' => 'Fono 1'));
			echo $this->Form->input('PER_TEL2', array('div' => 'input-control text span4', 'label' => 'Fono 2'));
			echo $this->Form->input('COM_ID', array('div' => 'input-control select span4', 'label' => 'Comuna', 'options' => $comuna));
			
			//echo $this->Form->input('IDO_ID', array('div' => 'input-control text span4', 'label' => 'Nombre'));
			//echo $this->Form->input('body', array('rows' => '3'));
			//echo $this->Form->end('Guardar registro');
			?>
			<br>
			<?php echo $this->Js->submit('Guardar', array(
			'update' => '#mensaje',
			'url' => array('controller' => 'mantenedores', 'action' => 'addPersona'),
			'before' => $this->Js->get('#divEspera')->effect('fadeIn', array('buffer' => false)),
    		'complete' => $this->Js->get('#divEspera')->effect('fadeOut', array('buffer' => false))
			)); ?>
			<!--<button id="boton">Hola</button>-->
			
			<!--<div id="element"></div>-->
		</div>
	</div>
</div>
<?php
/*
$this->Js->get('#boton')->event(
    'click',
    $this->Js->request(
        array('controller' => 'Home', 'action' => 'Prueba'),
        array('async' => true, 'update' => '#element')
    )
);
*/
?>
<?php echo $this->Js->writeBuffer(); ?>

