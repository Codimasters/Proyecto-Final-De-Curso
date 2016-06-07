$('#formRegistroFamiliaProfesional').bootstrapValidator({
	 message: 'Este valor no es valido',
	 feedbackIcons: {
		 valid: 'glyphicon glyphicon-ok',
		 invalid: 'glyphicon glyphicon-remove',
		 validating: 'glyphicon glyphicon-refresh'
	 },
	 live: 'enabled',
	 fields: {
		 familiaProfesional: {
			 validators: {
				 notEmpty: {
					 message: 'El nombre del centro es requerido'
				 },
				  regexp: {
					 regexp:  /^[a-zA-Z\u00E0-\u00FC\s]{3,36}$/,
					 message: 'No es un nombre de centro v&aacutelido'
				 }
			 }
		 },
		 nombreCentro: {
			 validators: {
				 greaterThan: {
		             value: 1,
		             message: 'Debes elegir un centro.'
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

