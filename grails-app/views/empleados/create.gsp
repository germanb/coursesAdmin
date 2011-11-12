

<%@ page import="coursesadmin.Empleados" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <g:set var="entityName" value="${message(code: 'empleados.label', default: 'Empleados')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">
            <h1>Agregar Empleado</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${empleadosInstance}">
            <div class="errors">
                <g:renderErrors bean="${empleadosInstance}" as="list" />
            </div>
            </g:hasErrors>
             <div id="dialog-form" title="Alta de Empleados">
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
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
                                    <label for="sexo"><g:message code="empleados.sexo.label" default="Sexo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'sexo', 'errors')}">
									<div id="sexo_radio">
										<input type="radio" id="sexo_radio1" name="sexo_radio" value="Masculino" checked="checked" /><label for="sexo_radio1">Masculino</label>
										<input type="radio" id="sexo_radio2" name="sexo_radio"  value="Femenino"/><label for="sexo_radio2">Femenino</label>
									</div>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nacimiento"><g:message code="empleados.nacimiento.label" default="Nacimiento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'nacimiento', 'errors')}">
									<input id="datepicker">
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
                                    <label for="salario"><g:message code="empleados.salario.label" default="Salario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'salario', 'errors')}">
                                    <g:textField name="salario" value="${fieldValue(bean: empleadosInstance, field: 'salario')}" />
                                </td>
                            </tr>
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="capacitado"><g:message code="empleados.capacitado.label" default="Capacitado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: empleadosInstance, field: 'capacitado', 'errors')}">
                                    <div id="capacitado_radio">
										<input type="radio" id="capacitado_radio1" name="capacitado_radio" value="Si" checked="checked" /><label for="capacitado_radio1">Si</label>
										<input type="radio" id="capacitado_radio2" name="capacitado_radio" value="No" /><label for="capacitado_radio2">No</label>
									</div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
 			</g:form>
            </div>
            <br><br>
           <button id="continue">Continuar</button>
           <button id="clear">Limpiar</button>
        </div>

        <script type="text/javascript">
       

        $(function($){
        	   $("#telefono").mask("(9999) 999-9999");

        	});
        
        $.datepicker.setDefaults("es");
                $(function() {
            		$( "#datepicker" ).datepicker({
            			altField: "#datepicker",
            			altFormat: "dd/mm/yy",
            			changeMonth: true,
            			changeYear: true,
            			minDate: "-80Y", 
            			maxDate: "-18Y",
            			yearRange: '1910:2000',
            		    showOn: "both", 
            		    buttonImage: "images/calendar.gif", 
            		    buttonImageOnly: true 
                		});
            	});

                $("button").button();
        	    $("#continue").click(function(){
            	    
          	    	var capacitado = $('input[name=capacitado_radio]:checked').val()
        	    	var codigo = $("#codigo").val();
        	    	var direccion = $("#direccion").val();
        	    	var firma = $("#firma").val();
        	    	var nombre = $("#nombre").val();
        	    	var obligatorio = $("#obligatorio").val();
        	    	var nacimiento = $("#datepicker").val();
        	    	var salario = $("#salario").val();
        	    	var sexo = $('input[name=sexo_radio]:checked').val()
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
        		    $("#sexo_radio1").attr('checked', true).button("refresh");
        		    $("#capacitado_radio1").attr('checked', true).button("refresh");
        	    });
                $(document).ready(function() {
                    $("#capacitado_radio").buttonset();
                    $("#sexo_radio").buttonset();
        			if("${fieldValue(bean: empleadosInstance, field: 'sexo')}" == 'Femenino'){
        				$("#sexo_radio2").attr('checked', true);
        			}
        			if("${fieldValue(bean: empleadosInstance, field: 'capacitado')}" == 'No'){
        				$("#capacitado_radio2").attr('checked', true);
        			}
        			if("${fieldValue(bean: empleadosInstance, field: 'capacitado')}" != null){
        				$("#datepicker").val("${fieldValue(bean: empleadosInstance, field: 'nacimiento')}");
        			}
                  });
        </script>
    </body>
</html>
