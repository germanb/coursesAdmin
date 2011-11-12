
<%@ page import="coursesadmin.Empleados" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'empleados.label', default: 'Empleados')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="ui-widget "  id="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn  property="id" title="${message(code: 'empleados.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn  property="nombre" title="${message(code: 'empleados.nombre.label', default: 'Nombre')}" />

                            <g:sortableColumn  property="sexo" title="${message(code: 'empleados.sexo.label', default: 'Sexo')}" />

                            <g:sortableColumn  property="telefono" title="${message(code: 'empleados.telefono.label', default: 'Telefono')}" />

                            <g:sortableColumn property="direccion" title="${message(code: 'empleados.direccion.label', default: 'Direccion')}" />
                        
                            <g:sortableColumn property="capacitado" title="${message(code: 'empleados.capacitado.label', default: 'Capacitado')}" />
 
                             <g:sortableColumn property="tipo" title="${message(code: 'empleados.tipo.label', default: 'Tipo')}" />
 
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${empleadosInstanceList}" status="i" var="empleadosInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${empleadosInstance.id}">${fieldValue(bean: empleadosInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: empleadosInstance, field: "nombre")}</td>

                            <td>${fieldValue(bean: empleadosInstance, field: "sexo")}</td>
                        
                        	<td>${fieldValue(bean: empleadosInstance, field: "telefono")}</td>
                        		
                        	<td>${fieldValue(bean: empleadosInstance, field: "direccion")}</td>
                        	
                        	<td>${fieldValue(bean: empleadosInstance, field: "capacitado")}</td>
                        	
                        	<td>${fieldValue(bean: empleadosInstance, field: "tipo")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${empleadosInstanceTotal}"  max=100/>
            </div>
			</div>
             <div id="footer" style="height:100%;" class="ui-widget ui-helper-clearfix">
                     <br><br>

           <a href="/coursesAdmin" class="button">Continuar</a>

        </div>
        <script type="text/javascript">

        $(".button").button();

        

        
	    $("#continue").click(function(){
  	    	var capacitado = $("#capacitado").val();
	    	var codigo = $("#codigo").val();
	    	var direccion = $("#direccion").val();
	    	var firma = $("#firma").val();
	    	var nombre = $("#nombre").val();
	    	var obligatorio = $("#obligatorio").val();
	    	var nacimiento = $("#datepicker").val();
	    	var salario = $("#salario").val();
	    	var sexo = $("#sexo").val();
	    	var telefono = $("#telefono").val();
	    	 $.post('/coursesAdmin/empleados/save',{capacitado:capacitado, codigo:codigo, direccion:direccion,
	                firma:firma, nombre:nombre, obligatorio:obligatorio, nacimiento:nacimiento, salario:salario,
	                sexo:sexo, telefono:telefono},  function(data) {
		                $('.body').html(data);
            });
	    });
	    $("#clear").click(function(){
		    $(':input','#dialog-form')
		    .not(':button, :submit, :reset, :hidden')
		    .val('')
		    .removeAttr('checked')
		    .removeAttr('selected');
	    });


        </script>
    </body>
</html>
