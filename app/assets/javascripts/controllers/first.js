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


		    acceso.rutas['SeñalamientoparaArribar'] = 
		    	routes.acceso.senalamiento.path;
			acceso.rutas['OpcionesdeTransporteparaArribar'] = 
				routes.acceso.opciones.path;
			acceso.rutas['CalidaddelaInfraestructuradeAcceso'] = 
				routes.acceso.calidad.path;
			acceso.rutas['MantenimientoyCalidaddelMediodeTransporte'] = 
				routes.acceso.mantenimiento.path;
			acceso.rutas['AtencióndelpersonaldeTransporte'] = 
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
			
			atractivos.rutas['AtractivosylosServicios'] = 
		    	routes.atractivos.atractivosServicios.path;
			atractivos.rutas['Conservaciondelosatractivos'] = 
				routes.atractivos.atractivosConservacion.path;
			atractivos.rutas['Variedaddelosatractivos'] = 
				routes.atractivos.atractivosVariedad.path;
			atractivos.rutas['Calidaddelosatractivos'] = 
				routes.atractivos.atractivosCalidad.path;
			atractivos.rutas['Conservaciondelosatractivosculturales'] = 
				routes.atractivos.atractivosCulturales.path;
			atractivos.rutas['Conservaciondelosatractivosnaturales'] = 
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

			consumoHospedaje.rutas['PercepciónGeneral'] = 
	        	routes.consumo.hospedaje.percepcion.path;
	      	consumoHospedaje.rutas['Limpieza'] = 
	        	routes.consumo.hospedaje.limpieza.path;
	      	consumoHospedaje.rutas['Atencióndelpersonal'] = 
	        	routes.consumo.hospedaje.atencion.path;
	      	consumoHospedaje.rutas['FacilidaddeEleccióndeOpcióndeHospedaje'] = 
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

			alimentos.rutas['Experienciadelconsumodealimentosybebidas'] = 
	        	routes.consumo.alimentacion.experiencia.path;
	      	alimentos.rutas['Calidaddelosalimentosybebidas'] = 
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

			excursion.rutas['Serviciosdeexcursion/turisticos'] = 
	        	routes.consumo.servicioExcursion.servicios.path;
	      	excursion.rutas['Calidaddelosserviciosdeexcursion/turisticos'] = 
	        	routes.consumo.servicioExcursion.calidad.path;
	      	excursion.rutas['Atenciondelpersonal'] = 
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

			transp.rutas['Calidadeltrasportelocal'] = 
	        	routes.consumo.transporteEstacionamiento.calidad.path;
	      	transp.rutas['Atenciondelpersonaldelservicio'] = 
	        	routes.consumo.transporteEstacionamiento.atencion.path;
	      	transp.rutas['Disponibilidaddeltrasporte'] = 
			routes.consumo.transporteEstacionamiento.disponibilidad.path;
			transp.rutas['Disponibilidaddeestacionamiento'] = 
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
		    costo.rutas['Alimentosybebidas'] = 				
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

			experienciaViaje.rutas['ExperienciadeviajeaCd.Obregon'] = 
	        	routes.experiencia.experienciaViaje.obregon.path;
	      	experienciaViaje.rutas['Hospitalidaddelosresidentesquenotrabajanenlaindustria'] = 
	        	routes.experiencia.experienciaViaje.hospitalidad.path;
	      	experienciaViaje.rutas['Variedaddeactividadesrecreativas'] = 
	        	routes.experiencia.experienciaViaje.actividades.path;
	      	experienciaViaje.rutas['Emociondevisitarestesitio'] = 
	        	routes.experiencia.experienciaViaje.emocion.path;
	      	experienciaViaje.rutas['Visitarlossitiosnaturales/culturales'] = 
	        	routes.experiencia.experienciaViaje.naturales.path;
	      	experienciaViaje.rutas['Ofreceunaexperienciadiferente'] = 
	        	routes.experiencia.experienciaViaje.diferente.path;	
	      	experienciaViaje.rutas['Disponibilidaddeinformacionturistica'] = 
	        	routes.experiencia.experienciaViaje.disponibilidad.path;	

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
			
			imagen.rutas['Percepciondeseguridad'] = 
		    	routes.imagen.percepciones.path;
			imagen.rutas['Imagendelossitiosnaturalesoculturales'] = 
				routes.imagen.imagenes.path;
			imagen.rutas['Vendedoresambulantes'] = 
				routes.imagen.ambulantes.path;
			imagen.rutas['Transitovehicular'] = 
				routes.imagen.transito.path;
			imagen.rutas['Limpiezadecallesyareaspublicas'] = 
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
			
			satisfaccion.rutas['Niveldesatisfaccion'] = 
		    	routes.satisfaccion.nivelSatisfaccion.path;
			satisfaccion.rutas['Cumplimientodeexpectativas'] = 
				routes.satisfaccion.expectativas.path;
			satisfaccion.rutas['Disposiciondevisitarnosnuevamente'] = 
				routes.satisfaccion.disposicion.path;
			satisfaccion.rutas['Recomendariaasuamigosyfamilaresvisitarnos'] = 
				routes.satisfaccion.recomendacion.path;

			return config[route];
		};

		var route = $location.url(),
			config = getConfig(route);

		$scope.title = config.title;
      	$scope.titleIcon = config.icon;
      	$scope.navegacion = config.breadcrumb;

      	$scope.onLabelClick = function(e){
      		var labelText = angular.element(e.currentTarget).text().replace(/ /g,'').split(':')[0];
      		
        	$window.location = config
          		.rutas[labelText];
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
