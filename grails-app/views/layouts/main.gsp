<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon1.ico')}" type="image/x-icon" />


        <g:layoutHead />
        <g:javascript library="application" />
        <link type="text/css" href="${resource(dir:'css',file:'/ui-lightness/jquery-ui-1.8.16.custom.css')}" rel="stylesheet" />	
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.6.4.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery-ui-1.8.16.custom.min.js')}"></script>	
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.validate.js')}"></script>	
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.ui.datepicker-es.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.maskedinput-1.3.js')}"></script>
		<script type="text/javascript"src="http://jqueryui.com/themeroller/themeswitchertool/">
</script>
		
    </head>
    <body>
    
    	<div class="ui-widget-header ui-corner-tl ui-corner-tr"><h1 style=" margin: 10px ;">  Sistema de Administracion de Cursos</h1></div>
		
		<div class="ui-widget-content ui-corner-bl ui-corner-br">
			<div id="spinner" class="spinner" style="display:none;"><img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" /></div>  
        	        	<br>
        	        	
        	<g:layoutBody />

        </div>
    </body>
</html>