'use strict';

angular.module('infoturismoApp').directive('breadcrumb', function () {
	return {
		scope: {
			navigation: '='
		},
  		template: '<ol class="breadcrumb"></ol>',
  		restrict: 'E',
      replace: true,
  		link: function(scope, element, attrs) {
  			var createCrumb, nav, next;

  			createCrumb = function (location) {
  				var li, i, a;

  				li = $("<li></li>");
  				i = $('<i></i>');
  				
  				//i.addClass('fa ' + location.icon);
  				//li.append(i);

  				if(location.next) {
  					a = $('<a><i class="fa ' + location.icon + '"></i><span class="hidden-xs hidden-sm"> ' + location.name + '</span></a>');

  					a.attr('href', location.href);

            //li.append("&nbsp;");
  					li.append(a);
  				}
          else
          {
            li.addClass("active");
            li.append('<i class="fa ' + location.icon + '"></i><span class="hidden-xs hidden-sm"> ' + location.name + '</span>');
          }

  				return li;
  			}

  			nav = scope.navigation;

  			element.append(createCrumb(nav));

  			next = nav.next;

  			while (next) {
  				element.append(createCrumb(next));

    			next = next.next;
			}
  		}
	};
});
