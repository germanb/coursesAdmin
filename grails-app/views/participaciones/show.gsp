
<%@ page import="coursesadmin.Participaciones" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'participaciones.label', default: 'Participaciones')}" />
        <title>Participacion</title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">Participacion creada exitosamente con c&oacutedigo ${fieldValue(bean: empleadosInstance, field: "id")}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="participaciones.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: participacionesInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="participaciones.edicion.label" default="Edici&oacute;n" /></td>
                            
                            <td valign="top" class="value"><g:link controller="ediciones" action="show" id="${participacionesInstance?.edicion?.id}">${participacionesInstance?.edicion?.id.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="participaciones.empleado.label" default="Empleado" /></td>
                            
                            <td valign="top" class="value"><g:link controller="empleados" action="show" id="${participacionesInstance?.empleado?.id}">${participacionesInstance?.empleado?.nombre.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="participaciones.condicion.label" default="Condicion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: participacionesInstance, field: "condicion")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
