<%@ page import="coursesadmin.Administrativos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'administrativos.label', default: 'Administrativos')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="body" class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${administrativosInstance}">
            <div class="errors">
                <g:renderErrors bean="${administrativosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <div id="dialog-form" title="Alta de Administrativo">
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="categoria"><g:message code="administrativos.categoria.label" default="Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: administrativosInstance, field: 'categoria', 'errors')}">
                                    <g:textField size="25" class="required" minlength="2" name="categoria" id="categoria" value="${administrativosInstance?.categoria}" type="text"/>
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
            </g:form>
            </div>
            <br><br>
           <button id="continue">Continuar</button>
           <button id="clear">Limpiar</button>
        </div>
        <script type="text/javascript">

        $("button").button();
	    $("#continue").click(function(){
            var categoria = $("#categoria").val();
            var oficina = $("#oficina").val();
            var tarea = $("#tarea").val();
            $.post('/coursesAdmin/administrativos/save', {categoria:categoria, oficina:oficina, tarea:tarea}, function(data) {
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
