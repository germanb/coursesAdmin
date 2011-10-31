
<%@ page import="coursesadmin.Administrativos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'administrativos.label', default: 'Administrativos')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'administrativos.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="categoria" title="${message(code: 'administrativos.categoria.label', default: 'Categoria')}" />
                        
                            <g:sortableColumn property="oficina" title="${message(code: 'administrativos.oficina.label', default: 'Oficina')}" />
                        
                            <g:sortableColumn property="tarea" title="${message(code: 'administrativos.tarea.label', default: 'Tarea')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${administrativosInstanceList}" status="i" var="administrativosInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${administrativosInstance.id}">${fieldValue(bean: administrativosInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: administrativosInstance, field: "categoria")}</td>
                        
                            <td>${fieldValue(bean: administrativosInstance, field: "oficina")}</td>
                        
                            <td>${fieldValue(bean: administrativosInstance, field: "tarea")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${administrativosInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
