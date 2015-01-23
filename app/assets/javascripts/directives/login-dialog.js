'use strict';

angular.module('infoturismoApp').directive('loginDialog', [
    'blockui', 
    'icons', 
    'labels', 
    'Authentication', 
    'AuthEvents', 
    '$rootScope', 
    '$route', 
    function (
        blockui, 
        icons, 
        labels, 
        Authentication, 
        AuthEvents, 
        $rootScope, 
        $route
    ) {
    	return {
    		scope: {
                show: '='
            },
    		replace: true,
     		templateUrl: 'directives/login-dialog.html',
         	restrict: 'E',
         	link: function postLink(scope, element, attrs) {
         		scope.credentials = {};

         		scope.$watch('show', function(val) {
         			if(val){
         				element.modal({ backdrop: 'static', keyboard: false, show: true});
         			}
         			else {
         				element.modal('hide');
                        scope.credentials.username = "";
                        scope.credentials.password = "";
         			}
                });

                element.find('.modal-login-btn').click(function() {
                	Authentication.login(scope.credentials.username, scope.credentials.password);
                });

                $rootScope.$on(AuthEvents.loginSuccess, function() {
                	scope.show = false;
                	$route.reload();
            	});

            	$rootScope.$on(AuthEvents.loginFailed, function() {
            		blockui.showMessage('fa fa-close', labels.credencialesInvalidasTitle, labels.credencialesInvalidasText);
            	});
          	}
    	};
    }
]);