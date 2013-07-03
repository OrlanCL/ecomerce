<?php
class IndexController extends AppController {
	
	public $components = array('RequestHandler');
	public $helpers = array('Js' => array('Jquery'),'Html','Form');

	public function index() 
	{
		//$x = $this->xval();
		//$this->set('x', $x);
		$this->set('title_for_layout', 'Vendomiauto.cl - Autos nuevos y usados a la venta.');
		$this->render('index', 'site');
	}
	
	public function search($msg = null) 
	{
		$this->loadModel('Anuncio');
		$destacados = $this->Anuncio->query("SELECT * FROM anuncio a INNER JOIN modelo m ON m.mod_id = a.mod_id INNER JOIN marca mca ON mca.mca_id = m.mca_id WHERE a.ANU_TIP = 2");
		$this->set('destacados', $destacados);
		$this->set('title_for_layout', 'Compramiauto.cl - Autos nuevos y usados a la venta.');
		if(!is_null($msg))
		{
			$this->set('msg', $msg);
		}
		$this->render('search', 'site');
	}
	
	public function crearAnuncio()
	{
		$this->loadModel('Comuna');
		$this->loadModel('Modelo');
		$this->set('comunas', $this->Comuna->find('list'));
		$this->set('modelos', $this->Modelo->find('list'));
		$this->render('crearAnuncio', 'site');
	}
	
	public function guardarAnuncio()
	{
		$this->loadModel('Persona');
		$this->loadModel('Interesado');
		$this->loadModel('Anuncio');
		
		$rut_expl = explode("-", str_replace(".", "", $this->request->data['Persona']['PER_RUT']));
		
		$rut = $rut_expl[0];
		$dv = $rut_expl[1];
		
		$this->request->data['Persona']['PER_RUT'] = $rut;
		$this->request->data['Persona']['PER_DV'] = $dv;
		
		$this->request->data['Interesado']['IDO_USR'] = $this->request->data['Persona']['PER_MAIL'];
		
		$dir = WWW_ROOT.'img'.DS.'avisos'.DS.$this->request->data['Anuncio']['ANU_IMG_DIR'];
		
		if(!is_dir($dir))
		{
			mkdir($dir);
		}
		$file_data = explode('.', $this->request->data['Anuncio']['img']['name']);
		
		move_uploaded_file($this->request->data['Anuncio']['img']['tmp_name'], $dir.DS.'01.'.$file_data[1]);
		//debug($dir);
		//debug($this->data);
		//die();
		
		$this->Interesado->save($this->request->data);
		$this->request->data['Persona']['IDO_ID'] = $this->Interesado->id;
		$this->request->data['Anuncio']['IDO_ID'] = $this->Interesado->id;
		$this->request->data['Anuncio']['ANU_TIP'] = 2;
		
		
		$this->Persona->save($this->request->data);
		
		//Guardar la foto
		
		unset($this->request->data['Anuncio']['img']);
		
		$this->Anuncio->save($this->request->data);
		
		$this->render('guardarAnuncio', 'site');
		$this->redirect(array('controller' => 'index', 'action' => 'search', 'Saved'));
	}

}
?>