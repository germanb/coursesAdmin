
<%@ page import="coursesadmin.Ediciones" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'ediciones.label', default: 'Ediciones')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="ui-widget ">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="ui-state-highlight">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'ediciones.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="codigo" title="${message(code: 'ediciones.codigo.label', default: 'Codigo')}" />
                        
                            <g:sortableColumn property="fecha" title="${message(code: 'ediciones.fecha.label', default: 'Fecha')}" />
                        
                            <g:sortableColumn property="horario" title="${message(code: 'ediciones.horario.label', default: 'Horario')}" />
                        
                            <g:sortableColumn property="lugar" title="${message(code: 'ediciones.lugar.label', default: 'Lugar')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${edicionesInstanceList}" status="i" var="edicionesInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${edicionesInstance.id}">${fieldValue(bean: edicionesInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: edicionesInstance, field: "codigo")}</td>
                        
                            <td>${fieldValue(bean: edicionesInstance, field: "fecha")}</td>
                        
                            <td>${fieldValue(bean: edicionesInstance, field: "horario")}</td>
                        
                            <td>${fieldValue(bean: edicionesInstance, field: "lugar")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${edicionesInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
