<?php
class MantenedoresController extends AppController {
	
	public $components = array('RequestHandler','Session');
	public $helpers = array('Js' => array('Jquery'),'Html','Form','Session');
	public $paginate = array('limit' => 15);
	
	public function index($opt = null) {
		if(!is_null($opt)) {
			$this->set('opt', $opt);
		} 
	}
	
	public function getPersona() {
		
		$this->loadModel('Persona');
		
		$this->set('personas',$this->paginate('Persona'));
		$this->set('opt', 'Persona');
		$this->render('getPersona','ajax');
		
	}
	
	public function getRegion() {
		
		$this->loadModel('Region');
		
		$this->set('regiones',$this->paginate('Region'));
		$this->set('opt', 'Region');
		$this->render('getRegion','ajax');
		
	}
	
	public function getComuna() {
		
		$this->loadModel('Comuna');
		$this->loadModel('Region');
		
		$this->set('comunas', $this->paginate('Comuna'));
		$this->set('regiones', $this->Region->find('list'));
		$this->set('opt', 'Comuna');
		$this->render('getComuna','ajax');
		
	}
	
	public function getDominio() {
		
		$this->loadModel('Dominio');
		
		$this->set('dominios', $this->paginate('Dominio'));
		$this->set('opt', 'Dominio');
		$this->render('getDominio','ajax');
		
	}

	public function addPersona() {
		
		$this->loadModel('Comuna');
		$this->set('comuna', $this->Comuna->find('list'));
		
		if (isset($this->request->data['Persona'])) {
			$this->loadModel('Interesado');
			$this->loadModel('Persona');
			
			$this->request->data['Interesado']['IDO_CRN_FEC'] = date('Y-m-d h:i:s');
			
			$this->Interesado->save($this->request->data);
			
			$this->request->data['Persona']['IDO_ID'] = $this->Interesado->id;
			
            //$this->Persona->create();
            if ($this->Persona->save($this->request->data)) {
                $this->render('message', 'ajax');
            } 
			
        } else {
        	$this->render('addPersona','ajax');
        }

	}
	
	public function addRegion() {
		
		if ($this->request->is('post')) {
			$this->loadModel('Region');

            if ($this->Region->save($this->request->data)) {
                $this->render('message', 'ajax');
				//$this->redirect(array('controller' => 'mantenedores', 'action' => 'getPersona'));
            } else {
                //$this->Session->setFlash('.');
            }
        } else {
        	$this->render('addRegion','ajax');
        }

	}

	public function addComuna() {
		
		$this->loadModel('Region');
		$this->set('regiones', $this->Region->find('list'));
		
		if ($this->request->is('post')) {
			$this->loadModel('Comuna');

            if ($this->Comuna->save($this->request->data)) {
                $this->render('message', 'ajax');
				//$this->redirect(array('controller' => 'mantenedores', 'action' => 'getPersona'));
            } else {
                //$this->Session->setFlash('.');
            }
        } else {
        	$this->render('addComuna','ajax');
        }
		
	}
	
	public function addDominio() {
		
		if ($this->request->is('post')) {
			$this->loadModel('Dominio');

            if ($this->Dominio->save($this->request->data)) {
                $this->render('message', 'ajax');
				//$this->redirect(array('controller' => 'mantenedores', 'action' => 'getPersona'));
            } else {
                //$this->Session->setFlash('.');
            }
        } else {
        	$this->render('addDominio','ajax');
        }

	}
	
	public function editPersona($id = null) {
		$this->loadModel('Persona');
		$this->loadModel('Comuna');
		$this->loadModel('Interesado');
		
		$persona = $this->Persona->findByPerId($id);
		$interesado = $this->Interesado->findByIdoId($persona['Persona']['IDO_ID']);
		
		if($this->request->is('post')) {
			$this->Persona->id = $id;
			$this->Persona->save($this->request->data);
			$this->Interesado->id = $this->request->data['Interesado']['IDO_ID'];
			$this->Interesado->save($this->request->data);
			$this->render('message', 'ajax');
		}
		
		$this->set('comuna', $this->Comuna->find('list'));
		$this->set('persona', $persona);
		$this->set('interesado', $interesado);
	}
	
	public function editRegion($id = null) {
		$this->loadModel('Region');
		
		$region = $this->Region->findByRegId($id);
		
		if($this->request->is('post')) {
			$this->Region->id = $id;
			$this->Region->save($this->request->data);
			$this->render('message', 'ajax');
		} else {
			$this->set('region', $region);
		}
	}
	
	public function editComuna($id = null) {
		$this->loadModel('Comuna');
		$this->loadModel('Region');
		
		$this->set('regiones', $this->Region->find('list'));
		
		$comuna = $this->Comuna->findByComId($id);
		
		if($this->request->is('post')) {
			$this->Comuna->id = $id;
			$this->Comuna->save($this->request->data);
			$this->render('message', 'ajax');
		} else {
			$this->set('comuna', $comuna);
		}
	}
	
	public function editDominio($id = null) {
		$this->loadModel('Dominio');
		
		$dominio = $this->Dominio->findByDomId($id);
		
		if($this->request->is('post')) {
			$this->Dominio->id = $id;
			$this->Dominio->save($this->request->data);
			$this->render('message', 'ajax');
		} else {
			$this->set('dominio', $dominio);
		}
	}
	
	public function deletePersona($id = null) {
		$this->loadModel('Persona');
		$this->loadModel('Interesado');
		
		if($this->Persona->delete($id)) {
			$this->render('delete', 'ajax');
			//$this->redirect(array('action' => 'getPersona', 'delMsg'));
		}
	}
	
	public function deleteRegion($id = null) {
		
		$this->loadModel('Region');
		
		$this->Region->query('DELETE FROM REGION WHERE REG_ID = '.$id);
		$this->render('delete', 'ajax');
	}
	
	public function deleteComuna($id = null) {
		
		$this->loadModel('Comuna');
		
		$this->Comuna->query('DELETE FROM COMUNA WHERE COM_ID = '.$id);
		$this->render('delete', 'ajax');
	}
	
	public function deleteDominio($id = null) {
		
		$this->loadModel('Dominio');
		
		$this->Dominio->query('DELETE FROM DOMINIO WHERE DOM_ID = '.$id);
		$this->render('delete', 'ajax');
	}
}
?>