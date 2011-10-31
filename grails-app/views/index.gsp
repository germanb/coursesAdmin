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
                        <h3><a id="${c.fullName.substring(13,c.fullName.length()-10)}"  href="#">${c.fullName.substring(13,c.fullName.length()-10)}</a></h3>
				    		<ul>
								 <li><a href="#" id='${c.fullName.substring(13,c.fullName.length()-10)}_add'>Agregar</a></li>								
								<li><a id="${c.fullName.substring(13,c.fullName.length()-10)}_list" href="#">Listar</a></li>
							</ul>
                    </g:each>
				</div>
            </div>
        </div>
        <div id="pageBody" class="ui-widget ">
       <!--      <h1>Bienvenido al Sistema de Administracion de Cursos</h1> -->
        </div>
        <div id="footer" style="height:100%;" class="ui-widget ui-helper-clearfix">
       
        </div>
        <script type="text/javascript">
        
        $(function() {
    		$( "#accordion" ).accordion();
    	});
	    $("#Administrativos").click(function(){
	   		$('#pageBody').load('/coursesAdmin/administrativos/index');
	   		}
	   	);
	    $("#Administrativos_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/administrativos/index');
	   		}
	   	);
	    $("#Administrativos_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/administrativos/create');
	   		}
	   	);
	    $("#Cursos_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/cursos/index');
	   		}
	   	);
	    $("#Cursos_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/cursos/create');
	   		}
	   	);
	    $("#Cursos").click(function(){
	   		$('#pageBody').load('/coursesAdmin/cursos/index');
	   		}
	   	);
	    $("#Ediciones_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/ediciones/index');
	   		}
	   	);
	    $("#Ediciones_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/ediciones/create');
	   		}
	   	);
	    $("#Ediciones").click(function(){
	   		$('#pageBody').load('/coursesAdmin/ediciones/index');
	   		}
	   	);
	    $("#Empleados_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/empleados/index');
	   		}
	   	);
	    $("#Empleados_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/empleados/create');
	   		}
	   	);
	    $("#Empleados").click(function(){
	   		$('#pageBody').load('/coursesAdmin/empleados/index');
	   		}
	   	);
	    $("#Operarios_list").click(function(){
	   		$('#pageBody').load('/coursesAdmin/operarios/index');
	   		}
	   	);
	    $("#Operarios_add").click(function(){
	   		$('#pageBody').load('/coursesAdmin/operarios/create');
	   		}
	   	);
	    $("#Operarios").click(function(){
	   		$('#pageBody').load('/coursesAdmin/operarios/index');
	   		}
	   	);

        </script>
    </body>
</html>
