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
			return $http.get(root +'/data/alimentacion.json');
		},
		getAlimentacionExperienciaOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getAlimentacionCalidadOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getAlimentacionLimpiezaOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},


		getExcursionOverviewData: function() {
			return $http.get(root +'/data/excursion.json');
		},
		getTransporteOverviewData: function() {
			return $http.get(root +'/data/transportes.json');
		},


getEstacionamientoCalidadOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		
		getEstacionamientoAtencionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getEstacionamientoDisponibilidadOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},

		getSenalamientoOverviewData: function(filter) {
			return $http.get('/acceso/senalamiento',{
				params: {
					group_by: filter
				}
			});

		},
		getAccesoOpcionesOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getCalidadInfraestructuraOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getMantenimientoOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getAtencionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},








		getAtractivosOverviewData: function(){
			return $http.get(root +'/data/atractivos.json');
		},
		getServiciosOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getConservacionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getAtractivosVariedadOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getAtractivosCalidadOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getAtractivosCulturalesOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getAtractivosNaturalesOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},






		














		getCostoOverviewData: function() {
			return $http.get(root +'/data/costo.json');
		},
		getCostoHospedajeOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getCostoTransporteOverviewData: function(filter) {
			var routes = {};

		routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getCostoAlimentosOverviewData: function(filter) {
			var routes = {};

		routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getCostoExcursionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getCostoEstacionamientoOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getExperienciaOverviewData: function() {
			return $http.get(root +'/data/experiencia-resumen.json');
		},
		getExperienciaViajeOverviewData: function() {
			return $http.get(root +'/data/experienciaViaje.json');
		},
		getExperienciaViajeObregonOverviewData: function(filter) {
			var routes = {};

		routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getExperienciaViajeHospitalidadOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getExperienciaViajeNaturalesOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getExperienciaViajeDiferenteOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getExperienciaViajeDisponibilidadOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getFactoresOverviewData: function() {
			return $http.get(root +'/data/factores.json');
		},
		getFactoresRecomendacionesOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getFactoresConocimientoOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getFactoresCercaniaOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getFactoresPreciosOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getFactoresDisponibilidadOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getFactoresDiversidadOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getFactoresInteresOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getFactoresSaludOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getFactoresTrabajoOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getFactoresOtroOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getImagenOverviewData: function() {
			return $http.get(root +'/data/imagen.json');
		},


		getImagenPercepcionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getImagenSitiosOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getImagenAmbulantesOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getImagenTransitoOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getImagenLimpiezaOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		
		
		getSatisfaccionOverviewData: function() {
			return $http.get(root +'/data/satisfaccion.json');
		},
		getNivelSatisfaccionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getExpectativasSatisfaccionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getDispocisionSatisfaccionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		
		getRecomendacionSatisfaccionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		
		






















		getConsumoOverviewData: function() {
			return $http.get('/consumo');
		},
		getHospedajeOverviewData: function() {
			return $http.get(root +'/data/hospedaje.json');
		},
		getHospedajePercepcionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getHospedajeLimpiezaOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getHospedajeAtencionOverviewData: function(filter) {
			var routes = {};

		routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getHospedajeEleccionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getExcursionServiciosOverviewData: function(filter) {
			var routes = {};

		routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getExcursionCalidadOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');
			
			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		getExcursionAtencionOverviewData: function(filter) {
			var routes = {};

			routes['default'] = $http.get(root +'/data/senalamiento.json');
			routes['motivo'] = $http.get(root +'/data/senalamiento-motivo.json');
			routes['medio'] = $http.get(root +'/data/transporte.json');
			routes['genero'] = $http.get(root +'/data/genero.json');
			routes['edad'] = $http.get(root +'/data/edad.json');
			routes['quien'] = $http.get(root +'/data/con_quien_viaja.json');
			routes['ultima'] = $http.get(root +'/data/ultimaVisita.json');
			routes['frecuencia'] = $http.get(root +'/data/frecuencia.json');
			routes['ocupacion'] = $http.get(root +'/data/ocupacion.json');
			routes['duracion'] = $http.get(root +'/data/duracion.json');
			routes['residencia'] = $http.get(root +'/data/residencia.json');
			routes['grado'] = $http.get(root +'/data/grado.json');
			routes['oportunidad'] = $http.get(root +'/data/oportunidad.json');
			routes['gasto'] = $http.get(root +'/data/gastos.json');

			if(filter == "" || filter == null){
				return routes['default'];
			}
			else {
				return routes[filter];
			}
		},
		
		
	};
}]);
