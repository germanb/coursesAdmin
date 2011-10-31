<%@ page import="coursesadmin.Administrativos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'administrativos.label', default: 'Administrativos')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="ui-widget">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${administrativosInstance}">
            <div class="errors">
                <g:renderErrors bean="${administrativosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField id="id" name="id" value="${administrativosInstance?.id}" />
                <g:hiddenField version="version" name="version" value="${administrativosInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="categoria"><g:message code="administrativos.categoria.label" default="Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administrativosInstance, field: 'categoria', 'errors')}">
                                    <g:textField name="categoria" value="${administrativosInstance?.categoria}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="oficina"><g:message code="administrativos.oficina.label" default="Oficina" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administrativosInstance, field: 'oficina', 'errors')}">
                                    <g:textField name="oficina" value="${administrativosInstance?.oficina}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tarea"><g:message code="administrativos.tarea.label" default="Tarea" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administrativosInstance, field: 'tarea', 'errors')}">
                                    <g:textField name="tarea" value="${administrativosInstance?.tarea}" />
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
                var categoria = $("#categoria").val();
                var oficina = $("#oficina").val();
                var tarea = $("#tarea").val();
                var id = $("#id").val();
                var version = $("#version").val();
                var _action_update = "Update"
                $.post('/coursesAdmin/administrativos/index', {_action_update:_action_update, id: id, version:version, categoria:categoria, oficina:oficina, tarea:tarea}, function(data) {
    	    		$('.body').html(data);
    	    		return false;
                });
    	    });
        </script>
    </body>
</html>
