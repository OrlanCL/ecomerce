	<div class="navbar navbar-inverse navbar-fixed-top" align="center">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="/pry">compramiauto.cl</a>
          <div class="nav-collapse collapse">
          	<?php if(false) { ?>
            <p class="navbar-text pull-right">
              Bienvenido: <a href="#" class="navbar-link">Username</a>
            </p>
            <?php } ?>
            <ul class="nav">
              <li class="active"><a href="#">Inicio</a></li>
              <li><a href="#about">Nuestro proyecto</a></li>
              <li><a href="#contact">¡Contáctenos!</a></li>
              <!--
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
              -->
            </ul>
            <!--
            <form class="navbar-form pull-right">
              <input class="span2" type="text" placeholder="Email">
              <input class="span2" type="password" placeholder="Constraseña">
              <button type="submit" class="btn btn-primary">Entrar</button>
            </form>
            -->
          </div><!--/.nav-collapse -->
        </div>
      </div>
      <div id="loading" class="container" style="display:none;"><?php echo $this->Html->image('ajax-loader.gif'); ?>&nbsp;&nbsp;Cargando datos, por favor espere...</div>
    </div>
    
