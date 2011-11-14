
<%@ page import="coursesadmin.Ediciones" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ediciones.label', default: 'Ediciones')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="body" class="ui-widget">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'ediciones.id.label', default: 'Id')}" />
                        
                        <th><g:message code="ediciones.curso.label" default="Curso" /></th>
                        
                            <g:sortableColumn property="lugar" title="${message(code: 'ediciones.lugar.label', default: 'Lugar')}" />
                        
                            <g:sortableColumn property="fecha" title="${message(code: 'ediciones.fecha.label', default: 'Fecha')}" />
                        
                            <g:sortableColumn property="horario" title="${message(code: 'ediciones.horario.label', default: 'Horario')}" />

                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${edicionesInstanceList}" status="i" var="edicionesInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${edicionesInstance.id}">${fieldValue(bean: edicionesInstance, field: "id")}</g:link></td>
                        
                              <td>${fieldValue(bean: edicionesInstance, field: "curso.nombre")}</td>
                            <td>${fieldValue(bean: edicionesInstance, field: "lugar")}</td>
                        
                            <td>${fieldValue(bean: edicionesInstance, field: "fecha")}</td>
                        
                            <td>${fieldValue(bean: edicionesInstance, field: "horario").replaceAll("ñ","&ntilde;")}</td>

                          
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${edicionesInstanceTotal}" />
     </div>
     </div>
             <div id="footer" style="height:100%;" class="ui-widget ui-helper-clearfix">
                     <br><br>

           <a href="/coursesAdmin" class="button">Continuar</a>

        </div>
        <script type="text/javascript">

        $(".button").button();


        
        $(document).ready(function(){
  		  $('.update').bind('click',function(event){
  			event.preventDefault();
  		    $.get(this.href,{},function(response){ 
  		 	   $('.body').html(response)
  		    })	
  		 })
  		});

	    $("#continue").click(function(){
	    	var nombre = $("#lugar").val();
	    	var fecha = $("#fecha").val();
	    	var horario = $("#horario").val();
	    	var codigo = $("#codigo").val();
	    	var curso = $("#curso").val();
            $.post('/coursesAdmin/ediciones/save', {lugar:lugar, fecha:fecha, horario:horario, codigo:codigo,
		    	curso:curso}, function(data) {
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
