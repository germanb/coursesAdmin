<%@ page import="coursesadmin.Participaciones" %>
<%@ page import="coursesadmin.Cursos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'participaciones.label', default: 'Participaciones')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="body"  class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${participacionesInstance}">
            <div class="errors">
                <g:renderErrors bean="${participacionesInstance}" as="list" />
            </div>
            </g:hasErrors>
            <div id="dialog-form" title="Alta de Ediciones">
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                         	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="obligatorio"><g:message code="cursos.obligatorio.label" default="Curso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursosInstance, field: 'obligatorio', 'errors')}">
                                    <g:select noSelection="${[null:'Elige un Curso']}"  name="curso" from="${coursesadmin.Cursos.list()}" optionKey="id" optionValue="nombre" value="${cursosInstance?.obligatorio?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="edicion"><g:message code="participaciones.edicion.label" default="Edici&oacute;n" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: participacionesInstance, field: 'edicion', 'errors')}">
                                	<select name="edicion" id="edicion">
                                		<option value="null">Elige una Edici&oacute;n</option>
		                                <g:each in="${coursesadmin.Ediciones.list()}"  var="edicionesInstance">
		                                	<option value="${edicionesInstance.id}">${edicionesInstance.cursoPertenece + " - " + edicionesInstance.lugar + " - " + edicionesInstance.fecha }</option>
		                                </g:each>
	                                </select>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="condicion"><g:message code="participaciones.condicion.label" default="Condici&oacute;n" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: participacionesInstance, field: 'condicion', 'errors')}">
                                	<div id="condicion_radio">
										<input type="radio" id="condicion_radio1" name="condicion_radio" value="Docente" /><label for="condicion_radio1">Docente</label>
										<input type="radio" id="condicion_radio2" name="condicion_radio"  value="Alumno" checked="checked"/><label for="condicion_radio2">Alumno</label>
									</div>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="empleado"><g:message code="participaciones.empleado.label" default="Empleado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: participacionesInstance, field: 'empleado', 'errors')}">
									<select name="empleado" id="empleado">
                                		<option value="null">Elige un Empleado</option>
		                                <g:each in="${coursesadmin.Empleados.list()}"  var="empleadosInstance">
		                                	<option value="${empleadosInstance.id}">${empleadosInstance.nombre + " (Capacitado: " + empleadosInstance.capacitado + ") "}</option>
		                                </g:each>
	                                </select>
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

        $("button").button();
	    $("#continue").click(function(){
            var edicion = $("#edicion").val();
            var empleado = $("#empleado").val();
            var condicion = $('input[name=condicion_radio]:checked').val();
            $.post('/coursesAdmin/participaciones/save', {edicion: edicion, empleado:empleado, condicion:condicion}, function(data) {
	    		$('.body').html(data);
            });
	    });
	    $("#clear").click(function(){
		    $(':input','#dialog-form')
		    .not(':button, :submit, :reset, :hidden')
		    .val('')
		    .removeAttr('checked')
		    .removeAttr('selected');
		    $("#condicion_radio1").attr('checked', true).button("refresh");
		    $("#condicion_radio1").attr('checked', true).button("refresh");
	    });

        $(document).ready(function() {
            $("#condicion_radio").buttonset();
			if("${fieldValue(bean: participacionesInstance, field: 'condicion')}" == 'Docente'){
				$("#condicion_radio1").attr('checked', true);
			}
			if("${fieldValue(bean: participacionesInstance, field: 'condicion')}" == 'Alumno'){
				$("#condicion_radio2").attr('checked', true);
			}
			$("#edicion").attr('disabled', 'disabled');
          });

        $("#curso").live('change',function(event){
        	 var curso = $("#curso");
			 if(curso != null){
				 $("#curso option[value='null']").remove();
				 $("#edicion").removeAttr('disabled');
			}
		     var variable = $('#curso option:selected').text()
			 $('#edicion option').attr("disabled","disabled");
		     $('#edicion option:contains(' + variable + ' )').removeAttr('disabled');
			 $("#edicion").prop("selectedIndex","null");
			 
        });

        $("#condicion_radio1").click(function(){
        	 $('#empleado option').attr("disabled","disabled");
        	 var variable1 = "Si"
        	 $("#empleado option:contains('Si')").removeAttr('disabled');
        });

        $("#condicion_radio2").click(function(){
        	$("#empleado option:contains('Si')").removeAttr('disabled');
        	$("#empleado option:contains('No')").removeAttr('disabled');
        });
        </script>
    </body>
</html>
