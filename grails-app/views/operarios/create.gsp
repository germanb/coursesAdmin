

<%@ page import="coursesadmin.Operarios" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'operarios.label', default: 'Operarios')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${operariosInstance}">
            <div class="errors">
                <g:renderErrors bean="${operariosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <div id="dialog-form" title="Alta de Operarios">
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sector"><g:message code="operarios.sector.label" default="Sector" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: operariosInstance, field: 'sector', 'errors')}">
                                    <g:textField name="sector" value="${operariosInstance?.sector}" />
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
	    	var sector = $("#sector").val();
	    	$.post('/coursesAdmin/operarios/save',{sector:sector},  function(data) { 
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
