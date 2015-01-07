'use strict';

angular.module('infoturismoApp').service('AuthEvents', [function AuthEvents() {
	return {
		notAuthenticated: 'not-authenticated',
		notAuthorized: 'not-authorized',
		sessionTimeout: 'session-timeout',
		loginSuccess: 'login-success',
		loginFailed: 'loginFailed'
	}
}]);