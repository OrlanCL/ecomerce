<?php echo $this->element('menusite'); ?>
<div class="container">
	<h2>Ingrese los datos para crear su anuncio</h2>
	<?php
			echo $this->Form->create('Anuncio', array('type' => 'file', 'url' => array('controller' => 'index', 'action' => 'guardarAnuncio')));
			?>
			<fieldset>
			<?php
			echo $this->Form->input('Anuncio.ANU_DES', array('label' => 'Descripción del anuncio', 'class' => 'input-xxlarge'));
			echo $this->Form->input('Persona.COM_ID', array('label' => 'Comuna', 'class' => 'input-xxlarge', 'options' => $comunas));
			echo $this->Form->input('Anuncio.MOD_ID', array('label' => 'Seleccione el modelo a publicar', 'class' => 'input-xxlarge', 'options' => $modelos));
			echo $this->Form->input('Anuncio.ANU_MTO', array('label' => 'Valor', 'class' => 'input-xxlarge', 'type' => 'text'));
			echo $this->Form->input('Persona.PER_NOM', array('label' => 'Nombre', 'class' => 'input-xxlarge', 'type' => 'text'));
			echo $this->Form->input('Persona.PER_APE', array('label' => 'Apellidos', 'class' => 'input-xxlarge', 'type' => 'text'));
			echo $this->Form->input('Persona.PER_RUT', array('label' => 'R.U.T.', 'class' => 'input-xxlarge', 'type' => 'text'));
			echo $this->Form->input('Persona.PER_MAIL', array('label' => 'Correo electrónico', 'class' => 'input-xxlarge', 'type' => 'text'));
			echo $this->Form->input('Persona.PER_TEL1', array('label' => 'Número de contacto', 'class' => 'input-xxlarge', 'type' => 'text'));
			echo $this->Form->input('Anuncio.ANU_IMG_DIR', array('type' => 'hidden', 'value' => md5( date('Y-m-d h:i:s') )));
			echo $this->Form->input('Interesado.IDO_CRN_FEC', array('type' => 'hidden', 'value' => date('Y-m-d h:i:s')));
			echo $this->Form->input('img', array('type' => 'file', 'label' => 'Seleccione uan foto para su anuncio', 'class' => 'btn'));
			?>
			<br>
			<br>
			<?php echo $this->Form->button('Crear el anuncio', array('type' => 'submit', 'class' => 'btn btn-large btn-primary')); ?>
			</fieldset>
	
	<?php echo $this->Form->end(); ?>
</div>
