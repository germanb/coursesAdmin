
<%@ page import="coursesadmin.Ediciones" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'ediciones.label', default: 'Ediciones')}" />
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
                            <td valign="top" class="name"><g:message code="ediciones.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: edicionesInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ediciones.lugar.label" default="Lugar" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: edicionesInstance, field: "lugar")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ediciones.fecha.label" default="Fecha" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: edicionesInstance, field: "fecha")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ediciones.horario.label" default="Horario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: edicionesInstance, field: "horario").replaceAll("ñ","&ntilde;")}</td>
                    	</tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ediciones.curso.label" default="Curso" /></td>
                            
                            <td valign="top" class="value"><g:link controller="cursos" action="show" id="${edicionesInstance?.curso?.id}">${edicionesInstance?.curso?.nombre.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
