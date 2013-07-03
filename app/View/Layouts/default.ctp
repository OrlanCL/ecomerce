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
	<?php
		echo $this->Html->meta('icon');
		
		echo $this->Html->css('css/modern');
		echo $this->Html->css('css/modern-responsive');
		echo $this->Html->css('css/site');
		
		echo $this->Html->script('jquery-1.9.0.min');
		echo $this->Html->script('jquery.mousewheel.min');
		echo $this->Html->script('moment');
		echo $this->Html->script('moment_langs');
		echo $this->Html->script('../css/javascript/dropdown');
		echo $this->Html->script('../css/javascript/accordion');
		echo $this->Html->script('../css/javascript/buttonset');
		echo $this->Html->script('../css/javascript/carousel');
		echo $this->Html->script('../css/javascript/input-control');
		echo $this->Html->script('../css/javascript/pagecontrol');
		echo $this->Html->script('../css/javascript/rating');
		echo $this->Html->script('../css/javascript/slider');
		echo $this->Html->script('../css/javascript/tile-slider');
		echo $this->Html->script('../css/javascript/tile-drag');
		echo $this->Html->script('../css/javascript/calendar');

		echo $this->fetch('meta');
		echo $this->fetch('css');
		echo $this->fetch('script');
	?>
</head>
<body id="body" class="metrouicss">
	<div id="divEspera" style="display:none;text-align: center;"><h3>Cargando...</h3></div>
	<?php //echo $this->Session->flash(); ?>

	<?php echo $this->fetch('content'); ?>
</body>
</html>
