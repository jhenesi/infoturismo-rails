'use strict';


angular.module('infoturismoApp').service('filters', 
	function filters() {
    	return {
            fechaInicio: '',
            fechaFin: '',
            filterBy: ''
    	};
 	}
);
