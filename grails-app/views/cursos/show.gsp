
<%@ page import="coursesadmin.Cursos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
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
                            <td valign="top" class="name"><g:message code="cursos.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: cursosInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cursos.costo.label" default="Costo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: cursosInstance, field: "costo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cursos.descripcion.label" default="Descripcion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: cursosInstance, field: "descripcion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cursos.destinatarios.label" default="Destinatarios" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: cursosInstance, field: "destinatarios")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cursos.horas.label" default="Horas" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: cursosInstance, field: "horas")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cursos.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: cursosInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="cursos.obligatorio.label" default="Obligatorio" /></td>
                            
                            <td valign="top" class="value"><g:link controller="cursos" action="show" id="${cursosInstance?.obligatorio?.id}">${cursosInstance?.obligatorio?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
            </div>
        </div>
    </body>
</html>
