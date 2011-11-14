
<%@ page import="coursesadmin.Administrativos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'administrativos.label', default: 'Administrativos')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">Administrativo creado con identificador ${fieldValue(bean: cursosInstance, field: "id")}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="administrativos.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: administrativosInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="administrativos.categoria.label" default="Categoria" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: administrativosInstance, field: "categoria")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="administrativos.oficina.label" default="Oficina" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: administrativosInstance, field: "oficina")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="administrativos.tarea.label" default="Tarea" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: administrativosInstance, field: "tarea")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>
