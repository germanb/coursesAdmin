
<%@ page import="coursesadmin.Operarios" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'operarios.label', default: 'Operarios')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'operarios.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="sector" title="${message(code: 'operarios.sector.label', default: 'Sector')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${operariosInstanceList}" status="i" var="operariosInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${operariosInstance.id}">${fieldValue(bean: operariosInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: operariosInstance, field: "sector")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${operariosInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
