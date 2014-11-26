'use strict';

angular.module('infoturismoApp').controller('MainCtrl', [
    '$scope', 
    '$window',
    '$sce',
    'infoturismoWebApi', 
    'labels', 
    'icons', 
    'routes', 
    'crumbs',
    function (
        $scope, 
        $window, 
        $sce,
        infoturismoWebApi, 
        labels, 
        icons, 
        routes, 
        crumbs
    ) {
        var stringContains = function(string, substring) {
            var regexp = new RegExp('\\b' + substring + '\\b');
            return regexp.test(string);
        };

        var breadcrumbs = crumbs.getGeneral();

        $scope.title = labels.general;
        $scope.titleIcon = icons.general;

        $scope.navegacion = breadcrumbs;

        $scope.onLabelClick = function(e){
            var text = angular.element(e.currentTarget).text();

            if(stringContains(text, 'Acceso al Destino e Infraestructura')){
                $window.location = routes.acceso.path;
            }
            else if (stringContains(text, 'Atractivos y Oferta Turística')){
                $window.location = routes.atractivos.path;
            }
            else if (stringContains(text, 'Consumo de Servicios')){
                $window.location = routes.consumo.path;
            }
            else if (stringContains(text, 'Costo')){
                $window.location = routes.costo.path;
            }
            else if (stringContains(text, 'Experiencia de Viaje')){
                $window.location = routes.experiencia.path;
            }
             else if (stringContains(text, 'Imagen')){
                $window.location = routes.imagen.path;
            }
            else if (stringContains(text, 'Satisfacción y Recomendación')){
                $window.location = routes.satisfaccion.path;
            }
        };

        infoturismoWebApi.getOverviewData()
            .success(function(data, status, headers, config) {
                if (data.length == 0) {
                    return;
                }

                var values = [];

                angular.forEach(data, function(item, i) {
                    values.push(item.Promedio)
                });

               $scope.datos = {
                    categories: [
                        '<span style="font-family: FontAwesome;">' + icons.accesoSvg + '<span><span>' + $sce.getTrustedHtml($sce.trustAsHtml(data[0].Nombre)) + '</span>',
                        '<span style="font-family: FontAwesome;">' + icons.atractivosSvg + '<span><span>' + $sce.getTrustedHtml($sce.trustAsHtml(data[1].Nombre)) + '</span>', 
                        '<span style="font-family: FontAwesome;">' + icons.consumoSvg + '<span><span>' + $sce.getTrustedHtml($sce.trustAsHtml(data[2].Nombre)) + '</span>', 
                        '<span style="font-family: FontAwesome;">' + icons.costoSvg + '<span><span>' + $sce.getTrustedHtml($sce.trustAsHtml(data[3].Nombre)) + '</span>', 
                        '<span>' + $sce.getTrustedHtml($sce.trustAsHtml(data[4].Nombre)) + '</span><span style="font-family: FontAwesome;">'+ icons.experienciaSvg + '</span>',
                        '<span>' + $sce.getTrustedHtml($sce.trustAsHtml(data[5].Nombre)) + '</span><span style="font-family: FontAwesome;">'+ icons.imagenSvg + '</span>',
                        '<span>' + $sce.getTrustedHtml($sce.trustAsHtml(data[6].Nombre)) + '</span><span style="font-family: FontAwesome;">'+ icons.satisfaccionSvg + '</span>'
                    ],
                    series: [{
                        name: 'Promedio',
                        data: values
                    }]
                };
            })
            .error(function(data, status, headers, config) {
            });
    }
]);


