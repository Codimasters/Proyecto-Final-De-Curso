$('#formModificarEmpresa').bootstrapValidator({
	 message: 'Este valor no es valido',
	 feedbackIcons: {
		 valid: 'glyphicon glyphicon-ok',
		 invalid: 'glyphicon glyphicon-remove',
		 validating: 'glyphicon glyphicon-refresh'
	 },
	 live: 'enabled',
	 fields: {
		 ciudad: {
			 validators: {
				 notEmpty: {
					 message: 'La ciudad es requerida'
				 },
				 regexp: {
					 regexp:  /^[a-zA-Z\u00E0-\u00FC\s]{3,36}$/,
					 message: 'La ciudad no est&aacute en el formato adecuado'
				 }
			 }
		 },
		 region: {
			 validators: {
				 notEmpty: {
					 message: 'La regi&oacuten es requerida'
				 },
				 regexp: {
					 regexp:  /^[a-zA-Z\u00E0-\u00FC\s]{3,36}$/,
					 message: 'La regi&oacuten no est&aacute en el formato adecuado'
				 }
			 }
		 },
		 direccionFiscal: {
			 validators: {
				 notEmpty: {
					 message: 'La direcci&oacuten fiscal es requerida'
				 },
				 regexp: {
					 regexp:  /^[a-zA-Z\u00E0-\u00FC\s]{3,36}$/,
					 message: 'La direcci&oacuten fiscal no est&aacute en el formato adecuado'
				 }
			 }
		 },
		 acronimo: {
			 validators: {
				 notEmpty: {
					 message: 'El acr&oacutenimo es requerido'
				 },
				 regexp: {
					 regexp:  /^[a-zA-Z\u00E0-\u00FC\s]{3,50}$/,
					 message: 'El acr&oacutenimo no est&aacute en el formato adecuado'
				 }
			 }
		 },
		 rubro: {
			 validators: {
				 notEmpty: {
					 message: 'El rubro es requerido'
				 },
				 regexp: {
					 regexp:  /^[a-zA-Z\u00E0-\u00FC\s]{3,36}$/,
					 message: 'El rubro no est&aacute en el formato adecuado'
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
		 telefono: {
			 validators: {
				 regexp: {
					 regexp: /^\d{9}$/ ,
					 message: 'Por favor, introduzca un telefono v&aacutelido'
				 },
				 notEmpty: {
					 message: 'El tel&eacutefono es requerido.'
				 }
				 
			 }
		 }

		 
		 
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

