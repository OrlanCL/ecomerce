<button id="add<?php echo ucwords($opt); ?>">Agregar</button>
<?php 
$this->Paginator->options(array('update' => '#loadData', 'evalScripts' => true));
?>
<table class="striped">
	<?php
	//debug($comunas);
	$tableHeaders = $this->Html->tableHeaders(array(
		$this->Paginator->sort('COM_ID', 'ID'),
		$this->Paginator->sort('COM_NOM', 'Nombre'),
		'Región',
		'Opciones'
	));
	echo $tableHeaders;
	$rows = array();
	foreach($comunas as $comuna) {
		$rows[] = array(
			$comuna[ucwords($opt)]['COM_ID'],
			$comuna[ucwords($opt)]['COM_NOM'],
			$regiones[$comuna[ucwords($opt)]['REG_ID']],
			$this->Js->link('Editar', array('action' => 'edit'.ucwords($opt), $comuna[ucwords($opt)]['COM_ID']), array('update' => '#loadData')).' - '.
			$this->Js->link('Eliminar', array('action' => 'delete'.ucwords($opt), $comuna[ucwords($opt)]['COM_ID']), array('update' => '#loadData'))
		);
	}
	
	echo $this->Html->tableCells($rows);
	//echo $tableHeaders;
	?>
</table>
<?php 
echo $this->Paginator->numbers(array('first' => '<< ', 'last' => ' >>'));
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