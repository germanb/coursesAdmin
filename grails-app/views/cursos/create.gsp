<%@ page import="coursesadmin.Cursos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="body" class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cursosInstance}">
            <div class="errors">
                <g:renderErrors bean="${cursosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <div id="dialog-form" title="Alta de Cursos">
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
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
                                    <label for="costo"><g:message code="cursos.costo.label" default="Costo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'costo', 'errors')}">
                                    <g:textField name="costo" value="${cursosInstance?.costo}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="cursos.descripcion.label" default="Descripcion" /></label>
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
                                    <label for="obligatorio"><g:message code="cursos.obligatorio.label" default="Obligatorio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'obligatorio', 'errors')}">
                                    <g:select  name="obligatorio.id" from="${coursesadmin.Cursos.list()}" optionKey="id" optionValue="nombre" value="${cursosInstance?.obligatorio?.id}"  />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </g:form>
            </div>
            <br><br>
           <button id="continue">Continuar</button>
           <button id="clear">Limpiar</button>
        </div>
     
        <script type="text/javascript">
        
        $("button").button();
	    $("#continue").click(function(){
	    	var costo = $("#costo").val();
	    	var descripcion = $("#descripcion").val();
	    	var destinatarios = $("#destinatarios").val();
	    	var horas = $("#horas").val();
	    	var nombre = $("#nombre").val();
	    	var obligatorio = $("#obligatorio").val();
	    	$.post('/coursesAdmin/cursos/save',{costo:costo, descripcion:descripcion, horas:horas,destinatarios:destinatarios,
	    		nombre:nombre, obligatorio:obligatorio },  function(data) {
	    		$('.body').html(data);
            });
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
