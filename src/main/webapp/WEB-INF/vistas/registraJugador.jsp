<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<div class="container">
<h1>Registra Jugador</h1>

<form id="id_form"> 
		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_nombre">Nombre</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">
				</div>
			</div>
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_alias">Alias</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="text" id="id_alias" name="alias" placeholder="Ingrese el Alias" maxlength="11">
		 		</div>
			</div>
		</div>
		<div class="row" style="margin-top: 0%">
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_pais">Pais</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_pais" name="pais" placeholder="Ingrese el pais" maxlength="20">
				</div>
			</div>
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_juego">Juego</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="text" id="id_juego" name="juego" placeholder="Ingrese el Juego" maxlength="40">
		 		</div>
			</div>
		</div>
		
		<div class="row" style="margin-top: 0%">
				<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_expe">Experiencia</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="text" id="id_experiencia" name="experiencia" placeholder="Ingrese la Experiencia" maxlength="1">
		 		</div>
			</div>
		</div>
		
		<div class="row" style="margin-top: 2%" align="center"	>
				<button id="id_registrar" type="button" class="btn btn-primary" >Crea Jugador</button>
		</div>
		
		
	</form>
</div>

<script type="text/javascript">

$("#id_registrar").click(function (){ 

	//Lanza la validacion
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
    //Pregunta si es valido el formulario(Si no tiene errores)
	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraJugador", 
            data: $('#id_form').serialize(),
            success: function(data){
            	mostrarMensaje(data.MENSAJE);
            },
            error: function(){
            	mostrarMensaje(data.MSG_ERROR);
            }
    	});
	}   
    	
	
});


function limpiar(){
	$('#id_nombre').val('');
	$('#id_alias').val('');
	$('#id_pais').val('');
	$('#id_juego').val('');
	$('#id_experiencia').val('');
}

$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                    }
                },
                alias:{
                    selector: "#id_alias",
                    validators:{
                        notEmpty: {
                             message: 'El alias es obligatorio'
                        },
                        regexp: {
                            regexp: /^[0-9]{11}$/,
                            message: 'el alias es de 11 dígitos'
                        }
                    }
                },
                pais:{
                    selector: "#id_pais",
                    validators:{
                        notEmpty: {
                             message: 'El pais es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 20,
                            message: 'El pais es de 3 a 20 caracteres'
                        },
                    }
                },
                juego:{
                    selector: "#id_juego",
                    validators:{
                        notEmpty: {
                             message: 'El juego es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El juego es de 3 a 40 caracteres'
                        },
                    }
                },
                experiencia:{
                    selector: "#id_experiencia",
                    validators:{
                        notEmpty: {
                             message: 'La experiencia es obligatorio'
                        },
                        regexp: {
                            regexp: /^[0-3]{1}$/,
                            message: 'La experiencia es obligatorio'
                        }
                    }
                },
        }   
    });

    
});
</script>

</body>
</html>



