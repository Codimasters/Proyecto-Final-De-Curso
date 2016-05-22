$('#formulario').bootstrapValidator({
	 message: 'Este valor no es valido',
	 feedbackIcons: {
		 valid: 'glyphicon glyphicon-ok',
		 invalid: 'glyphicon glyphicon-remove',
		 validating: 'glyphicon glyphicon-refresh'
	 },
	 fields: {
		 nombre: {
			 validators: {
				 notEmpty: {
					 message: 'El nombre de usuario es requerido'
				 },
				  regexp: {
					 regexp:  /^[A-Z][a-zA-ZáéíóúàèìòùÀÈÌÒÙÁÉÍÓÚñÑüÜ-\s]{3,36}$/,
					 message: 'Debe empezar por mayuscula'
				 }
			 }
		 },
		  email: {
			 validators: {
				 notEmpty: {
					 message: 'El correo es requerido y no puede ser vacio'
				 },
				  regexp: {
					 regexp: /^[a-zA-Z0-9\._-]+@[a-zA-Z0-9-]{2,}[.][a-zA-Z]{2,4}$/ ,
					 message: 'El correo debe tener el formato loquesea@loquesea.loquesea'
				 },
				 emailAddress: {
					 message: 'El correo electronico no es valido'
				 }
			 }
		 },
		 asunto: {
			 validators: {
				 notEmpty: {
					 message: 'Debe introducirse un asunto'
				 }
			 }
		 },

		 mensaje: {
			 validators: {
				 notEmpty: {
					 message: 'Debe introducirse un mensaje'
				 }
			 }
		 }


	 }
});