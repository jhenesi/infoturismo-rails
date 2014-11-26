'use strict';

angular.module('infoturismoApp').controller('LayoutCtrl', [
    '$scope', 
    '$routeParams', 
    '$location', 
    'labels', 
    'icons', 
    'routes',
    'filters',
    function (
        $scope, 
        $routeParams, 
        $location, 
        labels, 
        icons, 
        routes,
        filters
    ) {
        var menuIcons = icons.menu;

        $scope.menuItems = [{
            activeClass: "{active: activeItem == 1}",
            icon: menuIcons.general,
            label: labels.general,
            href: routes.general.path
        },{
            activeClass: "{active: activeItem == 2}",
            icon: menuIcons.acceso,
            label: labels.acceso,
            href: routes.acceso.path
        },{
            activeClass: "{active: activeItem == 3}",
            icon: menuIcons.atractivos,
            label: labels.atractivos,
            href: routes.atractivos.path
        },{
            activeClass: "{active: activeItem == 4}",
            icon: menuIcons.consumo,
            label: labels.consumo,
            href: routes.consumo.path
        },{
            activeClass: "{active: activeItem == 5}",
            icon: menuIcons.costo,
            label: labels.costo,
            href: routes.costo.path
        },{
            activeClass: "{active: activeItem == 6}",
            icon: menuIcons.experiencia,
            label: labels.experiencia,
            href: routes.experiencia.path
        },{
            activeClass: "{active: activeItem == 7}",
            icon: menuIcons.imagen,
            label: labels.imagen,
            href: routes.imagen.path
        },{
            activeClass: "{active: activeItem == 8}",
            icon: menuIcons.satisfaccion,
            label: labels.satisfaccion,
            href: routes.satisfaccion.path
        }];

        var active = {
            acceso: 2,
            atractivos: 3,
            consumo: 4,
            costo: 5,
            experiencia: 6,
            imagen: 7,
            satisfaccion: 8
        };

        active[""] = 1;

        $scope.isFiltersToggled = false;
    	$scope.activeItem = 1;

    	$scope.labels = labels;
    	$scope.menuIcons = icons.menu;

    	$scope.toggleFilters = function() {
    		$scope.isFiltersToggled = !$scope.isFiltersToggled;
    	};

        $scope.$on('$routeChangeSuccess', function () {
            var section = $location.url().split("/")[1];;
            
            $scope.activeItem = active[section];
        });

        var filterMenuIcons = icons.filterMenu;

        $scope.filterMenuItems = [{
            activeClass: "{active: activeFilterItem == 1}",
            icon: filterMenuIcons.motivo,
            label: labels.motivo,
            id:"filter-motivo"
        },{
            activeClass: "{active: activeFilterItem == 2}",
            icon: filterMenuIcons.transporte,
            label: labels.transporte,
            id:"filter-transporte"
        },{
            activeClass: "{active: activeFilterItem == 3}",
            icon: filterMenuIcons.genero,
            label: labels.genero,
            id:"filter-genero"
        },{
            activeClass: "{active: activeFilterItem == 4}",
            icon: filterMenuIcons.edad,
            label: labels.edad,
            id:"filter-edad"
        },{
            activeClass: "{active: activeFilterItem == 5}",
            icon: filterMenuIcons.compania,
            label: labels.compania,
            id:"filter-compania"
        },{
            activeClass: "{active: activeFilterItem == 6}",
            icon: filterMenuIcons.ultima,
            label: labels.ultima,
            id:"filter-ultima"
        },{
            activeClass: "{active: activeFilterItem == 7}",
            icon: filterMenuIcons.frecuencia,
            label: labels.frecuencia,
            id:"filter-frecuencia"
        },{
            activeClass: "{active: activeFilterItem == 8}",
            icon: filterMenuIcons.ocupacion,
            label: labels.ocupacion,
            id:"filter-ocupacion"
        },{
            activeClass: "{active: activeFilterItem == 9}",
            icon: filterMenuIcons.estancia,
            label: labels.estancia,
            id:"filter-estancia"
        },{
            activeClass: "{active: activeFilterItem == 10}",
            icon: filterMenuIcons.residencia,
            label: labels.residencia,
            id:"filter-residencia"
        },{
            activeClass: "{active: activeFilterItem == 11}",
            icon: filterMenuIcons.grado,
            label: labels.grado,
            id:"filter-grado"
        },{
            activeClass: "{active: activeFilterItem == 12}",
            icon: filterMenuIcons.oportunidad,
            label: labels.oportunidad,
            id:"filter-oportunidad"
        },{
            activeClass: "{active: activeFilterItem == 13}",
            icon: filterMenuIcons.gasto,
            label: labels.gasto,
            id:"filter-gasto"
        }];

        var filterActive = {};

        filterActive["filter-motivo"] = 1;
        filterActive["filter-transporte"] = 2;
        filterActive["filter-genero"] = 3;
        filterActive["filter-edad"] = 4;
        filterActive["filter-compania"] = 5;
        filterActive["filter-ultima"] = 6;
        filterActive["filter-frecuencia"] = 7;
        filterActive["filter-ocupacion"] = 8;
        filterActive["filter-estancia"] = 9;
        filterActive["filter-residencia"] = 10;
        filterActive["filter-grado"] = 11;
        filterActive["filter-oportunidad"] = 12;
        filterActive["filter-gasto"] = 13;
        

        $scope.activeFilterItem = 0;

        $scope.filters = filters;

        $scope.onFilterMenuItemClick = function(e) {
            if($scope.activeFilterItem === filterActive[e.currentTarget.id]) {
                $scope.activeFilterItem = 0;
                filters.filterBy = "";
            }
            else {
                $scope.activeFilterItem = filterActive[e.currentTarget.id];
                filters.filterBy = e.currentTarget.id.split("filter-")[1];
            }
        };

        $scope.$watch('filters.filterBy', function() {
            $scope.toggleFilters();
        });
    }
]);
