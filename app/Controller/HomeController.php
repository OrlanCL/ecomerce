<?php
class HomeController extends AppController {
	
	public $components = array('RequestHandler');
	public $helpers = array('Js' => array('Jquery'),'Html','Form');

	public function index() {
		//$x = $this->xval();
		//$this->set('x', $x);
		$this->set('title_for_layout', 'Vendomiauto.cl - Autos nuevos y usados a la venta.');
		$this->layout('site');
	}
	
	public function Prueba(){
		
		
	}

}
?>