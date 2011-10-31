
<%@ page import="coursesadmin.Empleados" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'empleados.label', default: 'Empleados')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'empleados.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="capacitado" title="${message(code: 'empleados.capacitado.label', default: 'Capacitado')}" />
                        
                            <g:sortableColumn property="codigo" title="${message(code: 'empleados.codigo.label', default: 'Codigo')}" />
                        
                            <g:sortableColumn property="direccion" title="${message(code: 'empleados.direccion.label', default: 'Direccion')}" />
                        
                            <g:sortableColumn property="firma" title="${message(code: 'empleados.firma.label', default: 'Firma')}" />
                        
                            <g:sortableColumn property="nacimiento" title="${message(code: 'empleados.nacimiento.label', default: 'Nacimiento')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${empleadosInstanceList}" status="i" var="empleadosInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${empleadosInstance.id}">${fieldValue(bean: empleadosInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: empleadosInstance, field: "capacitado")}</td>
                        
                            <td>${fieldValue(bean: empleadosInstance, field: "codigo")}</td>
                        
                            <td>${fieldValue(bean: empleadosInstance, field: "direccion")}</td>
                        
                            <td>${fieldValue(bean: empleadosInstance, field: "firma")}</td>
                        
                            <td>${fieldValue(bean: empleadosInstance, field: "nacimiento")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${empleadosInstanceTotal}"  max=100/>
            </div>
        </div>
    </body>
</html>
