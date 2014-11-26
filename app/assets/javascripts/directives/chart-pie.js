'use strict';

angular.module('infoturismoApp').directive('chartPie', function () {
   	return {
   			scope: {
            data: '='
        },
        restrict: 'E',
        template: '<div class="chart-container"></div>',
        replace: true,
        link: function(scope, el, attrs) {
        	if(scope.isRendered === undefined){
                scope.isRendered = false;
            }

			var draw = function(el, seriesData) {
                var series, chart, labels, tooltipLabel;

                if(!seriesData){
                    return;
                }

                series = seriesData.map(function(item) {
                    return {
                    	type: 'pie',
                        name: item.name,
                        data: item.data
                    };
                });

                if(!scope.isRendered) {
             		el.highcharts({
			        	chart: {
			            	plotBackgroundColor: null,
			            	plotShadow: false
		        		},
		        		exporting: { enabled: false },
		        		title: {
		            		text: ''
		        		},
		        		tooltip: {
		            		pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		        		},
			        	plotOptions: {
			            	pie: {
			                	allowPointSelect: true,
			                	cursor: 'pointer',
			                	dataLabels: {
			                    	enabled: true,
			                    	format: '<b>{point.name}</b>: {point.percentage:.1f}%',
			                    	style: {
			                        	color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
			                    	    width: '50px'
                                    }
			                	}
			            	}
			        	},
				        series: series,
                        credits: {
                            enabled: false
                        }
			    	});

			    	scope.isRendered = true;
                }
                else {
                	chart = el.highcharts();

                	while(chart.series.length > 0) {
                        chart.series[0].remove(true);
                    }

                    series.map(function(item) {
                        chart.addSeries({
							type: 'pie',
                        	name: item.name,
                        	data: item.data
                        });
                    });

                    chart.xAxis[0].setCategories(categories);
                }
            };

            scope.$watch('data', function() {
                if(!scope.data){
                    return;
                }

                draw(el, scope.data);
            });
        }
    };
});
