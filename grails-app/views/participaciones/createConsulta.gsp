<%@ page import="coursesadmin.Participaciones" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'participaciones.label', default: 'Participaciones')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="body" class="ui-widget">
            <h1>Empleados Cursando</h1>

        <div id="dialog-form" title="Alta de Ediciones">
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fecha"><g:message code="ediciones.fecha.label" default="Fecha Inicio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'fecha', 'errors')}">
                                    <input id="datepicker">
                                </td>
                            </tr>
                          <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fecha2"><g:message code="ediciones.fecha.label" default="Fecha Fin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'fecha2', 'errors')}">
                                    <input id="datepicker2">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
 			</g:form>
 			            <br><br>
           <button id="continue">Continuar</button>
           <button id="clear">Limpiar</button>
            <br><br>
            </div>


            <div class="list" id="list">
                <table>
                    <thead>
                        <tr>
  							<th>Nombre</th>                        
                            <th>Destinatarios del Curso</th>
                            <th>Tipo de Empleado</th>
                            <th>Cantidad de Horas</th>
                            <th>Fecha Inicio</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${resultSet}" status="i" var="result">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${result.nombre }</td>
                            <td>${result.destinatarios}</td>
                            <td>${result.tipo}</td>
                            <td>${result.horas}</td>
                             <td>${result.fecha}</td>
                        </tr>
                    </g:each>
                                            <tr class="even">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
        
        <script type="text/javascript">

        $.datepicker.setDefaults("es");
        $(function() {
    		$( "#datepicker" ).datepicker({
    			altField: "#datepicker",
    			altFormat: "dd/mm/yy",
    			changeMonth: true,
    			changeYear: true,
 
    		    showOn: "both", 
    		    buttonImage: "images/calendar.gif", 
    		    buttonImageOnly: true 
        		});

    	});

        $(function() {
    		$( "#datepicker2" ).datepicker({
    			altField: "#datepicker2",
    			altFormat: "dd/mm/yy",
    			changeMonth: true,
    			changeYear: true,
 
    		    showOn: "both", 
    		    buttonImage: "images/calendar.gif", 
    		    buttonImageOnly: true 
        		});

    	});
        
        $("button").button();

	    $("#continue").click(function(){
	    	var fecha = $("#datepicker").val();
	    	var fecha2 = $("#datepicker2").val();

	    	$('#list').load('/coursesAdmin/participaciones/createConsulta?fecha=' + fecha + '&fecha2=' + fecha2 + ' #list');
	    });
	    $("#clear").click(function(){
		    $(':input','#dialog-form')
		    .not(':button, :submit, :reset, :hidden')
		    .val('')
		    .removeAttr('checked')
		    .removeAttr('selected');
	    });


        </script>
    </body>
</html>
