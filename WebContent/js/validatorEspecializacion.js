$('#formRegistroEspecializacion').bootstrapValidator({
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
				 greaterThan: {
		             value: 1,
		             message: 'Debes elegir un grado.'
		           }
             }
		 },
		 nombreEspecializacion: {
			 validators: {
				 notEmpty: {
					 message: 'El nombre de la especializaci&oacuten es requerido'
				 },
				  regexp: {
					 regexp:  /^[a-zA-Z\u00E0-\u00FC\s]{2,36}$/,
					 message: 'No es un nombre de especializaci&oacuten v&aacutelido'
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