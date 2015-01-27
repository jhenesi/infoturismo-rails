'use strict';

angular.module('infoturismoApp').directive('chartRadar', function() {
    return {
        scope: {
            data: '=',
            labelClick: '&'
        },
        restrict: 'E',
        template: '<div class="chart-container"></div>',
        replace: true,
        link: function(scope, el, attrs) {
            if(scope.isRendered === undefined) {
                scope.isRendered = false;
            }

            var draw = function(el, categories, seriesData) {
                var series, chart, labels, tooltipLabel;

                if(!seriesData || !categories) {
                    return;
                }

                series = seriesData.map(function(item) {
                    return {
                        name: item.name,
                        data: item.data,
                        pointPlacement: 'on',
                        showInLegend: false
                    };
                });

                if(!scope.isRendered) {
                    el.highcharts({
                        chart: {
                            polar: true,
                            type: 'line'
                        },

                        exporting: { enabled: false },

                        title: {
                            text: '',
                            x: -80
                        },

                        pane: {
                            size: '80%'
                        },

                        xAxis: {
                            categories: categories,
                            tickmarkPlacement: 'on',
                            lineWidth: 0,
                            labels: {
                                step: 1,
                                distance: 23
                            }
                        },

                        yAxis: {
                            gridLineInterpolation: 'polygon',
                            lineWidth: 0,
                            min: 0,
                            max: 10,
                            showLastLabel: true,
                            tickInterval: 2
                        },

                        tooltip: {
                            formatter: function () {
                                return this.x + '</b>: <b>' + this.y + '</b>';
                            }
                        },

                        legend: {
                            align: 'center',
                            verticalAlign: 'bottom',
                            layout: 'vertical'
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

                    while(chart.series.length > 0)
                        chart.series[0].remove(true);

                    series.map(function(item) {
                        chart.addSeries({
                            name: item.name,
                            data: item.data,
                            pointPlacement: 'on',
                            showInLegend: false
                        });
                    });

                    chart.xAxis[0].setCategories(categories);
                }
                
                labels = el.find(".highcharts-axis-labels > text");
                tooltipLabel = el.find(".highcharts-tooltip> text");

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

            scope.$watch('data', function(n, o) {
                if(!scope.data)
                    return;

                draw(el, scope.data.categories, scope.data.series);
            });
        }
    };
});

