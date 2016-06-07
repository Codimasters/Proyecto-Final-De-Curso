$('#formRegistroResponsableEmpresa').bootstrapValidator({
	 message: 'Este valor no es valido',
	 feedbackIcons: {
		 valid: 'glyphicon glyphicon-ok',
		 invalid: 'glyphicon glyphicon-remove',
		 validating: 'glyphicon glyphicon-refresh'
	 },
	 live: 'enabled',
	 fields: {
		 nombre: {
	
			 validators: {
				 notEmpty: {
					 message: 'El nombre es requerido'
				 },
				  regexp: {
					 regexp:  /^[A-Z][a-zA-Z\u00E0-\u00FC-\s]{3,36}$/,
					 message: 'Debe empezar por mayuscula'
				 }
			 }
		 },
		 apellido1: {
				
			 validators: {
				 notEmpty: {
					 message: 'El nombre es requerido'
				 },
				  regexp: {
					 regexp:  /^[A-Z][a-zA-Z\u00E0-\u00FC-\s]{3,36}$/,
					 message: 'Debe empezar por mayuscula'
				 }
			 }
		 },
		 dni: {
			 validators: {
				 notEmpty: {
					 message: 'El DNI es requerido'
				 },
				  regexp: {
					  
					 regexp:  /^\d{8}[a-zA-Z]$/,
					 message: 'Por favor, utilize un formato de DNI v&aacutelido'
				 }
			 }
		 },
		 apellido2: {
				
			 validators: {
				 notEmpty: {
					 message: 'El nombre es requerido'
				 },
				  regexp: {
					 regexp:  /^[A-Z][a-zA-Z\u00E0-\u00FC-\s]{3,36}$/,
					 message: 'Debe empezar por mayuscula'
				 }
			 }
		 },
		 acronimo: {
			 validators: {
				 notEmpty: {
					 message: 'El apellido es requerido'
				 },
				  regexp: {
					 regexp:  /^[A-Z][a-zA-Z\u00E0-\u00FC-\s]{3,36}$/,
					 message: 'Debe empezar por mayuscula'
				 }
			 }
		 },
		 rubro: {
			 validators: {
				 notEmpty: {
					 message: 'Debe empezar por mayuscula'
				 },
				  regexp: {
					 regexp:  /^[A-Z][a-zA-Z\u00E0-\u00FC-\s]{3,36}$/,
					 message: 'Debe empezar por mayuscula'
				 }
			 }
		 },
		 direccionFiscal: {
			 validators: {
				 notEmpty: {
					 message: 'Debe empezar por mayuscula'
				 },
				  regexp: {
					 regexp:  /^[A-Z][a-zA-Z\u00E0-\u00FC-\s]{3,36}$/,
					 message: 'Debe empezar por mayuscula'
				 }
			 }
		 },
		 region: {
			 validators: {
				 notEmpty: {
					 message: 'Debe empezar por mayuscula'
				 },
				  regexp: {
					 regexp:  /^[A-Z][a-zA-Z\u00E0-\u00FC-\s]{3,36}$/,
					 message: 'Debe empezar por mayuscula'
				 }
			 }
		 },
		 ciudad: {
			 validators: {
				 notEmpty: {
					 message: 'Debe empezar por mayuscula'
				 },
				  regexp: {
					 regexp:  /^[A-Z][a-zA-Z\u00E0-\u00FC-\s]{3,36}$/,
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
					 regexp: /^[a-zA-Z0-9\._-]+@+gmail[.]+com|es$/ ,
					 message: 'Solo se admiten direcciones de GMail'
				 },
				 emailAddress: {
					 message: 'El correo electronico no es valido'
				 }
			 }
		 },
		 idEmpresa: {
			 validators: {
                 greaterThan: {
                     value: 1,
                     message: 'Debes elegir una empresa.'
                 }
             }
		 },
		 username: {
			 validators: {
				 regexp: {
					 regexp:  /^[a-zA-Z_\u00E0-\u00FC-]{3,36}$/,
					 message: 'El nombre de usuario es incorrecto.'
				 },
				 notEmpty: {
					 message: 'El nombre de usuario es requerido.'
				 }
				 
			 }
		 },
		 telefono: {
			 validators: {
				 regexp: {
					 regexp: /^\d{8}$/ ,
					 message: 'Por favor, introduzca un telefono v&aacutelido'
				 },
				 notEmpty: {
					 message: 'El tel&eacutefono es requerido.'
				 }
				 
			 }
		 },
	 }
})
.on('error.field.bv', function(e, data) {
    if (data.bv.getSubmitButton()) {
        data.bv.disableSubmitButtons(false);
    }
})

.on('success.field.bv', function(e, data) {
    if (data.bv.getSubmitButton()) {
        data.bv.disableSubmitButtons(false);
    }
    
    
});

