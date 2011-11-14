
<%@ page import="coursesadmin.Cursos" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cursos.label', default: 'Cursos')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'cursos.id.label', default: 'Id')}" />
                            
                             <g:sortableColumn property="nombre" title="${message(code: 'cursos.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="costo" title="${message(code: 'cursos.costo.label', default: 'Costo')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'cursos.descripcion.label', default: 'Descripci&oacute;n')}" />
                        
                            <g:sortableColumn property="destinatarios" title="${message(code: 'cursos.destinatarios.label', default: 'Destinatarios')}" />
                        
                            <g:sortableColumn property="horas" title="${message(code: 'cursos.horas.label', default: 'Horas')}" />
                        
                           
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cursosInstanceList}" status="i" var="cursosInstance">
                    <g:if test="${cursosInstance.nombre != 'Ninguno'}">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${cursosInstance.id}">${fieldValue(bean: cursosInstance, field: "id")}</g:link></td>
                        
                        	<td>${fieldValue(bean: cursosInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: cursosInstance, field: "costo")}</td>
                        
                            <td>${fieldValue(bean: cursosInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: cursosInstance, field: "destinatarios")}</td>
                        
                            <td>${fieldValue(bean: cursosInstance, field: "horas")}</td>
                        
                            
                        
                        </tr>
                    </g:if>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cursosInstanceTotal}" />
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
	    	var costo = $("#costo").val();
	    	var descripcion = $("#descripcion").val();
	    	var destinatarios = $("#destinatarios").val();
	    	var horas = $("#horas").val();
	    	var nombre = $("#nombre").val();
	    	var obligatorio = $("#obligatorio").val();
	    	$.post('/coursesAdmin/cursos/save',{costo:costo, descripcion:descripcion, horas:horas,destinatarios:destinatarios,
	    		nombre:nombre, obligatorio:obligatorio },  function(data) {
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
