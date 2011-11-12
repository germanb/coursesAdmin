<%@ page import="coursesadmin.Ediciones" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'ediciones.label', default: 'Ediciones')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="body" class="body">
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
                                    <label for="curso"><g:message code="ediciones.curso.label" default="Curso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: edicionesInstance, field: 'curso', 'errors')}">
                                    <g:select name="curso" from="${coursesadmin.Cursos.list(offset:1)}" optionValue="nombre"  optionKey="id" value="${edicionesInstance?.curso?.id}"  />                              
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

        $(function() {
    		$( "#datepicker" ).datepicker();
    	});

        $("button").button();
	    $("#continue").click(function(){
            var codigo = $("#codigo").val();
            var fecha = $("#datepicker").val();
            var horario = $("#horario").val();
            var lugar = $("#lugar").val();
            var curso = $("#curso").val();
            $.post('/coursesAdmin/ediciones/save', {curso: curso, fecha:fecha, horario:horario, lugar:lugar}, function(data) {
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
