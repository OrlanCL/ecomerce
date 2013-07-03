<button id="add<?php echo ucwords($opt); ?>">Agregar</button>
<?php 
$this->Paginator->options(array('update' => '#loadData', 'evalScripts' => true));
?>
<table class="striped">
	<?php
	//debug($comunas);
	$estado = array(0 => 'Inactivo', 1 => 'Activo');
	$tableHeaders = $this->Html->tableHeaders(array(
		$this->Paginator->sort('DOM_ID', 'ID'),
		$this->Paginator->sort('DOM_COD', 'Código'),
		$this->Paginator->sort('DOM_VAL', 'Valor'),
		$this->Paginator->sort('DOM_EST', 'Estado'),
		$this->Paginator->sort('DOM_TXT_VAL', 'Descripción'),
		'Opciones'
	));
	echo $tableHeaders;
	$rows = array();
	foreach($dominios as $dominio) {
		$rows[] = array(
			$dominio[ucwords($opt)]['DOM_ID'],
			$dominio[ucwords($opt)]['DOM_COD'],
			$dominio[ucwords($opt)]['DOM_VAL'],
			$estado[$dominio[ucwords($opt)]['DOM_EST']],
			$dominio[ucwords($opt)]['DOM_TXT_VAL'],
			$this->Js->link('Editar', array('action' => 'edit'.ucwords($opt), $dominio[ucwords($opt)]['DOM_ID']), array('update' => '#loadData')).' - '.
			$this->Js->link('Eliminar', array('action' => 'delete'.ucwords($opt), $dominio[ucwords($opt)]['DOM_ID']), array('update' => '#loadData'))
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