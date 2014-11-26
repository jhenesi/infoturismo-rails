'use strict';

angular.module('infoturismoApp').directive('chartBar', function () {
    return {
    	scope: {
            data: '=',
            labelClick: '&'
        },
    	restrict: 'E',
     	template: '<div class="chart-container"></div>',
      	replace: true,
      	link: function postLink(scope, element, attrs) {
      		if(scope.isRendered === undefined) 
                scope.isRendered = false;

       		var draw = function(element, categories, series) {
       			var series, chart, labels, tooltipLabel;

                if(!series || !categories)
                    return;

                if(!scope.isRendered) {
					element.highcharts({
		        		chart: {
		                	type: 'bar'
		            	},
		            	exporting: { enabled: false },
		            	title: {
		                	text: ''
		            	},
		            	xAxis: {
			                categories: categories,
			                title: {
			                    text: null
			                },
			                labels : {
			                    enabled: false
			                }
		            	},
		            	yAxis: {
			                stackLabels: {
			                    formatter: function() {
			                        return this.axis.chart.xAxis[0].categories[this.x];
			                    },
			                    enabled: true,           
			                    verticalAlign: 'top',     
			                    align: 'left',
			                    y: -1
			                },
		                	min: 0,
		                	max: 10,
		                	tickInterval: 2,
			                title: {
			                    text: 'Promedio',
			                    align: 'high'
			                },
			                labels: {
			                    overflow: 'justify'
			                }
		            	},
			            tooltip: {
			                formatter: function () {
		                 		return this.x + '</b>: <b>' + this.y + '</b>';
		                  	},
                            style: {
                                height:'auto',
                                width:'150px',   
                                overflow:'auto'
                            }
			            },
			            plotOptions: {
                            series: {
                                stacking: 'normal'
                            },
                            bar: {
                                events: {
                                    legendItemClick: function () {
                                        console.log(element.find(".highcharts-stack-labels > text").length);
                                    }
                                }
                            }
                        },
			            credits: {
			                enabled: false
			            },
				        series: series
				    });

                	scope.isRendered = true;
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

                labels = element.find(".highcharts-stack-labels > text");

            	tooltipLabel = element.find(".highcharts-tooltip > text");

       			labels.css("cursor", "pointer");
       			tooltipLabel.css("cursor", "pointer");

       			labels.unbind();
                tooltipLabel.unbind();

                if(!scope.labelClick)
                    return;

                labels.click(function(e) {
                    scope.labelClick({
                        e: e
                    });
                });

                tooltipLabel.click(function(e) {
                    scope.labelClick({
                        e: e
                    });
                });
       		}

            scope.$watch('data', function() {
                if(!scope.data)
                    return;

                draw(element, scope.data.categories, scope.data.series);
            });
      	}
    };
});
