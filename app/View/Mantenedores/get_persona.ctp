<button id="add<?php echo ucwords($opt); ?>">Agregar</button>
<?php 
$this->Paginator->options(array('update' => '#loadData', 'evalScripts' => true));
?>
<table class="striped">
	<?php
	$tableHeaders = $this->Html->tableHeaders(array(
		$this->Paginator->sort('PER_ID', 'ID'),
		$this->Paginator->sort('PER_NOM', 'Nombre'),
		$this->Paginator->sort('PER_APE', 'Apellido'),
		$this->Paginator->sort('PER_RUT', 'RUT'),
		$this->Paginator->sort('PER_DV', 'Dígito V.'),
		'Opciones'
	));
	echo $tableHeaders;
	$rows = array();
	foreach($personas as $persona) {
		$rows[] = array(
			$persona['Persona']['PER_ID'],
			$persona['Persona']['PER_NOM'],
			$persona['Persona']['PER_APE'],
			$persona['Persona']['PER_RUT'],
			$persona['Persona']['PER_DV'],
			$this->Js->link('Editar', array('action' => 'editPersona', $persona['Persona']['PER_ID']), array('update' => '#loadData')).' - '.
			$this->Js->link('Eliminar', array('action' => 'deletePersona', $persona['Persona']['PER_ID']), array('update' => '#loadData'))
		);
	}
	
	echo $this->Html->tableCells($rows);
	//echo $tableHeaders;
	?>
</table>
<?php 
echo $this->Paginator->numbers();
$this->Js->get('#add'.ucwords($opt))->event(
    'click',
    $this->Js->request(
        array('controller' => 'mantenedores', 'action' => 'add'.ucwords($opt)),
        array(	'async' => true, 
        		'update' => '#loadData'
        		//'before' => $this->Js->get('#divEspera')->effect('fadeIn', array('buffer' => false)),
    			//'complete' => $this->Js->get('#divEspera')->effect('fadeOut', array('buffer' => false))
    			)
    )
);
echo $this->Js->writeBuffer();
?>