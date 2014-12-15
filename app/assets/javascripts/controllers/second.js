'use strict';

angular.module('infoturismoApp').controller('SecondCtrl', [
	'$scope', 
	'$location',
	'labels', 
	'icons', 
	'crumbs',
	'filters',
	'infoturismoWebApi', 
	function (
		$scope, 
		$location,
		labels, 
		icons, 
		crumbs, 
		filters,
		infoturismoWebApi
	) {
		var getConfig = function(route) {
			$scope.template = 'partials/second-pie.html';
			$scope.filters = filters;
			
			var config = {};

         //Acceso-señalamiento
			config['/acceso/senalamiento'] = {
				title: labels.senalamiento,
				icon: icons.pieChart,
   			getData: infoturismoWebApi.getSenalamientoOverviewData
			}

			var senalamiento = config['/acceso/senalamiento'];

			senalamiento.breadcrumb = 
				crumbs.getGeneral();
   					
   		senalamiento.breadcrumb
   			.addCrumb(crumbs.getAcceso())
   			.addCrumb(crumbs.getAccesoSenalamiento());
         
         //Acceso-opciones
         config['/acceso/opciones'] = {
            title: labels.opciones,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getAccesoOpcionesOverviewData
         }

         var opciones = config['/acceso/opciones'];

         opciones.breadcrumb = 
            crumbs.getGeneral();
                  
         opciones.breadcrumb
            .addCrumb(crumbs.getAcceso())
            .addCrumb(crumbs.getAccesoOpciones());

         //Acceso Calidad
         config['/acceso/calidad'] = {
            title: labels.calidad,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getCalidadInfraestructuraOverviewData
         }
         
         var calidad = config['/acceso/calidad'];
         calidad.breadcrumb = 
            crumbs.getGeneral();   

         calidad.breadcrumb
            .addCrumb(crumbs.getAcceso())
            .addCrumb(crumbs.getAccesoCalidad());

         //Acceso-Mantenimiento
         config['/acceso/mantenimiento'] = {
            title: labels.mantenimiento,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getMantenimientoOverviewData
         }

         var mantenimiento = config['/acceso/mantenimiento'];

         mantenimiento.breadcrumb = 
            crumbs.getGeneral();

         mantenimiento.breadcrumb
            .addCrumb(crumbs.getAcceso())
            .addCrumb(crumbs.getAccesoMantenimiento());

         //Acceso-Atencion
         config['/acceso/atencion'] = {
            title: labels.atencion,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getAtencionOverviewData
         }

         var atencion = config['/acceso/atencion'];

         atencion.breadcrumb = 
            crumbs.getGeneral();
                  
         atencion.breadcrumb
            .addCrumb(crumbs.getAcceso())
            .addCrumb(crumbs.getAccesoAtencion());

         //Atractivos-Servicios
         config['/atractivos/atractivosServicios'] = {
            title: labels.atractivosServicios,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getServiciosOverviewData
         }

         var servicios = config['/atractivos/atractivosServicios'];

         servicios.breadcrumb = 
            crumbs.getGeneral();
                  
         servicios.breadcrumb
            .addCrumb(crumbs.getAtractivos())
            .addCrumb(crumbs.getAtractivosServicios());

         //Atractivos-Conservacion
         config['/atractivos/atractivosConservacion'] = {
            title: labels.atractivosConservacion,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getConservacionOverviewData
         }

         var conservacion = config['/atractivos/atractivosConservacion'];

         conservacion.breadcrumb = 
            crumbs.getGeneral();
                  
         conservacion.breadcrumb
            .addCrumb(crumbs.getAtractivos())
            .addCrumb(crumbs.getAtractivosConcervacion());

         //Atractivos-Variedad
         config['/atractivos/atractivosVariedad'] = {
            title: labels.atractivosVariedad,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getAtractivosVariedadOverviewData
         }

         var variedad = config['/atractivos/atractivosVariedad'];

         variedad.breadcrumb = 
            crumbs.getGeneral();
                  
            variedad.breadcrumb
               .addCrumb(crumbs.getAtractivos())
               .addCrumb(crumbs.getAtractivosVariedad());

         //Atractivos-Calidad
         config['/atractivos/atractivosCalidad'] = {
            title: labels.atractivosCalidad,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getAtractivosCalidadOverviewData
         }
         var calidad = config['/atractivos/atractivosCalidad'];

         calidad.breadcrumb = 
            crumbs.getGeneral();
                  
         calidad.breadcrumb
            .addCrumb(crumbs.getAtractivos())
            .addCrumb(crumbs.getAtractivosCalidad());

         //Atractivos-Culturales

         config['/atractivos/atractivosCulturales'] = {
            title: labels.atractivosCulturales,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getAtractivosCulturalesOverviewData
         }

         var culturales = config['/atractivos/atractivosCulturales'];

         culturales.breadcrumb = 
            crumbs.getGeneral();
                  
         culturales.breadcrumb
            .addCrumb(crumbs.getAtractivos())
            .addCrumb(crumbs.getAtractivosCulturales());

         //Atractivos-Naturales
         config['/atractivos/atractivosNaturales'] = {
            title: labels.atractivosNaturales,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getAtractivosNaturalesOverviewData
         }

         var culturales = config['/atractivos/atractivosNaturales'];

         culturales.breadcrumb = 
            crumbs.getGeneral();
                  
         culturales.breadcrumb
            .addCrumb(crumbs.getAtractivos())
            .addCrumb(crumbs.getAtractivosNaturales());
         
         //Consumo
   		config['/consumo/hospedaje/percepcion'] = {
   			title: labels.hospedajePercepcion,
   			icon: icons.pieChart,
   			getData: infoturismoWebApi.getHospedajePercepcionOverviewData
   		}

   		var consumoHospedajePercepcion = config['/consumo/hospedaje/percepcion'];

   		consumoHospedajePercepcion.breadcrumb =
   			crumbs.getGeneral();

   		consumoHospedajePercepcion.breadcrumb
				.addCrumb(crumbs.getConsumo())
   			.addCrumb(crumbs.getHospedaje())
   			.addCrumb(crumbs.getHospedajePercepcion());

         config['/consumo/hospedaje/limpieza'] = {
            title: labels.hospedajeLimpieza,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getHospedajeLimpiezaOverviewData
         }

         var consumoHospedajeLimpieza = config['/consumo/hospedaje/limpieza'];

         consumoHospedajeLimpieza.breadcrumb =
            crumbs.getGeneral();

         consumoHospedajeLimpieza.breadcrumb
            .addCrumb(crumbs.getConsumo())
            .addCrumb(crumbs.getHospedaje())
            .addCrumb(crumbs.getHospedajeLimpieza());

         config['/consumo/hospedaje/atencion'] = {
            title: labels.hospedajeAtencion,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getHospedajeAtencionOverviewData
         }

         var consumoHospedajeAtencion = config['/consumo/hospedaje/atencion'];

         consumoHospedajeAtencion.breadcrumb =
            crumbs.getGeneral();

         consumoHospedajeAtencion.breadcrumb
            .addCrumb(crumbs.getConsumo())
            .addCrumb(crumbs.getHospedaje())
            .addCrumb(crumbs.getHospedajeAtencion());

         config['/consumo/hospedaje/facilidadeleccion'] = {
            title: labels.hospedajeEleccion,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getHospedajeEleccionOverviewData
         }

         var consumoHospedajeEleccion = config['/consumo/hospedaje/facilidadeleccion'];

         consumoHospedajeEleccion.breadcrumb =
            crumbs.getGeneral();

         consumoHospedajeEleccion.breadcrumb
            .addCrumb(crumbs.getConsumo())
            .addCrumb(crumbs.getHospedaje())
            .addCrumb(crumbs.getHospedajeEleccion());


         config['/consumo/alimentacion/experiencia'] = {
            title: labels.alimentacionExperiencia,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getAlimentacionExperienciaOverviewData
         }

         var alimentacionExp= config['/consumo/alimentacion/experiencia'];

         alimentacionExp.breadcrumb =
            crumbs.getGeneral();

         alimentacionExp.breadcrumb
            .addCrumb(crumbs.getConsumo())
            .addCrumb(crumbs.getAlimentacion())
            .addCrumb(crumbs.getAlimentacionExperiencia());

         config['/consumo/alimentacion/calidad'] = {
            title: labels.alimentacionCalidad,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getAlimentacionCalidadOverviewData
         }

         var alimentacionCalidad= config['/consumo/alimentacion/calidad'];

         alimentacionCalidad.breadcrumb =
            crumbs.getGeneral();

         alimentacionCalidad.breadcrumb
            .addCrumb(crumbs.getConsumo())
            .addCrumb(crumbs.getAlimentacion())
            .addCrumb(crumbs.getAlimentacionCalidad());


         config['/consumo/alimentacion/limpieza'] = {
            title: labels.alimentacionLimpieza,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getAlimentacionLimpiezaOverviewData
         }

         var alimentacionLimpieza = config['/consumo/alimentacion/limpieza'];

         alimentacionLimpieza.breadcrumb =
            crumbs.getGeneral();

         alimentacionLimpieza.breadcrumb
            .addCrumb(crumbs.getConsumo())
            .addCrumb(crumbs.getAlimentacion())
            .addCrumb(crumbs.getAlimentacionLimpieza());

         config['/consumo/servicioExcursion/servicios'] = {
            title: labels.serviciosExcursion,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getExcursionServiciosOverviewData
         }

         var excursionSerivicios = config['/consumo/servicioExcursion/servicios'];

         excursionSerivicios.breadcrumb =
            crumbs.getGeneral();

         excursionSerivicios.breadcrumb
            .addCrumb(crumbs.getConsumo())
            .addCrumb(crumbs.getExcursion())
            .addCrumb(crumbs.getExcursionServicio());


         config['/consumo/servicioExcursion/calidad'] = {
            title: labels.serviciosCalidad,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getExcursionCalidadOverviewData
         }

         var excursionCalidad= config['/consumo/servicioExcursion/calidad'];

         excursionCalidad.breadcrumb =
            crumbs.getGeneral();

         excursionCalidad.breadcrumb
            .addCrumb(crumbs.getConsumo())
            .addCrumb(crumbs.getExcursion())
            .addCrumb(crumbs.getExcursionCalidad());


         config['/consumo/servicioExcursion/atencion'] = {
            title: labels.serviciosAtencion,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getExcursionAtencionOverviewData
         }

         var excursionAtencion = config['/consumo/servicioExcursion/atencion'];

         excursionAtencion.breadcrumb =
            crumbs.getGeneral();

         excursionAtencion.breadcrumb
            .addCrumb(crumbs.getConsumo())
            .addCrumb(crumbs.getExcursion())
            .addCrumb(crumbs.getExcursionAtencion());

         config['/consumo/transporteEstacionamiento/calidad'] = {
            title: labels.transporteLocal,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getEstacionamientoCalidadOverviewData
         }

         var transporteCalidad = config['/consumo/transporteEstacionamiento/calidad'];

         transporteCalidad.breadcrumb =
            crumbs.getGeneral();

         transporteCalidad.breadcrumb
            .addCrumb(crumbs.getConsumo())
            .addCrumb(crumbs.getTransporte())
            .addCrumb(crumbs.getTransporteCalidad());

         config['/consumo/transporteEstacionamiento/atencion'] = {
            title: labels.transporteAtencion,
            icon: icons.pieChart,
            getData: infoturismoWebApi.getEstacionamientoAtencionOverviewData
         }

            var transporteAtencion = config['/consumo/transporteEstacionamiento/atencion'];

            transporteAtencion.breadcrumb =
               crumbs.getGeneral();

            transporteAtencion.breadcrumb
            .addCrumb(crumbs.getConsumo())
               .addCrumb(crumbs.getTransporte())
               .addCrumb(crumbs.getTransporteAtencion());

              

               config['/consumo/transporteEstacionamiento/disponibilidad'] = {
               title: labels.transporteDisponibilidad,
               icon: icons.pieChart,
               getData: infoturismoWebApi.getEstacionamientoDisponibilidadOverviewData
            }

            var transporteDisponibilidades = config['/consumo/transporteEstacionamiento/disponibilidad'];

            transporteDisponibilidades.breadcrumb =
               crumbs.getGeneral();

            transporteDisponibilidades.breadcrumb
            .addCrumb(crumbs.getConsumo())
               .addCrumb(crumbs.getTransporte())
               .addCrumb(crumbs.getTransporteDisponibilidad());


               config['/consumo/transporteEstacionamiento/disponibilidadEstacionamiento'] = {
               title: labels.transporteDisponibilidadEstacionamiento,
               icon: icons.pieChart,
               getData: infoturismoWebApi.getEstacionamientoDisponibilidadEstacionamientoOverviewData
            }

            var transporteDisponibilidadEstacionamiento = config['/consumo/transporteEstacionamiento/disponibilidadEstacionamiento'];

            transporteDisponibilidadEstacionamiento.breadcrumb =
               crumbs.getGeneral();

            transporteDisponibilidadEstacionamiento.breadcrumb
            .addCrumb(crumbs.getConsumo())
               .addCrumb(crumbs.getTransporte())
               .addCrumb(crumbs.getTransporteDisponibilidadEstacionamiento());




   				//Costo
         config['/costo/general'] = {
            title: labels.costoGeneral,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getCostoGeneralOverviewData
         }

         var costoGeneral = config['/costo/general'];

         costoGeneral.breadcrumb = 
            crumbs.getGeneral();
                  
            costoGeneral.breadcrumb
               .addCrumb(crumbs.getCosto())
               .addCrumb(crumbs.getCostoGeneral());

         config['/costo/transportacion'] = {
            title: labels.costoTransportacion,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getCostoTransportacionOverviewData
         }

         var costoTransportacion = config['/costo/transportacion'];

         costoTransportacion.breadcrumb = 
            crumbs.getGeneral();
                  
            costoTransportacion.breadcrumb
               .addCrumb(crumbs.getCosto())
               .addCrumb(crumbs.getCostoTransportacion());

   			config['/costo/hospedaje'] = {
				title: labels.costoHospedaje,
				icon: icons.pieChart,
   				getData: infoturismoWebApi.getCostoHospedajeOverviewData
			}

			var costoHospedaje = config['/costo/hospedaje'];

			costoHospedaje.breadcrumb = 
				crumbs.getGeneral();
   					
   			costoHospedaje.breadcrumb
   				.addCrumb(crumbs.getCosto())
   				.addCrumb(crumbs.getCostoHospedaje());

   			config['/costo/transporte'] = {
				title: labels.costoTransporte,
				icon: icons.pieChart,
   				getData: infoturismoWebApi.getCostoTransporteOverviewData
			}

			var costoTransporte = config['/costo/transporte'];

			costoTransporte.breadcrumb = 
				crumbs.getGeneral();
   					
   			costoTransporte.breadcrumb
   				.addCrumb(crumbs.getCosto())
   				.addCrumb(crumbs.getCostoTransporte());

   			config['/costo/alimentos'] = {
				title: labels.costoAlimentos,
				icon: icons.pieChart,
   				getData: infoturismoWebApi.getCostoAlimentosOverviewData
			}

			var costoAlimentos = config['/costo/alimentos'];

			costoAlimentos.breadcrumb = 
				crumbs.getGeneral();
   					
   			costoAlimentos.breadcrumb
   				.addCrumb(crumbs.getCosto())
   				.addCrumb(crumbs.getCostoAlimentos());

   			config['/costo/excursion'] = {
				title: labels.costoExcursion,
				icon: icons.pieChart,
   				getData: infoturismoWebApi.getCostoExcursionOverviewData
			}

			var costoExcursion = config['/costo/excursion'];

			costoExcursion.breadcrumb = 
				crumbs.getGeneral();
   					
   			costoExcursion.breadcrumb
   				.addCrumb(crumbs.getCosto())
   				.addCrumb(crumbs.getCostoExcursion());

   			config['/costo/estacionamiento'] = {
				title: labels.costoEstacionamiento,
				icon: icons.pieChart,
   				getData: infoturismoWebApi.getCostoEstacionamientoOverviewData
			}

			var costoEstacionamiento = config['/costo/estacionamiento'];

			costoEstacionamiento.breadcrumb = 
				crumbs.getGeneral();
   					
   			costoEstacionamiento.breadcrumb
   				.addCrumb(crumbs.getCosto())
   				.addCrumb(crumbs.getCostoEstacionamiento());

   				//experienciaViaje
   			config['/experiencia/experienciaViaje/obregon'] = {
   				title: labels.experienciaViajeObregon,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getExperienciaViajeObregonOverviewData
   			}

   			var experienciaViajeObregon = config['/experiencia/experienciaViaje/obregon'];

   			experienciaViajeObregon.breadcrumb =
   				crumbs.getGeneral();

   			experienciaViajeObregon.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getExperienciaViaje())
   				.addCrumb(crumbs.getExperienciaViajeObregon());

   			config['/experiencia/experienciaViaje/hospitalidad'] = {
   				title: labels.experienciaViajeHospitalidad,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getExperienciaViajeHospitalidadOverviewData
   			}

   			var experienciaViajeHospitalidad = config['/experiencia/experienciaViaje/hospitalidad'];

   			experienciaViajeHospitalidad.breadcrumb =
   				crumbs.getGeneral();

   			experienciaViajeHospitalidad.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getExperienciaViaje())
   				.addCrumb(crumbs.getExperienciaViajeHospitalidad());

   			config['/experiencia/experienciaViaje/actividades'] = {
               title: labels.experienciaViajeActividades,
               icon: icons.pieChart,
               getData: infoturismoWebApi.getExperienciaViajeActividadesOverviewData
            }

            var experienciaViajeActividades = config['/experiencia/experienciaViaje/actividades'];

            experienciaViajeActividades.breadcrumb =
               crumbs.getGeneral();

            experienciaViajeActividades.breadcrumb
            .addCrumb(crumbs.getExperiencia())
               .addCrumb(crumbs.getExperienciaViaje())
               .addCrumb(crumbs.getExperienciaViajeActividades());


         config['/experiencia/experienciaViaje/emocion'] = {
               title: labels.experienciaViajeEmocion,
               icon: icons.pieChart,
               getData: infoturismoWebApi.getExperienciaViajeEmocionOverviewData
            }

            var experienciaViajeEmocion = config['/experiencia/experienciaViaje/emocion'];

            experienciaViajeEmocion.breadcrumb =
               crumbs.getGeneral();

            experienciaViajeEmocion.breadcrumb
            .addCrumb(crumbs.getExperiencia())
               .addCrumb(crumbs.getExperienciaViaje())
               .addCrumb(crumbs.getExperienciaViajeEmocion());

            config['/experiencia/experienciaViaje/naturales'] = {
   				title: labels.experienciaViajeNaturales,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getExperienciaViajeNaturalesOverviewData
   			}

   			var experienciaViajeNaturales = config['/experiencia/experienciaViaje/naturales'];

   			experienciaViajeNaturales.breadcrumb =
   				crumbs.getGeneral();

   			experienciaViajeNaturales.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getExperienciaViaje())
   				.addCrumb(crumbs.getExperienciaViajeNaturales());

   			config['/experiencia/experienciaViaje/diferente'] = {
   				title: labels.experienciaViajeDiferente,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getExperienciaViajeDiferenteOverviewData
   			}

   			var experienciaViajeDiferente = config['/experiencia/experienciaViaje/diferente'];

   			experienciaViajeDiferente.breadcrumb =
   				crumbs.getGeneral();

   			experienciaViajeDiferente.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getExperienciaViaje())
   				.addCrumb(crumbs.getExperienciaViajeDiferente());

   			config['/experiencia/experienciaViaje/disponibilidad'] = {
   				title: labels.experienciaViajeDisponibilidad,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getExperienciaViajeDisponibilidadOverviewData
   			}

   			var experienciaViajeDisponibilidad = config['/experiencia/experienciaViaje/disponibilidad'];

   			experienciaViajeDisponibilidad.breadcrumb =
   				crumbs.getGeneral();

   			experienciaViajeDisponibilidad.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getExperienciaViaje())
   				.addCrumb(crumbs.getExperienciaViajeDisponibilidad());

   			config['/experiencia/factores/recomendaciones'] = {
   				title: labels.factoresRecomendaciones,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getFactoresRecomendacionesOverviewData
   			}

   			var factoresRecomendaciones = config['/experiencia/factores/recomendaciones'];

   			factoresRecomendaciones.breadcrumb =
   				crumbs.getGeneral();

   			factoresRecomendaciones.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getFactores())
   				.addCrumb(crumbs.getFactoresRecomendaciones());

   			config['/experiencia/factores/conocimiento'] = {
   				title: labels.factoresConocimiento,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getFactoresConocimientoOverviewData
   			}

   			var factoresConocimiento = config['/experiencia/factores/conocimiento'];

   			factoresConocimiento.breadcrumb =
   				crumbs.getGeneral();

   			factoresConocimiento.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getFactores())
   				.addCrumb(crumbs.getFactoresConocimiento());

   			config['/experiencia/factores/cercania'] = {
   				title: labels.factoresCercania,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getFactoresCercaniaOverviewData
   			}

   			var factoresCercania = config['/experiencia/factores/cercania'];

   			factoresCercania.breadcrumb =
   				crumbs.getGeneral();

   			factoresCercania.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getFactores())
   				.addCrumb(crumbs.getFactoresCercania());

   			config['/experiencia/factores/precios'] = {
   				title: labels.factoresPrecios,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getFactoresPreciosOverviewData
   			}

   			var factoresPrecios = config['/experiencia/factores/precios'];

   			factoresPrecios.breadcrumb =
   				crumbs.getGeneral();

   			factoresPrecios.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getFactores())
   				.addCrumb(crumbs.getFactoresPrecios());

   			config['/experiencia/factores/disponibilidad'] = {
   				title: labels.factoresDisponibilidad,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getFactoresDisponibilidadOverviewData
   			}

   			var factoresDisponibilidad = config['/experiencia/factores/disponibilidad'];

   			factoresDisponibilidad.breadcrumb =
   				crumbs.getGeneral();

   			factoresDisponibilidad.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getFactores())
   				.addCrumb(crumbs.getFactoresDisponibilidad());

   			config['/experiencia/factores/diversidad'] = {
   				title: labels.factoresDiversidad,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getFactoresDiversidadOverviewData
   			}

   			var factoresDiversidad = config['/experiencia/factores/diversidad'];

   			factoresDiversidad.breadcrumb =
   				crumbs.getGeneral();

   			factoresDiversidad.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getFactores())
   				.addCrumb(crumbs.getFactoresDiversidad());

   			config['/experiencia/factores/interes'] = {
   				title: labels.factoresInteres,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getFactoresInteresOverviewData
   			}

   			var factoresInteres = config['/experiencia/factores/interes'];

   			factoresInteres.breadcrumb =
   				crumbs.getGeneral();

   			factoresInteres.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getFactores())
   				.addCrumb(crumbs.getFactoresInteres());

   			config['/experiencia/factores/salud'] = {
   				title: labels.factoresSalud,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getFactoresSaludOverviewData
   			}

   			var factoresSalud = config['/experiencia/factores/salud'];

   			factoresSalud.breadcrumb =
   				crumbs.getGeneral();

   			factoresSalud.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getFactores())
   				.addCrumb(crumbs.getFactoresSalud());

   			config['/experiencia/factores/trabajo'] = {
   				title: labels.factoresTrabajo,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getFactoresTrabajoOverviewData
   			}

   			var factoresTrabajo = config['/experiencia/factores/trabajo'];

   			factoresTrabajo.breadcrumb =
   				crumbs.getGeneral();

   			factoresTrabajo.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getFactores())
   				.addCrumb(crumbs.getFactoresTrabajo());

   			config['/experiencia/factores/otro'] = {
   				title: labels.factoresOtro,
   				icon: icons.pieChart,
   				getData: infoturismoWebApi.getFactoresOtroOverviewData
   			}

   			var factoresOtro = config['/experiencia/factores/otro'];

   			factoresOtro.breadcrumb =
   				crumbs.getGeneral();

   			factoresOtro.breadcrumb
				.addCrumb(crumbs.getExperiencia())
   				.addCrumb(crumbs.getFactores())
   				.addCrumb(crumbs.getFactoresOtro());





//Imagen-Percepcion
         config['/imagen/percepcion'] = {
            title: labels.seguridad,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getImagenPercepcionOverviewData
         }

         var percepciones = config['/imagen/percepcion'];

         percepciones.breadcrumb = 
            crumbs.getGeneral();
                  
            percepciones.breadcrumb
               .addCrumb(crumbs.getImagen())
               .addCrumb(crumbs.getImagenPercepcion());

         //Imagen-Sitios
         config['/imagen/sitios'] = {
            title: labels.imagenSitio,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getImagenSitiosOverviewData
         }

         var sitio = config['/imagen/sitios'];

         sitio.breadcrumb = 
            crumbs.getGeneral();
                  
            sitio.breadcrumb
               .addCrumb(crumbs.getImagen())
               .addCrumb(crumbs.getImagenSitios());


         //Imagen-Ambulantes
         config['/imagen/ambulantes'] = {
            title: labels.vendedores,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getImagenAmbulantesOverviewData
         }

         var ambulantes = config['/imagen/ambulantes'];

         ambulantes.breadcrumb = 
            crumbs.getGeneral();
                  
            ambulantes.breadcrumb
               .addCrumb(crumbs.getImagen())
               .addCrumb(crumbs.getImagenAmbulantes());

            //Imagen-Transito
         config['/imagen/transito'] = {
            title: labels.transito,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getImagenTransitoOverviewData
         }

         var ambulantes = config['/imagen/transito'];

         ambulantes.breadcrumb = 
            crumbs.getGeneral();
                  
            ambulantes.breadcrumb
               .addCrumb(crumbs.getImagen())
               .addCrumb(crumbs.getImagenTrasito());
      
      //Imagen-Transito
         config['/imagen/limpieza'] = {
            title: labels.limpieza,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getImagenLimpiezaOverviewData
         }

         var ambulantes = config['/imagen/limpieza'];

         ambulantes.breadcrumb = 
            crumbs.getGeneral();
                  
            ambulantes.breadcrumb
               .addCrumb(crumbs.getImagen())
               .addCrumb(crumbs.getImagenLimpieza());






      //Satisfaccion-Nivel
         config['/satisfaccion/nivel'] = {
            title: labels.nivelSatisfaccion,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getNivelSatisfaccionOverviewData
         }
            var nivel = config['/satisfaccion/nivel'];

         nivel.breadcrumb = 
            crumbs.getGeneral();
                  
            nivel.breadcrumb
               .addCrumb(crumbs.getSatisfaccion())
               .addCrumb(crumbs.getSatisfaccionNivel());

            //Satisfaccion-Expectativas
         config['/satisfaccion/expectativas'] = {
            title: labels.expectativas,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getExpectativasSatisfaccionOverviewData
         }
            var expect = config['/satisfaccion/expectativas'];

         expect.breadcrumb = 
            crumbs.getGeneral();
                  
            expect.breadcrumb
               .addCrumb(crumbs.getSatisfaccion())
               .addCrumb(crumbs.getSatisfaccionExpectativas());



            //Satisfaccion-Dispocision
            config['/satisfaccion/disposicion'] = {
            title: labels.disposicion,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getDispocisionSatisfaccionOverviewData
         }
            var dispo = config['/satisfaccion/disposicion'];

         dispo.breadcrumb = 
            crumbs.getGeneral();
                  
            dispo.breadcrumb
               .addCrumb(crumbs.getSatisfaccion())
               .addCrumb(crumbs.getSatisfaccionDisposicion());
         
         //Satisfaccion-Recomendacion
            config['/satisfaccion/recomendacion'] = {
            title: labels.recomendacion,
            icon: icons.pieChart,
               getData: infoturismoWebApi.getRecomendacionSatisfaccionOverviewData
         }
            var recomendacion = config['/satisfaccion/recomendacion'];

         recomendacion.breadcrumb = 
            crumbs.getGeneral();
                  
            recomendacion.breadcrumb
               .addCrumb(crumbs.getSatisfaccion())
               .addCrumb(crumbs.getSatisfaccionRecomendacion());
   				
			return config[route];
		};

		var route = $location.url(),
			config = getConfig(route);

		$scope.title = config.title;
      $scope.titleIcon = config.icon;
      $scope.navegacion = config.breadcrumb;

      config.getData()
			.success(function(data, status, headers, config) {
				var seriesData = [];

				angular.forEach(data, function(item, i) {
					seriesData.push([
						item.Nombre, item.Total
					]);
				});

            $scope.datos = [{
               name: 'Porcentaje',
               data: seriesData
       	   }];
        	})
        	.error(function(data, status, headers, config) {
         });

         var chartTitles = {
            motivo: labels.filtroMotivo,
            transporte: labels.filtroTransporte,
            genero: labels.filtroGenero,
            compania: labels.filtroCompania,
            ocupacion: labels.filtroOcupacion,
            grado: labels.filtroGrado
         }

        $scope.$watch('filters', function() {
			if($scope.filters.filterBy !== "") {
        		$scope.template = 'partials/second-column.html';

        		config.getData($scope.filters.filterBy)
        			.success(function(data, status, headers, config) {
        				var categories, values, series, chartData;

        				chartData = [];
	          			categories = [];
	          			series = {};

	          			angular.forEach(data, function(item, i) {
			            	categories.push(item.Nombre);
			            	angular.forEach(item.Datos, function(element, j){
			            		series[element.Clave] = series[element.Clave] || {
			            			name: element.Nombre,
			            			data: [],
			            			stack: 'Calificacion'
			            		};
			            		series[element.Clave].data.push(element.Total);
			            	});
			          	});

			          	angular.forEach(Object.keys(series), function(keys, i) {
			          		chartData.push(series[keys]);
			          	});

			          	$scope.groupedData = {
			          		categories: categories,
	                		series: chartData
			          	};
			          	$scope.groupedTitle = chartTitles[$scope.filters.filterBy];
        			});
        	}
         	else {
          		$scope.template = 'partials/second-pie.html';
      		}
       	}, true);
	}
]);
