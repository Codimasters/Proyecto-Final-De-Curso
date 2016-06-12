$('#formRegistroGrado').bootstrapValidator({
	 message: 'Este valor no es valido',
	 feedbackIcons: {
		 valid: 'glyphicon glyphicon-ok',
		 invalid: 'glyphicon glyphicon-remove',
		 validating: 'glyphicon glyphicon-refresh'
	 },
	 live: 'enabled',
	 fields: {
		 nombreCentro: {
			 validators: {
                 greaterThan: {
                     value: 1,
                     message: 'Debes elegir un centro.'
                 }
             }
		 },
		 
		 familiaProfesional: {
			 trigger:"change",
			 validators: {
				 greaterThan: {
		             value: 1,
		             message: 'Debes elegir una familia profesional.'
		           }
             }
		 	
		 },
		 grado: {
			 validators: {
				 notEmpty: {
					 message: 'El nombre del grado es requerido'
				 },
				  regexp: {
					 regexp:  /^[a-zA-Z\u00E0-\u00FC\s]{2,36}$/,
					 message: 'No es un nombre de grado v&aacutelido'
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