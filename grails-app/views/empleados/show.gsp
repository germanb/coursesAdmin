
<%@ page import="coursesadmin.Empleados" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'empleados.label', default: 'Empleados')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.capacitado.label" default="Capacitado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "capacitado")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.codigo.label" default="Codigo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "codigo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.direccion.label" default="Direccion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "direccion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.firma.label" default="Firma" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "firma")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.nacimiento.label" default="Nacimiento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "nacimiento")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.salario.label" default="Salario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "salario")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.sexo.label" default="Sexo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "sexo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="empleados.telefono.label" default="Telefono" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: empleadosInstance, field: "telefono")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
