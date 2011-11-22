
<%@ page import="coursesadmin.Participaciones" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'participaciones.label', default: 'Participaciones')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    
        <div id="body" class="ui-widget">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'participaciones.id.label', default: 'Id')}" />
                        
                            <th><g:message code="participaciones.edicion.label" default="Edici&oacute;n" /></th>
                        
                            <th><g:message code="participaciones.empleado.label" default="Empleado" /></th>
                        
                            <g:sortableColumn property="condicion" title="${message(code: 'participaciones.condicion.label', default: 'Condici&oacute;n')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${participacionesInstanceList}" status="i" var="participacionesInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${participacionesInstance.id}">${fieldValue(bean: participacionesInstance, field: "id")}</g:link></td>
                        
                            <td>${participacionesInstance.edicion.cursoPertenece + " - " + participacionesInstance.edicion.lugar + " - " + participacionesInstance.edicion.fecha}</td>
                        
                            <td>${fieldValue(bean: participacionesInstance, field: "empleado.nombre")}</td>
                        
                            <td>${fieldValue(bean: participacionesInstance, field: "condicion")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${participacionesInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
