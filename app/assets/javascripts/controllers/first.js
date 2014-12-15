'use strict';

angular.module('infoturismoApp').controller('FirstCtrl', [
	'$scope', 
	'$window',
	'$location',
	'labels', 
	'icons', 
	'crumbs', 
	'routes', 
	'filters',
	'infoturismoWebApi', 
	function (
		$scope, 
		$window,
		$location,
		labels, 
		icons, 
		crumbs, 
		routes, 
		filters,
		infoturismoWebApi
	) {
		var getConfig = function (route) {
			var config = {};

			config['/acceso'] = {
		        title: labels.acceso,
		        icon: icons.acceso,
		        rutas: {},
		        getData: infoturismoWebApi.getAccesoOverviewData
		    };

		    var acceso = config['/acceso'];

		    acceso.breadcrumb = crumbs.getGeneral();
		    acceso.breadcrumb.addCrumb(crumbs.getAcceso()),


		    acceso.rutas['Señalamiento para Arribar'] = 
		    	routes.acceso.senalamiento.path;
			acceso.rutas['Opciones de Transporte para Arribar'] = 
				routes.acceso.opciones.path;
			acceso.rutas['Calidad de la Infraestructura de Acceso'] = 
				routes.acceso.calidad.path;
			acceso.rutas['Mantenimiento y Calidad del Medio de Transporte'] = 
				routes.acceso.mantenimiento.path;
			acceso.rutas['Atención del personal de Transporte'] = 
				routes.acceso.atencion.path;

	//Atractivos
			config['/atractivos'] = {
		        title: labels.atractivos,
		        icon: icons.atractivos,
		        rutas: {},
		        getData: infoturismoWebApi.getAtractivosOverviewData
		    };

		    var atractivos = config['/atractivos'];
 			atractivos.breadcrumb = crumbs.getGeneral();
		    atractivos.breadcrumb.addCrumb(crumbs.getAtractivos()),
			
			atractivos.rutas['Atractivos y los Servicios'] = 
		    	routes.atractivos.atractivosServicios.path;
			atractivos.rutas['Conservacion de los atractivos'] = 
				routes.atractivos.atractivosConservacion.path;
			atractivos.rutas['Variedad de los atractivos'] = 
				routes.atractivos.atractivosVariedad.path;
			atractivos.rutas['Calidad de los atractivos'] = 
				routes.atractivos.atractivosCalidad.path;
			atractivos.rutas['Conservacion de los atractivos culturales'] = 
				routes.atractivos.atractivosCulturales.path;
			atractivos.rutas['Conservacion de los atractivos naturales'] = 
				routes.atractivos.atractivosNaturales.path;


			//Consumo -Hospedaje
			config['/consumo/hospedaje'] = {
				title: labels.hospedaje,
        		icon: icons.hospedaje,
        		rutas: {},
        		getData: infoturismoWebApi.getHospedajeOverviewData
			};

			var consumoHospedaje = config['/consumo/hospedaje'];

			consumoHospedaje.breadcrumb = crumbs.getGeneral();
			consumoHospedaje.breadcrumb
				.addCrumb(crumbs.getConsumo())
				.addCrumb(crumbs.getHospedaje());

			consumoHospedaje.rutas['Percepción General'] = 
	        	routes.consumo.hospedaje.percepcion.path;
	      	consumoHospedaje.rutas['Limpieza'] = 
	        	routes.consumo.hospedaje.limpieza.path;
	      	consumoHospedaje.rutas['Atención del personal'] = 
	        	routes.consumo.hospedaje.atencion.path;
	      	consumoHospedaje.rutas['Facilidad de Elección de Opción de Hospedaje'] = 
	        	routes.consumo.hospedaje.facilidadEleccion.path;


	        //Consumo-Alimentacion
	        config['/consumo/alimentacion'] = {
				title: labels.alimentacion,
        		icon: icons.alimentacion,
        		rutas: {},
        		getData: infoturismoWebApi.getAlimentacionOverviewData
			};

			var alimentos = config['/consumo/alimentacion'];

				alimentos.breadcrumb = crumbs.getGeneral();
			alimentos.breadcrumb
				.addCrumb(crumbs.getConsumo())
				.addCrumb(crumbs.getAlimentacion());

			alimentos.rutas['Experiencia del consumo de alimentos y bebidas'] = 
	        	routes.consumo.alimentacion.experiencia.path;
	      	alimentos.rutas['Calidad de los alimentos y bebidas'] = 
	        	routes.consumo.alimentacion.calidad.path;
	      	alimentos.rutas['Limpieza/Higiene'] = 
	        	routes.consumo.alimentacion.limpieza.path;
		

		//Consumo Excursion
		config['/consumo/servicioExcursion'] = {
			title: labels.excursion,
        	icon: icons.servicioExcursion,
        	rutas: {},
        	getData: infoturismoWebApi.getExcursionOverviewData
			};

			var excursion = config['/consumo/servicioExcursion'];

			excursion.breadcrumb = crumbs.getGeneral();
			excursion.breadcrumb
				.addCrumb(crumbs.getConsumo())
				.addCrumb(crumbs.getExcursion());

			excursion.rutas['Servicios de excursion/turisticos'] = 
	        	routes.consumo.servicioExcursion.servicios.path;
	      	excursion.rutas['Calidad de los servicios de excursion/turisticos'] = 
	        	routes.consumo.servicioExcursion.calidad.path;
	      	excursion.rutas['Atencion del personal'] = 
	        	routes.consumo.servicioExcursion.atencion.path;



	        //Consumo Transporte
	          config['/consumo/transporteEstacionamiento'] = {
			title: labels.transporteEstacionamiento,
        	icon: icons.transporteEstacionamiento,
        	rutas: {},
        	getData: infoturismoWebApi.getTransporteOverviewData
			};

			var transp = config['/consumo/transporteEstacionamiento'];

			transp.breadcrumb = crumbs.getGeneral();
			transp.breadcrumb
				.addCrumb(crumbs.getConsumo())
				.addCrumb(crumbs.getTransporte());

			transp.rutas['Calidad el trasporte local'] = 
	        	routes.consumo.transporteEstacionamiento.calidad.path;
	      	transp.rutas['Atencion del personal del servicio'] = 
	        	routes.consumo.transporteEstacionamiento.atencion.path;
	      	transp.rutas['Disponibilidad del trasporte'] = 
			routes.consumo.transporteEstacionamiento.disponibilidad.path;
			transp.rutas['Disponibilidad de estacionamiento'] = 
			routes.consumo.transporteEstacionamiento.disponibilidadEstacionamiento.path;


			
	        //costo
	        config['/costo'] = {
		        title: labels.costo,
		        icon: icons.costo,
		        rutas: {},
		        getData: infoturismoWebApi.getCostoOverviewData
		    };

		    var costo = config['/costo'];

		    costo.breadcrumb = crumbs.getGeneral();		    
		    costo.breadcrumb.addCrumb(crumbs.getCosto()),	

		    costo.rutas['General'] = 		    	
		    	routes.costo.general.path;
		    costo.rutas['Transportacion'] = 		    	
		    	routes.costo.transportacion.path;
		    costo.rutas['Hospedaje'] = 		    	
		    	routes.costo.hospedaje.path;			
		    costo.rutas['Transporte'] = 				
		    	routes.costo.transporte.path;			
		    costo.rutas['Alimentos y bebidas'] = 				
		    	routes.costo.alimentos.path;			
		    costo.rutas['Excursion/turistico'] = 				
		    	routes.costo.excursion.path;			
		    costo.rutas['Estacionamiento'] = 				
		    	routes.costo.estacionamiento.path;	

		    	//experienciaViaje
		    config['/experiencia/experienciaViaje'] = {
				title: labels.experienciaViaje,
        		icon: icons.experiencia,
        		rutas: {},
        		getData: infoturismoWebApi.getExperienciaViajeOverviewData
			};

			var experienciaViaje = config['/experiencia/experienciaViaje'];

			experienciaViaje.breadcrumb = crumbs.getGeneral();
			experienciaViaje.breadcrumb
				.addCrumb(crumbs.getExperiencia())
				.addCrumb(crumbs.getExperienciaViaje());

			experienciaViaje.rutas['Experiencia de viaje a Cd. Obregon'] = 
	        	routes.experiencia.experienciaViaje.obregon.path;
	      	experienciaViaje.rutas['Hospitalidad de los residentes que no trabajan en la industria'] = 
	        	routes.experiencia.experienciaViaje.hospitalidad.path;
	      	experienciaViaje.rutas['Variedad de actividades recreativas'] = 
	        	routes.experiencia.experienciaViaje.actividades.path;
	      	experienciaViaje.rutas['Emocion de visitar este sitio'] = 
	        	routes.experiencia.experienciaViaje.emocion.path;
	      	experienciaViaje.rutas['Visitar los sitios naturales/culturales'] = 
	        	routes.experiencia.experienciaViaje.naturales.path;
	      	experienciaViaje.rutas['Ofrece una experiencia diferente'] = 
	        	routes.experiencia.experienciaViaje.diferente.path;	
	      	experienciaViaje.rutas['Disponibilidad de informacion turistica'] = 
	        	routes.experiencia.experienciaViaje.disponibilidad.path;	

	        	//factores
	        config['/experiencia/factores'] = {
				title: labels.factores,
        		icon: icons.experiencia,
        		rutas: {},
        		getData: infoturismoWebApi.getFactoresOverviewData
			};

			var factores = config['/experiencia/factores'];

			factores.breadcrumb = crumbs.getGeneral();
			factores.breadcrumb
				.addCrumb(crumbs.getExperiencia())
				.addCrumb(crumbs.getFactores());

			factores.rutas['Recomendaciones'] = 
	        	routes.experiencia.factores.recomendaciones.path;
	      	factores.rutas['Conocimiento previo'] = 
	        	routes.experiencia.factores.conocimiento.path;
	      	factores.rutas['Cercania del lugar de origen'] = 
	        	routes.experiencia.factores.cercania.path;
	      	factores.rutas['Precios'] = 
	        	routes.experiencia.factores.precios.path;	
	      	factores.rutas['Disponibilidad de tiempo'] = 
	        	routes.experiencia.factores.disponibilidad.path;
	        factores.rutas['Diversidad de actividades'] = 
	        	routes.experiencia.factores.diversidad.path;
	        factores.rutas['Interes de conocer nuevos lugares'] = 
	        	routes.experiencia.factores.interes.path;
	        factores.rutas['Salud'] = 
	        	routes.experiencia.factores.salud.path;
	        factores.rutas['Trabajo'] = 
	        	routes.experiencia.factores.trabajo.path;
	        factores.rutas['Otro'] = 
	        	routes.experiencia.factores.otro.path;

	        //Imagen
			config['/imagen'] = {
		        title: labels.imagen,
		        icon: icons.imagen,
		        rutas: {},
		        getData: infoturismoWebApi.getImagenOverviewData
		    };
		     var imagen = config['/imagen'];
 			imagen.breadcrumb = crumbs.getGeneral();
		    imagen.breadcrumb.addCrumb(crumbs.getImagen()),
			
			imagen.rutas['Percepcion de seguridad'] = 
		    	routes.imagen.percepciones.path;
			imagen.rutas['Imagen de los sitios naturales o culturales'] = 
				routes.imagen.imagenes.path;
			imagen.rutas['Vendedores ambulantes'] = 
				routes.imagen.ambulantes.path;
			imagen.rutas['Transito vehicular'] = 
				routes.imagen.transito.path;
			imagen.rutas['Limpieza de calles y areas publicas'] = 
				routes.imagen.limpieza.path;


				// Satisfaccion
			 config['/satisfaccion'] = {
		        title: labels.satisfaccion,
		        icon: icons.satisfaccion,
		        rutas: {},
		        getData: infoturismoWebApi.getSatisfaccionOverviewData
		    };
		     var satisfaccion = config['/satisfaccion'];
 			satisfaccion.breadcrumb = crumbs.getGeneral();
		    satisfaccion.breadcrumb.addCrumb(crumbs.getSatisfaccion()),
			
			satisfaccion.rutas['Nivel de satisfaccion'] = 
		    	routes.satisfaccion.nivelSatisfaccion.path;
			satisfaccion.rutas['Cumplimiento de expectativas'] = 
				routes.satisfaccion.expectativas.path;
			satisfaccion.rutas['Disposicion de visitarnos nuevamente'] = 
				routes.satisfaccion.disposicion.path;
			satisfaccion.rutas['Recomendaria a su amigos y familares visitarnos'] = 
				routes.satisfaccion.recomendacion.path;

			return config[route];
		};

		var route = $location.url(),
			config = getConfig(route);

		$scope.title = config.title;
      	$scope.titleIcon = config.icon;
      	$scope.navegacion = config.breadcrumb;

      	$scope.onLabelClick = function(e){
        	$window.location = config
          		.rutas[angular.element(e.target).text()];
      	};

		config.getData()
      		.success(function(data, status, headers, config) {
          		var categories, values, serie;
          		
	          	categories = [];

	          	angular.forEach(data, function(item, i) {
	            	categories.push(item.Nombre);

	            	serie = serie || {
	            		name: 'Promedio',
	            		data: [],
	            		showInLegend: false
	            	};

					serie.data.push(item.Promedio);
	          	});

	            $scope.datos = {
	                categories: categories,
	                series: [serie]
	            };
	        })
        	.error(function(data, status, headers, config) {
        	});
   	}
]);
