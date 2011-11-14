<html>
    <head>
        <title>Sistema de Admininstracion de Cursos</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        </style>

    </head>
    <body>
        <div id="nav">
            <div class="homePagePanel">
                <div id="accordion" style="float:left; margin-top:20px;margin-left:30px;width:228px;">
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <h3 id="${c.fullName.substring(13,c.fullName.length()-10)}_h"><a id="${c.fullName.substring(13,c.fullName.length()-10)}"  href="#">${c.fullName.substring(13,c.fullName.length()-10)}</a></h3>
				    		<ul>
								 <li><a href="#" id='${c.fullName.substring(13,c.fullName.length()-10)}_add'>Agregar</a></li>								
								<li><a id="${c.fullName.substring(13,c.fullName.length()-10)}_list" href="#">Listar</a></li>
							</ul>
                    </g:each>
                   <h3><a id="consultas"  href="#">Consultas</a></h3>
				    		<ul>
								 <li><a href="#" id='consulta1'>Empleados</a></li>								
								<li><a id="consulta2" href="#">Ediciones</a></li>
							</ul>
					<h3><a id="configuracion"  href="#">Configuraci&oacute;n</a></h3>
                    <ul>
                     	<li><div class="ui-corner-right" id="switcher"></div></li>	
                    </ul>
				</div>
            </div>
        </div>
        <div id="pageBody" class="ui-widget ">
       <!--      <h1>Bienvenido al Sistema de Administracion de Cursos</h1> -->
        </div>
       
        <div id="footer" style="height:100%;" class="ui-widget ui-helper-clearfix">
       
        </div>
        <script type="text/javascript">
        var icons = {
    			header: "ui-icon-circle-arrow-e",
    			headerSelected: "ui-icon-circle-arrow-s"
    		};
        $(function() {
    		$( "#accordion" ).accordion({
    			icons: icons,
    			autoHeight:false,
    			collapsible: true,
    			active: false 
    		});
    	});
        $("#Administrativos_h").hide();
        $("#Operarios_h").hide();
	    $("#Administrativos").click(function(){
	   		$('#pageBody').load('/coursesAdmin/administrativos/index #body');
	   		}
	   	);
	    $("#Administrativos_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/administrativos/index #body');
	   		}
	   	);
	    $("#Administrativos_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/administrativos/create');
	   		}
	   	);
	    $("#Cursos_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/cursos/index #body');
	   		}
	   	);
	    $("#Cursos_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/cursos/create');
	   		}
	   	);
	    $("#Cursos").click(function(){
	   		$('#pageBody').load('/coursesAdmin/cursos/index #body');
	   		}
	   	);
	    $("#Ediciones_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/ediciones/index #body');
	   		}
	   	);
	    $("#Ediciones_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/ediciones/create');
	   		}
	   	);
	    $("#Ediciones").click(function(){
	   		$('#pageBody').load('/coursesAdmin/ediciones/index #body');
	   		}
	   	);
	    $("#Empleados_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/empleados/index #body');
	   		}
	   	);
	    $("#Empleados_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/empleados/create');
	   		}
	   	);
	    $("#Empleados").click(function(){
	   		$('#pageBody').load('/coursesAdmin/empleados/index #body');
	   		}
	   	);
	    $("#Operarios_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/operarios/index #body');
	   		}
	   	);
	    $("#Operarios_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/operarios/create');
	   		}
	   	);
	    $("#Operarios").click(function(){
	   		$('#pageBody').load('/coursesAdmin/operarios/index #body');
	   		}
	   	);       
	    $("#Participaciones_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/participaciones/create');
	   		}
	   	);
	    $("#Participaciones").click(function(){
	   		$('#pageBody').load('/coursesAdmin/participaciones/index #body');
	   		}
	   	);    
	    $("#Participaciones_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/participaciones/index #body');
	   		}
	   	);
	    $("#consulta1").click(function(){
	   		$('#pageBody').load('/coursesAdmin/participaciones/createConsulta');
	   		}
	   	);
	    $("#consulta2").click(function(){
	   		$('#pageBody').load('/coursesAdmin/ediciones/createConsulta');
	   		}
	   	);
	   	$(document).ready(function(){
	   		

  		$('a').live('click',function(event){
  			event.preventDefault();

  			if(this.href.indexOf("edit") != -1){  			
  				$('#body').load(this.href );
  			}else if(this.href.indexOf("list") != -1){  			
  				$('#body').load(this.href + ' #body' );
  			}else if(this.href.indexOf("") == -1){   			
  				$('#body').load(this.href + ' #body');
  			}
  		 })
  		});
	   	$(document).ready(function(){
	   		$('#switcher').themeswitcher({buttonPreText:'Tema: ', initialText:'Temas '});

	   		});

        </script>
    </body>
</html>
