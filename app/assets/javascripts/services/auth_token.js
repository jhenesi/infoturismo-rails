'use strict';

angular.module('infoturismoApp').service('AuthToken', [
	'$cookies',
	'$cookieStore',
	function AuthToken(
		$cookies,
		$cookieStore
	) {
		var auth_token;
		return {
			get: function() {
				return $cookies.auth_token;
			},
			set: function(auth_token) {
				$cookies.auth_token = auth_token;
			},
			remove: function() {
				$cookieStore.remove('auth_token');
			}
		};
	}
]);