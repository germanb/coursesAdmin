<%@ page import="coursesadmin.Cursos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="ui-widget">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cursosInstance}">
            <div class="errors">
                <g:renderErrors bean="${cursosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${cursosInstance?.id}" />
                <g:hiddenField name="version" value="${cursosInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="costo"><g:message code="cursos.costo.label" default="Costo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'costo', 'errors')}">
                                    <g:textField name="costo" value="${cursosInstance?.costo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="cursos.descripcion.label" default="Descripci&oacute;n" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${cursosInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="destinatarios"><g:message code="cursos.destinatarios.label" default="Destinatarios" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'destinatarios', 'errors')}">
                                    <g:textField name="destinatarios" value="${cursosInstance?.destinatarios}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="horas"><g:message code="cursos.horas.label" default="Horas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'horas', 'errors')}">
                                    <g:textField name="horas" value="${cursosInstance?.horas}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="cursos.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${cursosInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="obligatorio"><g:message code="cursos.obligatorio.label" default="Obligatorio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'obligatorio', 'errors')}">
                                    <g:select noSelection="${[null:'Ninguno']}"  name="obligatorio.id" from="${coursesadmin.Cursos.list()}" optionKey="id" optionValue="nombre" value="${cursosInstance?.obligatorio?.id}"  />
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
    	    	var costo = $("#costo").val();
    	    	var descripcion = $("#descripcion").val();
    	    	var destinatarios = $("#destinatarios").val();
    	    	var horas = $("#horas").val();
    	    	var nombre = $("#nombre").val();
    	    	var obligatorio = $("#obligatorio").val();
                var id = $("#id").val();
                var version = $("#version").val();
                var _action_update = "Update"
                $.post('/coursesAdmin/cursos/index', {_action_update:_action_update, id: id, version:version, 
                	costo:costo, descripcion:descripcion, horas:horas,destinatarios:destinatarios,
    	    		nombre:nombre, obligatorio:obligatorio}, function(data) {
    	    		$('.body').html(data);
    	    		return false;
                });
    	    });
        </script>
    </body>
</html>
