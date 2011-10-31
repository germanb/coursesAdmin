
<%@ page import="coursesadmin.Cursos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'cursos.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="costo" title="${message(code: 'cursos.costo.label', default: 'Costo')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'cursos.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="destinatarios" title="${message(code: 'cursos.destinatarios.label', default: 'Destinatarios')}" />
                        
                            <g:sortableColumn property="horas" title="${message(code: 'cursos.horas.label', default: 'Horas')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'cursos.nombre.label', default: 'Nombre')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cursosInstanceList}" status="i" var="cursosInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${cursosInstance.id}">${fieldValue(bean: cursosInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: cursosInstance, field: "costo")}</td>
                        
                            <td>${fieldValue(bean: cursosInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: cursosInstance, field: "destinatarios")}</td>
                        
                            <td>${fieldValue(bean: cursosInstance, field: "horas")}</td>
                        
                            <td>${fieldValue(bean: cursosInstance, field: "nombre")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cursosInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
