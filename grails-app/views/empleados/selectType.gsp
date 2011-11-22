<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'empleados.label', default: 'Empleados')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

	<div id="tabs">
 	
 		<ul>
			<li><a id="titleTab1" href="#tabs-1">Administrativo</a></li>
			<li><a id="titleTab2" href="#tabs-2">Operario</a></li>
		</ul>

        <div id="tabs-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
            <div id="dialog-form" title="Alta de Empleado Administrativo ${empleadosInstance.id}">
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="oficina">Oficina</label>
                                </td>
                                <td valign="top" class="value ">
                                    <input type="text" name="oficina" value="" id="oficina">
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tarea">Tarea</label>
                                </td>
                                <td valign="top" class="value ">
                                    <input type="text" name="tarea" value="" id="tarea">
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="categoria">Categoria</label>
                                </td>
                                <td valign="top" class="value ">
                                    <input type="text" name="categoria" value="" id="categoria">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
 			</g:form>
            </div>
        </div>
		
		<div id="tabs-2" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
            <div id="dialog-form" title="Alta de Empleado Administrativo ${empleadosInstance.id}">
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sector">Sector</label>
                                </td>
                                <td valign="top" class="value ">
                                    <input type="text" name="sector" value="" id="sector">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
 			</g:form>
	</div>

        </div>
        
        <div style="margin:10px;">
        	                    <br><br>
           <button id="continue">Continuar</button>
           <button id="clear">Limpiar</button>
           </div>
</div>
		

        <script type="text/javascript">

        $(function() {
    		$( "#tabs" ).tabs();
    	});

        var tabSelected = "1";
                $("button").button();
        	    $("#continue").click(function(){
        	    	var oficina = $("#oficina").val();
        	    	var tarea = $("#tarea").val();
        	    	var categoria = $("#categoria").val();
        	    	var id = ${empleadosInstance.id };
        	    	var sector = $("#sector").val();
        	    	if(tabSelected == "1"){
		                $.post('/coursesAdmin/administrativos/save',{oficina:oficina, tarea:tarea, categoria:categoria, 
			                id:id, tipo: "Administrativo"
			                },  function(data) {
				                $('.body').html(data);
	                    });
        	    	}else{
		                $.post('/coursesAdmin/operarios/save',{
			                sector:sector, id:id, tipo: "Operario"
			                },  function(data) {
				                $('.body').html(data);
	                    });
        	    	}
        	    });
        	    $("#titleTab1").click(function(){
        	    	tabSelected = "1";
        		    $(':input','#dialog-form')
        		    .not(':button, :submit, :reset, :hidden')
        		    .val('')
        		    .removeAttr('checked')
        		    .removeAttr('selected');
        	    });
        	    $("#titleTab2").click(function(){
        	    	tabSelected = "2";
        		    $(':input','#dialog-form')
        		    .not(':button, :submit, :reset, :hidden')
        		    .val('')
        		    .removeAttr('checked')
        		    .removeAttr('selected');
        	    });


        	    $(function() {
        			var availableTags1 = [
        				"Oficina 1",
        				"Oficina 2",
        				"Oficina 3",
        				"Oficina 4",
        				"Oficina 5",
        				"Oficina 6",
        				"Gerencia General",
        				"Contaduria"
        			];
        			$( "#oficina" ).autocomplete({
        				source: availableTags1
        			});
        		});

        	    $(function() {
        			var availableTags2 = [
        				"Sector 1",
        				"Sector 2",
        				"Sector 3",
        				"Sector 4",
        				"Sector 5",
        				"Sector 6",
        				"Sector 7G"
        			];
        			$( "#sector" ).autocomplete({
        				source: availableTags2
        			});
        		});

        	    $(function() {
        			var availableTags3 = [
        				"Cat 1A",
        				"Cat 2A",
        				"Cat 3A",
        				"Cat 4A",
        				"Cat 1B",
        				"Cat 2B",
        				"Cat 1C"
        			];
        			$( "#categoria" ).autocomplete({
        				source: availableTags3
        			});
        		});
        </script>
    </body>
</html>
