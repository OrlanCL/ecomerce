<div class="page">
	<?php echo $this->element('menu'); ?>
	<div class="page-region">
		<div class="page-region-content">
			<div id="mensaje"></div>
			<h2><?php echo 'Mantenedor de tabla: '.$opt; ?></h2>
		</div>
		<div id="loadData"></div>
		<?php
		//$this->Js->request(array('action' => 'getPersona'), array('async' => true, 'update' => '#loadData'));
		
		//echo $this->Js->writeBuffer();
		?>
	</div>
</div>
<script>
	$('#loadData').load('../get<?php echo $opt; ?>');
</script>
<?php
echo $this->Js->writeBuffer();
?>