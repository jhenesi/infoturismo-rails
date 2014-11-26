'use strict';

angular.module('infoturismoApp').directive('chartPage', function () {
	return {
		replace: true,
		transclude: true,
      	templateUrl: 'directives/chart-page.html',
      	restrict: 'E'
    };
});
