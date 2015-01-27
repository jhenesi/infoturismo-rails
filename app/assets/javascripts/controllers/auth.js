'use strict';

angular.module('infoturismoApp').controller('AuthCtrl', [
	'$rootScope', 
	'$scope',
	'$window',
	'$http',
	'Authentication', 
	'AuthEvents',
	'AuthToken',
	'blockui', 
	'labels',
	'infoturismoWebApi',
	function(
		$rootScope, 
		$scope, 
		$window,
		$http,
		Authentication, 
		AuthEvents,
		AuthToken,
		blockui, 
		labels
	) {
		$scope.credentials = {};

		$scope.login = function() {
			AuthToken.remove();
			Authentication.login($scope.credentials.username, $scope.credentials.password);
		};

		$rootScope.$on(AuthEvents.loginSuccess, function() {
			$window.location.href = 'home';
		});

	 	$rootScope.$on(AuthEvents.loginFailed, function() {
	  		blockui.showMessage('fa fa-close', labels.credencialesInvalidasTitle, labels.credencialesInvalidasText);
	   	});
	}
]);