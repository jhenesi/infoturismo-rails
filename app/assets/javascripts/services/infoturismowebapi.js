'use strict';

angular.module('infoturismoApp').service('infoturismoWebApi', ['$http', function infoturismoWebApi($http) {
    var root = 'http://localhost:9000';

	return {
		getOverviewData: function() {
			return $http.get('/overview');
		},
		getAccesoOverviewData: function(){
			return $http.get('/acceso');
		},
		getAlimentacionOverviewData: function() {
			return $http.get('/alimentacion');
		},
		getAlimentacionExperienciaOverviewData: function(filter) {
			return $http.get('/alimentacion/experiencia',{
				params: {
					group_by: filter
				}
			});
		},
		getAlimentacionCalidadOverviewData: function(filter) {
			return $http.get('/alimentacion/calidad',{
				params: {
					group_by: filter
				}
			});
		},
		getAlimentacionLimpiezaOverviewData: function(filter) {
			return $http.get('/alimentacion/limpieza',{
				params: {
					group_by: filter
				}
			});
		},
		getExcursionOverviewData: function() {
			return $http.get('/servicios_excursion');
		},

		getTransporteOverviewData: function() {
			return $http.get('/transporte_estacionamiento');
		},
		getEstacionamientoCalidadOverviewData: function(filter) {
			return $http.get('/transporte_estacionamiento/calidad',{
				params: {
					group_by: filter
				}
			});
		},
		getEstacionamientoAtencionOverviewData: function(filter) {
			return $http.get('/transporte_estacionamiento/atencion',{
				params: {
					group_by: filter
				}
			});
		},
		getEstacionamientoDisponibilidadOverviewData: function(filter) {
			return $http.get('/transporte_estacionamiento/disponibilidad',{
				params: {
					group_by: filter
				}
			});
		},
		getEstacionamientoDisponibilidadEstacionamientoOverviewData: function(filter) {
			return $http.get('/transporte_estacionamiento/disponibilidad_estacionamiento',{
				params: {
					group_by: filter
				}
			});
		},
		getSenalamientoOverviewData: function(filter) {
			return $http.get('/acceso/senalamiento',{
				params: {
					group_by: filter
				}
			});

		},
		getAccesoOpcionesOverviewData: function(filter) {
			return $http.get('/acceso/opciones',{
				params: {
					group_by: filter
				}
			});

		},
		getCalidadInfraestructuraOverviewData: function(filter) {
			return $http.get('/acceso/calidad',{
				params: {
					group_by: filter
				}
			});

		},
		getMantenimientoOverviewData: function(filter) {
			return $http.get('/acceso/mantenimiento',{
				params: {
					group_by: filter
				}
			});
		},
		getAtencionOverviewData: function(filter) {
			return $http.get('/acceso/atencion',{
				params: {
					group_by: filter
				}
			});
		},
		getAtractivosOverviewData: function(){
			return $http.get('/atractivos');
		},
		getServiciosOverviewData: function(filter) {
			return $http.get('/atractivos/atractivosServicios',{
				params: {
					group_by: filter
				}
			});
		},
		getConservacionOverviewData: function(filter) {
				return $http.get('/atractivos/atractivosConservacion',{
				params: {
					group_by: filter
				}
			});
		},
		getAtractivosVariedadOverviewData: function(filter) {
			return $http.get('/atractivos/atractivosVariedad',{
				params: {
					group_by: filter
				}
			});
		},
		getAtractivosCalidadOverviewData: function(filter) {
			return $http.get('/atractivos/atractivosCalidad',{
				params: {
					group_by: filter
				}
			});
		},
		getAtractivosCulturalesOverviewData: function(filter) {
			return $http.get('/atractivos/atractivosCulturales',{
				params: {
					group_by: filter
				}
			});
		},
		getAtractivosNaturalesOverviewData: function(filter) {
			return $http.get('/atractivos/atractivosNaturales',{
				params: {
					group_by: filter
				}
			});
		},
		getCostoOverviewData: function() {
			return $http.get('/costo');
		},
		getCostoGeneralOverviewData: function(filter) {
			return $http.get('/costo/general',{
				params: {
					group_by: filter
				}
			});
		},
		getCostoTransportacionOverviewData: function(filter) {
			return $http.get('/costo/transportacion',{
				params: {
					group_by: filter
				}
			});
		},
		getCostoHospedajeOverviewData: function(filter) {
			return $http.get('/costo/hospedaje',{
				params: {
					group_by: filter
				}
			});
		},
		getCostoTransporteOverviewData: function(filter) {
			return $http.get('/costo/transporte',{
				params: {
					group_by: filter
				}
			});
		},
		getCostoAlimentosOverviewData: function(filter) {
			return $http.get('/costo/alimentos',{
				params: {
					group_by: filter
				}
			});
		},
		getCostoExcursionOverviewData: function(filter) {
			return $http.get('/costo/excursion',{
				params: {
					group_by: filter
				}
			});
		},
		getCostoEstacionamientoOverviewData: function(filter) {
			return $http.get('/costo/estacionamiento',{
				params: {
					group_by: filter
				}
			});
		},
		getExperienciaOverviewData: function() {
			return $http.get('/experiencia');
		},
		getExperienciaViajeOverviewData: function() {
			return $http.get('/experiencia_viaje');
		},
		getExperienciaViajeObregonOverviewData: function(filter) {
			return $http.get('/experiencia_viaje/obregon',{
				params: {
					group_by: filter
				}
			});
		},
		getExperienciaViajeHospitalidadOverviewData: function(filter) {
			return $http.get('/experiencia_viaje/hospitalidad',{
				params: {
					group_by: filter
				}
			});
		},
		getExperienciaViajeActividadesOverviewData: function(filter) {
			return $http.get('/experiencia_viaje/actividades',{
				params: {
					group_by: filter
				}
			});
		},
		getExperienciaViajeEmocionOverviewData: function(filter) {
			return $http.get('/experiencia_viaje/emocion',{
				params: {
					group_by: filter
				}
			});
		},
		getExperienciaViajeNaturalesOverviewData: function(filter) {
			return $http.get('/experiencia_viaje/naturales',{
				params: {
					group_by: filter
				}
			});
		},
		getExperienciaViajeDiferenteOverviewData: function(filter) {
			return $http.get('/experiencia_viaje/diferente',{
				params: {
					group_by: filter
				}
			});
		},
		getExperienciaViajeDisponibilidadOverviewData: function(filter) {
			return $http.get('/experiencia_viaje/disponibilidad',{
				params: {
					group_by: filter
				}
			});
		},
		getFactoresOverviewData: function() {
			return $http.get('/experiencia/factores');
		},
		getFactoresRecomendacionesOverviewData: function(filter) {
			return $http.get('/experiencia/factores/recomendaciones',{
				params: {
					group_by: filter
				}
			});
		},
		getFactoresConocimientoOverviewData: function(filter) {
			return $http.get('/experiencia/factores/conocimiento',{
				params: {
					group_by: filter
				}
			});
		},
		getFactoresCercaniaOverviewData: function(filter) {
			return $http.get('/experiencia/factores/cercania',{
				params: {
					group_by: filter
				}
			});
		},
		getFactoresPreciosOverviewData: function(filter) {
			return $http.get('/experiencia/factores/precios',{
				params: {
					group_by: filter
				}
			});
		},
		getFactoresDisponibilidadOverviewData: function(filter) {
			return $http.get('/experiencia/factores/disponibilidad',{
				params: {
					group_by: filter
				}
			});
		},
		getFactoresDiversidadOverviewData: function(filter) {
			return $http.get('/experiencia/factores/diversidad',{
				params: {
					group_by: filter
				}
			});
		},
		getFactoresInteresOverviewData: function(filter) {
			return $http.get('/experiencia/factores/interes',{
				params: {
					group_by: filter
				}
			});
		},
		getFactoresSaludOverviewData: function(filter) {
			return $http.get('/experiencia/factores/salud',{
				params: {
					group_by: filter
				}
			});
		},
		getFactoresTrabajoOverviewData: function(filter) {
			return $http.get('/experiencia/factores/trabajo',{
				params: {
					group_by: filter
				}
			});
		},
		getFactoresOtroOverviewData: function(filter) {
			return $http.get('/experiencia/factores/otro',{
				params: {
					group_by: filter
				}
			});
		},
		getImagenOverviewData: function() {
			return $http.get('imagen');
		},


		getImagenPercepcionOverviewData: function(filter) {
			return $http.get('/imagen/percepcion',{
				params: {
					group_by: filter
				}
			});
	
		},
		getImagenSitiosOverviewData: function(filter) {
			return $http.get('/imagen/sitios',{
				params: {
					group_by: filter
				}
			});
	
		},
		getImagenAmbulantesOverviewData: function(filter) {
			return $http.get('/imagen/ambulantes',{
				params: {
					group_by: filter
				}
			});
		},
		getImagenTransitoOverviewData: function(filter) {
			return $http.get('/imagen/transito',{
				params: {
					group_by: filter
				}
			});
		},
		getImagenLimpiezaOverviewData: function(filter) {
			return $http.get('/imagen/limpieza',{
				params: {
					group_by: filter
				}
			});
		},
		getSatisfaccionOverviewData: function() {
			return $http.get('/satisfaccion');
		},
		getNivelSatisfaccionOverviewData: function(filter) {
			return $http.get('/satisfaccion/nivel',{
				params: {
					group_by: filter
				}
			});
	

		},
		getExpectativasSatisfaccionOverviewData: function(filter) {
			return $http.get('/satisfaccion/expectativas',{
				params: {
					group_by: filter
				}
			});
		},
		getDispocisionSatisfaccionOverviewData: function(filter) {
			return $http.get('/satisfaccion/disposicion',{
				params: {
					group_by: filter
				}
			});
		},
		
		getRecomendacionSatisfaccionOverviewData: function(filter) {
			return $http.get('/satisfaccion/recomendacion',{
				params: {
					group_by: filter
				}
			});
		},
		getConsumoOverviewData: function() {
			return $http.get('/consumo');
		},
		getHospedajeOverviewData: function() {
			return $http.get('/hospedaje');
		},
		getHospedajePercepcionOverviewData: function(filter) {
			return $http.get('/hospedaje/percepcion',{
				params: {
					group_by: filter
				}
			});
		},
		getHospedajeLimpiezaOverviewData: function(filter) {
			return $http.get('/hospedaje/limpieza',{
				params: {
					group_by: filter
				}
			});
		},
		getHospedajeAtencionOverviewData: function(filter) {
			return $http.get('/hospedaje/atencion',{
				params: {
					group_by: filter
				}
			});
		},
		getHospedajeEleccionOverviewData: function(filter) {
			return $http.get('/hospedaje/facilidadeleccion',{
				params: {
					group_by: filter
				}
			});
		},
		getExcursionServiciosOverviewData: function(filter) {
			return $http.get('/servicios_excursion/servicios',{
				params: {
					group_by: filter
				}
			});
		},
		getExcursionCalidadOverviewData: function(filter) {
			return $http.get('/servicios_excursion/calidad',{
				params: {
					group_by: filter
				}
			});
		},
		getExcursionAtencionOverviewData: function(filter) {
				return $http.get('/servicios_excursion/atencion',{
				params: {
					group_by: filter
				}
			});
		}
	};
}]);
