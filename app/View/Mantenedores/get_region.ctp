<button id="add<?php echo ucwords($opt); ?>">Agregar</button>
<?php 
$this->Paginator->options(array('update' => '#loadData', 'evalScripts' => true));
?>
<table class="striped">
	<?php
	$tableHeaders = $this->Html->tableHeaders(array(
		$this->Paginator->sort('REG_ID', 'ID'),
		$this->Paginator->sort('REG_NOM', 'Nombre'),
		'Opciones'
	));
	echo $tableHeaders;
	$rows = array();
	foreach($regiones as $region) {
		$rows[] = array(
			$region[ucwords($opt)]['REG_ID'],
			$region[ucwords($opt)]['REG_NOM'],
			$this->Js->link('Editar', array('action' => 'edit'.ucwords($opt), $region[ucwords($opt)]['REG_ID']), array('update' => '#loadData')).' - '.
			$this->Js->link('Eliminar', array('action' => 'delete'.ucwords($opt), $region[ucwords($opt)]['REG_ID']), array('update' => '#loadData'))
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