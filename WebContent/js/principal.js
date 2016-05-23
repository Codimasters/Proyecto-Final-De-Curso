jQuery(document).ready(function() {
    jQuery('#fullpage').fullpage({
    	//sectionsColor: ['#1E88E5', '#673ab7', '#ff9800', '#ff0543', '#00bcd4','#009688'],
        anchors: ['inicio', 'coches', 'motos','despedida'],
        menu: '#menu',
		scrollingSpeed: 500,
    });
});
