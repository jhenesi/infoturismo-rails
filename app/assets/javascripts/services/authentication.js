'use strict';

angular.module('infoturismoApp').service('Authentication', [
	'$http', 
	'$q', 
	'$rootScope', 
	'AuthToken',
	'AuthEvents',
	function AuthService(
		$http, 
		$q, 
		$rootScope, 
		AuthToken, 
		AuthEvents
	) {
		return {
			login: function(username, password) {
				var d = $q.defer();

				$http.post('/auth', {
        			username: username,
        			password: password
      			}).success(function(resp) {
        			AuthToken.set(resp.auth_token);
        			$rootScope.$broadcast(AuthEvents.loginSuccess);
        			d.resolve(resp.user);
      			}).error(function(resp) {
        			$rootScope.$broadcast(AuthEvents.loginFailed);
        			d.reject(resp.error);
      			});

      			return d.promise;
			}
		};
	}
]);