'use strict';

angular.module('infoturismoApp').service('blockui', function loadingMask() {
	return {
		mask: function() {
			angular.element.blockUI({ 
				message: '<i class="fa fa-refresh fa-spin fa-5x"></i>',
				css: {
					border: 'none', 
					padding: '15px', 
					backgroundColor: '#000', 
					'-webkit-border-radius': '10px', 
					'-moz-border-radius': '10px', 
					opacity: .5, 
					color: '#fff' ,
					'z-index':1000
				} 
			}); 
		},
		demask: function() {
			angular.element.unblockUI();
		},
		showMessage: function(icon, title, text) {
			angular.element.blockUI({ 
	            message: angular.element(
	            '<div style="row cursor: default; display: none;">' +
		            '<div class="col-xs-3">' +
		            	'<i class="fa ' + icon + ' fa-5x"></i>' +
		            '</div>' +
		            '<div class="col-xs-9">' +
		            	'<h4>' + title + '</h4>' +
		            	'<p>' + text + '</p>' +
		            '</div>' +
		        '</div>'), 
	            fadeIn: 700, 
	            fadeOut: 700, 
	            timeout: 3000, 
	            showOverlay: false, 
	            centerY: false, 
	            css: { 
	                width: '300px', 
	                top: '15px', 
	                left: '', 
	                right: '10px', 
	                border: 'none', 
	                padding: '5px', 
	                backgroundColor: '#000', 
	                '-webkit-border-radius': '10px', 
	                '-moz-border-radius': '10px', 
	                opacity: 0.6, 
	                color: '#fff',
	                'z-index':3000
	            } 
	        }); 
		},
		showError: function() {
			angular.element.blockUI({ 
	            message: angular.element(
	            '<div style="row cursor: default; display: none;">' +
		            '<div class="col-xs-3">' +
		            	'<i class="fa fa-close fa-5x"></i>' +
		            '</div>' +
		            '<div class="col-xs-9">' +
		            	'<h4>Ha ocurrido un error</h4>' +
		            	'<p>Consulte a Soporte Técnico</p>' +
		            '</div>' +
		        '</div>'), 
	            fadeIn: 700, 
	            fadeOut: 700, 
	            timeout: 3000, 
	            showOverlay: false, 
	            centerY: false, 
	            css: { 
	                width: '300px', 
	                top: '15px', 
	                left: '', 
	                right: '10px', 
	                border: 'none', 
	                padding: '5px', 
	                backgroundColor: '#000', 
	                '-webkit-border-radius': '10px', 
	                '-moz-border-radius': '10px', 
	                opacity: 0.6, 
	                color: '#fff',
	                'z-index':3000
	            } 
	        }); 
		} 
	};
});