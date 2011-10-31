

<%@ page import="coursesadmin.Ediciones" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'ediciones.label', default: 'Ediciones')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="ui-widget ">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${edicionesInstance}">
            <div class="errors">
                <g:renderErrors bean="${edicionesInstance}" as="list" />
            </div>
            </g:hasErrors>
            <div id="dialog-form" title="Alta de Ediciones">
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
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
                                    <label for="fecha"><g:message code="ediciones.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'fecha', 'errors')}">
									 <div id="datepicker"></div>
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
                                    <label for="lugar"><g:message code="ediciones.lugar.label" default="Lugar" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'lugar', 'errors')}">
                                    <g:textField name="lugar" value="${edicionesInstance?.lugar}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
                <script type="text/javascript">
            	$(function() {
            		$( "#datepicker" ).datepicker();
            	});

        $(function() {
            $('#dialog-form').dialog({
                autoOpen: true,
                height: 'auto',
                width: 350,
                modal: true,
                close: function(ev, ui) {  $(this).dialog("destroy"); },
                buttons: {
                    'Continuar': function() {
		                var codigo = $("#codigo").val();
		                var fecha = $("#datepicker").val();
		                var horario = $("#horario").val();
		                var lugar = $("#lugar").val();
		                $.post('/coursesAdmin/ediciones/save', {codigo:codigo, fecha:fecha, horario:horario, lugar:lugar}, function(data) {
		                	$('#dialog-form').html(data);
                        });
        
                    },
                    'Cancelar': function() {
                        $(this).dialog('close');
                        $(this).dialog("destroy");
                    }
                }
            });
        });
        $('#Ediciones_add').click(function() {
        	$('#dialog-form').dialog('open');
        	});
        </script>
    </body>
</html>
