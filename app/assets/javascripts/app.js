'use strict';

angular
  .module('infoturismoApp', [
    'ngRoute',
    'ngCookies',
    'templates',
    'angularSpinner'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/acceso', {
        templateUrl: 'views/first.html',
        controller: 'FirstCtrl'
      })
      .when('/acceso/senalamiento', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/acceso/opciones', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/acceso/calidad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/acceso/mantenimiento', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
     .when('/acceso/atencion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      //Atractivos
      .when('/atractivos', {
        templateUrl: 'views/first.html',
        controller: 'FirstCtrl'
      })
      .when('/atractivos/atractivosServicios', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/atractivos/atractivosConservacion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/atractivos/atractivosVariedad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/atractivos/atractivosCalidad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/atractivos/atractivosCulturales', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/atractivos/atractivosNaturales', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
	    //Consumo
      .when('/consumo', {
        templateUrl: 'views/sections.html',
        controller: 'SectionsCtrl'
      })
      .when('/consumo/hospedaje', {
        templateUrl: 'views/first.html',
        controller: 'FirstCtrl'
      })
      .when('/consumo/hospedaje/percepcion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/hospedaje/limpieza', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
       .when('/consumo/hospedaje/atencion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
        .when('/consumo/hospedaje/facilidadeleccion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/alimentacion', {
        templateUrl: 'views/first.html',
        controller: 'FirstCtrl'
      })
      .when('/consumo/alimentacion/experiencia', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/alimentacion/calidad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/alimentacion/limpieza', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/servicioExcursion', {
        templateUrl: 'views/first.html',
        controller: 'FirstCtrl'
      })
      .when('/consumo/hospedaje/facilidadeleccion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/servicioExcursion/servicios', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/servicioExcursion/calidad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/servicioExcursion/atencion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/transporteEstacionamiento', {
        templateUrl: 'views/first.html',
        controller: 'FirstCtrl'
      })
      .when('/consumo/transporteEstacionamiento/calidad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
     .when('/consumo/transporteEstacionamiento/atencion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/transporteEstacionamiento/disponibilidad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/consumo/transporteEstacionamiento/disponibilidadEstacionamiento', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/costo', {
        templateUrl: 'views/first.html',
        controller: 'FirstCtrl'
      })
      .when('/costo/general', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/costo/transportacion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/costo/hospedaje', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/costo/transporte', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/costo/alimentos', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/costo/excursion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/costo/estacionamiento', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia', {
        templateUrl: 'views/sections.html',
        controller: 'SectionsCtrl'
      })
      .when('/experiencia/experienciaViaje', {
        templateUrl: 'views/first.html',
        controller: 'FirstCtrl'
      })
      .when('/experiencia/factores', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/experienciaViaje/obregon', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/experienciaViaje/hospitalidad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/experienciaViaje/actividades', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/experienciaViaje/emocion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/experienciaViaje/naturales', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/experienciaViaje/diferente', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/experienciaViaje/disponibilidad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      /*.when('/experiencia/factores/recomendaciones', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/factores/conocimiento', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/factores/cercania', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/factores/precios', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/factores/disponibilidad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/factores/diversidad', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/factores/interes', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/factores/salud', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/factores/trabajo', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/experiencia/factores/otro', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })*/
   	  //Imagen
      .when('/imagen', {
        templateUrl: 'views/first.html',
        controller: 'FirstCtrl'
      })
       .when('/imagen/percepcion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/imagen/sitios', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/imagen/ambulantes', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/imagen/transito', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/imagen/limpieza', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      //Satisfaccion
      .when('/satisfaccion', {
        templateUrl: 'views/first.html',
        controller: 'FirstCtrl'
      })
      .when('/satisfaccion/nivel', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/satisfaccion/expectativas', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/satisfaccion/disposicion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .when('/satisfaccion/recomendacion', {
        templateUrl: 'views/second.html',
        controller: 'SecondCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  })

  .config(function ($httpProvider) {
    $httpProvider.interceptors.push(function($q, $injector, blockui, icons, labels) {
      return {
        'request': function(config) {
          blockui.mask();

          var AuthToken = $injector.get("AuthToken");
          var token = AuthToken.get();

          config.headers = config.headers || {};

          config.timeout = $q.defer().promise;
        
          if (token) {
            config.headers.Authorization = "Bearer " + token;
          }

          return config || $q.when(config);
        },

        'response': function(response) {

          blockui.demask();
          
          return response;
        },
        
        'responseError': function(response) {
          blockui.demask();

          if(response.status == 419) {
            $injector.get("AuthToken").remove();
          }

          if(response.status != 401 && response.status != 403 && response.status != 419) {
            blockui.showError();
          }
            
          var AuthEvents = $injector.get('AuthEvents');
          var matchesAuthenticatePath = response.config && response.config.url.match(new RegExp('/auth'));

          if (!matchesAuthenticatePath) {
            $injector.get('$rootScope').$broadcast({
              401: AuthEvents.notAuthenticated,
              403: AuthEvents.notAuthorized,
              419: AuthEvents.sessionTimeout
            }[response.status], response);
          }

          return $q.reject(response);
        }
      };
    });
  });