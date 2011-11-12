
<%@ page import="coursesadmin.Empleados" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'empleados.label', default: 'Empleados')}" />
        <title>Empleado Creado Exitosamente</title>
    </head>
    <body>
        <div class="body">
            <h1>Empleados</h1>
            <g:if test="${flash.message}">
            <div class="message">Empleado creado exitosamente con c&oacutedigo ${fieldValue(bean: empleadosInstance, field: "id")}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "nombre")}</td>    
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.sexo.label" default="Sexo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "sexo")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.nacimiento.label" default="Nacimiento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "nacimiento")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.telefono.label" default="Telefono" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "telefono")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.direccion.label" default="Direccion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "direccion")}</td>
                            
                        </tr>
						<tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.salario.label" default="Salario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "salario")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.capacitado.label" default="Capacitado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "capacitado")}</td>
                            
                        </tr>
                    </tbody>
                </table>
                <br><br>
           		<button id="continue_empleado">Continuar</button>
            </div>
        </div>
        
        <script type="text/javascript">
	        $("#continue_empleado").button();
		    $("#continue_empleado").click(function(){
	            $.post('/coursesAdmin/empleados/selectType', {id: ${fieldValue(bean: empleadosInstance, field: "id")}}, function(data) {
	     	    		$('.body').html(data);
		    		return false;
	            });
		    });
	    </script>
    </body>
</html>
