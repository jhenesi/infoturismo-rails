'use strict';

angular.module('infoturismoApp').directive('panelPage', function () {
	return {
		replace: true,
		transclude: true,
      	templateUrl: 'directives/panel-page.html',
      	restrict: 'E'
    };
});
