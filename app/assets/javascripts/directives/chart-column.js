'use strict';

angular.module('infoturismoApp').directive('chartColumn', function () {
    return {
	    scope: {
            data: '=',
            title: '@'
        },
    	restrict: 'E',
     	template: '<div class="chart-container"></div>',
      	replace: true,
      	link: function postLink(scope, element, attrs) {
      		if(scope.isRendered === undefined) 
                scope.isRendered = false;

            var draw = function(element, categories, series, title) {
            	var series, chart, labels, tooltipLabel;

            	if(!series || !categories)
                    return;

                if(!scope.isRendered) {
				    element.highcharts({
				        chart: {
				            type: 'column'
				        },
				        exporting: { enabled: false },
				        title: {
				            text: title,
				            style: {
				            	fontSize: '15px'
				            }
				        },
				        xAxis: {
				            categories: categories
				        },
				        yAxis: {
				            allowDecimals: false,
				            min: 0,
				            title: {
				                text: 'Calificacion'
				            }
				        },
				        legend: {
				        	symbolWidth: 8,
				        	layout: 'vertical',
					     	align: 'right',
					      	verticalAlign: 'top',
					      	y: 50
				        },
				        tooltip: {
				            formatter: function () {
				                return '<b>' + this.x + '</b><br/>' +
				                    this.series.name + ': ' + this.y + '<br/>' +
				                    'Total: ' + this.point.stackTotal;
				            }
				        },
				        plotOptions: {
				            column: {
				                stacking: 'normal'
				            }
				        },
				        series: series,
				        credits: {
                            enabled: false
                        }
    				});

                }
                else {
                	chart = element.highcharts();

                    while(chart.series.length > 0)
                        chart.series[0].remove(true);

                    series.map(function(item) {
                        chart.addSeries(item);
                    });

                    chart.xAxis[0].setCategories(categories);
                }

            }

            scope.$watch('data', function() {
                if(!scope.data)
                    return;

                draw(element, scope.data.categories, scope.data.series, scope.title);
            });
      	}
	};
});
