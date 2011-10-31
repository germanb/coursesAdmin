

<%@ page import="coursesadmin.Empleados" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'empleados.label', default: 'Empleados')}" />
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
            <g:hasErrors bean="${empleadosInstance}">
            <div class="errors">
                <g:renderErrors bean="${empleadosInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${empleadosInstance?.id}" />
                <g:hiddenField name="version" value="${empleadosInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="capacitado"><g:message code="empleados.capacitado.label" default="Capacitado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'capacitado', 'errors')}">
                                    <g:textField name="capacitado" value="${empleadosInstance?.capacitado}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigo"><g:message code="empleados.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" value="${empleadosInstance?.codigo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="direccion"><g:message code="empleados.direccion.label" default="Direccion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'direccion', 'errors')}">
                                    <g:textField name="direccion" value="${empleadosInstance?.direccion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firma"><g:message code="empleados.firma.label" default="Firma" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'firma', 'errors')}">
                                    <g:textField name="firma" value="${empleadosInstance?.firma}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nacimiento"><g:message code="empleados.nacimiento.label" default="Nacimiento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'nacimiento', 'errors')}">
                                    <g:datePicker name="nacimiento" precision="day" value="${empleadosInstance?.nacimiento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="empleados.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${empleadosInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="salario"><g:message code="empleados.salario.label" default="Salario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'salario', 'errors')}">
                                    <g:textField name="salario" value="${fieldValue(bean: empleadosInstance, field: 'salario')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sexo"><g:message code="empleados.sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'sexo', 'errors')}">
                                    <g:textField name="sexo" value="${empleadosInstance?.sexo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefono"><g:message code="empleados.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${empleadosInstance?.telefono}" />
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
