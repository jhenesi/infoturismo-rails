'use strict';

angular.module('infoturismoApp').controller('SectionsCtrl', [
	'$scope',
	'$location',
	'$filter',
	'labels',
	'icons',
	'routes',
	'crumbs',
	'infoturismoWebApi',
	function (
		$scope,
		$location,
		$filter,
		labels,
		icons,
		routes,
		crumbs,
		infoturismoWebApi
	) {
		var getConfig = function (route) {
			var config = {};

			config['/consumo'] = {
				title: labels.consumo,
				icon: icons.consumo,
				data: [{
					clave: 'Hospedaje',
					type: 'panel-primary',
					icon: icons.hospedaje,
					go: routes.consumo.hospedaje.path,
					score: '',
					category: '',
				},{
					clave: 'Alimentacion',
					type: 'panel-green',
					icon: icons.alimentacion,
					go: routes.consumo.alimentacion.path,
					score: '',
					category: '',
				},{
					clave: 'ServicioExcursion',
					type: 'panel-yellow',
					icon: icons.servicioExcursion,
					go: routes.consumo.servicioExcursion.path,
					score: '',
					category: '',
				},{
					clave: 'TransporteEstacionamiento',
					type: 'panel-red',
					icon: icons.transporteEstacionamiento,
					go: routes.consumo.transporteEstacionamiento.path,
					score: '',
					category: '',
				}],
				getData: infoturismoWebApi.getConsumoOverviewData
			};

 			config['/consumo'].breadcrumb = crumbs.getGeneral();
		    config['/consumo'].breadcrumb.addCrumb(crumbs.getConsumo());

		    config['/experiencia'] = {
				title: labels.experiencia,
				icon: icons.experiencia,
				data: [{
					clave: 'ExperienciaViaje',
					type: 'panel-primary',
					icon: icons.experiencia,
					go: routes.experiencia.experienciaViaje.path,
					score: '',
					category: '',
				},{
					clave: 'Factores',
					type: 'panel-green',
					icon: icons.experiencia,
					go: routes.experiencia.factores.path,
					score: '',
					category: '',
				}],
				getData: infoturismoWebApi.getExperienciaOverviewData
			};

 			config['/experiencia'].breadcrumb = crumbs.getGeneral();
		    config['/experiencia'].breadcrumb.addCrumb(crumbs.getExperiencia());

			return config[route];
		};

		var route = $location.url(),
			config = getConfig(route);

		$scope.title = config.title;
      	$scope.titleIcon = config.icon;
      	$scope.navegacion = config.breadcrumb;
      	$scope.datos = config.data;

		config.getData()
	        .success(function(data, status, headers, config) {
		        angular.forEach(data, function(item, i) {
		  			var dato = $filter('filter')($scope.datos, { clave: item.Clave })[0];
		  			dato.score = item.Promedio;
		  			dato.category = item.Nombre;
				});
	        })
	        .error(function(data, status, headers, config) {
	        });
  	}
]);
