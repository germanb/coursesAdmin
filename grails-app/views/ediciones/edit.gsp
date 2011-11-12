<%@ page import="coursesadmin.Ediciones" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ediciones.label', default: 'Ediciones')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="ui-widget">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${edicionesInstance}">
            <div class="errors">
                <g:renderErrors bean="${edicionesInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${edicionesInstance?.id}" />
                <g:hiddenField name="version" value="${edicionesInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lugar"><g:message code="ediciones.lugar.label" default="Lugar" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'lugar', 'errors')}">
                                    <g:textField name="lugar" value="${edicionesInstance?.lugar}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fecha"><g:message code="ediciones.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'fecha', 'errors')}">
                                    <g:textField name="fecha" value="${edicionesInstance?.fecha}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="horario"><g:message code="ediciones.horario.label" default="Horario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'horario', 'errors')}">
                                    <g:textField name="horario" value="${edicionesInstance?.horario}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigo"><g:message code="ediciones.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${edicionesInstance?.codigo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="curso"><g:message code="ediciones.curso.label" default="Curso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'curso', 'errors')}">
                                    <g:select name="curso.id" from="${coursesadmin.Cursos.list()}" optionKey="id" value="${edicionesInstance?.curso?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <br><br>
           		<button id="update">Actualizar</button>
            </g:form>
            <div id="footer" style="height:100%;" class="ui-widget ui-helper-clearfix">
        </div>
        </div>
        <script type="text/javascript">
        	$("button").button();
    	    $("#update").click(function(){
    	    	var nombre = $("#lugar").val();
    	    	var fecha = $("#fecha").val();
    	    	var horario = $("#horario").val();
    	    	var codigo = $("#codigo").val();
    	    	var curso = $("#curso").val();
    	    	
                var id = $("#id").val();
                var version = $("#version").val();
                var _action_update = "Update"
                $.post('/coursesAdmin/ediciones/index', {_action_update:_action_update, id: id, version:version, 
                	lugar:lugar, fecha:fecha, horario:horario, codigo:codigo,
    		    	curso:curso}, function(data) {
    	    		$('.body').html(data);
    	    		return false;
                });
    	    });
        </script>
    </body>
</html>
