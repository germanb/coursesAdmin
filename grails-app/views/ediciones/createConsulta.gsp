<%@ page import="coursesadmin.Ediciones" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'ediciones.label', default: 'Ediciones')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
		<h1>Consulta de Ediciones</h1>
        <div id="body" class="ui-widget">
        <div id="dialog-form" title="Alta de Ediciones">
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fecha"><g:message code="ediciones.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'fecha', 'errors')}">
                                    <input id="datepicker">
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'ediciones.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="lugar" title="${message(code: 'ediciones.lugar.label', default: 'Lugar')}" />
                        
                            <g:sortableColumn property="fecha" title="${message(code: 'ediciones.fecha.label', default: 'Fecha')}" />
                        
                            <g:sortableColumn property="horario" title="${message(code: 'ediciones.horario.label', default: 'Horario')}" />

                            <th><g:message code="ediciones.curso.label" default="Curso" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${edicionesInstanceList}" status="i" var="edicionesInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${edicionesInstance.id}">${fieldValue(bean: edicionesInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: edicionesInstance, field: "lugar")}</td>
                        
                            <td>${fieldValue(bean: edicionesInstance, field: "fecha")}</td>
                        
                            <td>${fieldValue(bean: edicionesInstance, field: "horario").replaceAll("ñ","&ntilde;")}</td>

                            <td>${fieldValue(bean: edicionesInstance, field: "curso.nombre")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${edicionesInstanceTotal}" />
     </div>
     </div>
             <div id="footer" style="height:100%;" class="ui-widget ui-helper-clearfix">
                     <br><br>

           

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

        $("button").button();

	    $("#continue").click(function(){
	    	var fecha = $("#datepicker").val();
	    	$('#list').load('/coursesAdmin/ediciones/createConsulta?fecha=' + fecha + ' #list');
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
