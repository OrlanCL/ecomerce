<?php
/**
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.View.Layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<?php echo $this->Html->charset(); ?>
	<title>
		<?php echo $title_for_layout; ?>
	</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
    <meta name="author" content="">
	<?php
		echo $this->Html->meta('icon');
		
		echo $this->Html->css('../bootstrap/css/bootstrap');
	?>
	<style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
	<?php
		echo $this->Html->css('../bootstrap/css/bootstrap-responsive');
		echo $this->fetch('meta');
		echo $this->fetch('css');
	?>
	<?php 
		echo $this->Html->script('../bootstrap/js/jquery');
		echo $this->Html->script('../bootstrap/js/bootstrap-transition');
		echo $this->Html->script('../bootstrap/js/bootstrap-alert');
		echo $this->Html->script('../bootstrap/js/bootstrap-modal');
		echo $this->Html->script('../bootstrap/js/bootstrap-dropdown');
		echo $this->Html->script('../bootstrap/js/bootstrap-scrollspy');
		echo $this->Html->script('../bootstrap/js/bootstrap-tab');
		echo $this->Html->script('../bootstrap/js/bootstrap-tooltip');
		echo $this->Html->script('../bootstrap/js/bootstrap-popover');
		echo $this->Html->script('../bootstrap/js/bootstrap-button');
		echo $this->Html->script('../bootstrap/js/bootstrap-collapse');
		echo $this->Html->script('../bootstrap/js/bootstrap-carousel');
		echo $this->Html->script('../bootstrap/js/bootstrap-typeahead');
		echo $this->fetch('script');
	?>
</head>
<body id="body">
	<div id="divEspera" style="display:none;text-align: center;"><h3>Cargando...</h3></div>
	<?php echo $this->fetch('content'); ?>
	<?php echo $this->Js->writeBuffer(); ?>
</body>
</html>
