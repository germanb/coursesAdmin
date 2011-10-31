

<%@ page import="coursesadmin.Cursos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cursosInstance}">
            <div class="errors">
                <g:renderErrors bean="${cursosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${cursosInstance?.id}" />
                <g:hiddenField name="version" value="${cursosInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="costo"><g:message code="cursos.costo.label" default="Costo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'costo', 'errors')}">
                                    <g:textField name="costo" value="${cursosInstance?.costo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="cursos.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${cursosInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="destinatarios"><g:message code="cursos.destinatarios.label" default="Destinatarios" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'destinatarios', 'errors')}">
                                    <g:textField name="destinatarios" value="${cursosInstance?.destinatarios}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="horas"><g:message code="cursos.horas.label" default="Horas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'horas', 'errors')}">
                                    <g:textField name="horas" value="${cursosInstance?.horas}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="cursos.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${cursosInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="obligatorio"><g:message code="cursos.obligatorio.label" default="Obligatorio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'obligatorio', 'errors')}">
                                    <g:select name="obligatorio.id" from="${coursesadmin.Cursos.list()}" optionKey="id" value="${cursosInstance?.obligatorio?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
