var StudentService = angular.module('StudentService', []);

StudentService.factory('Tasks', function($resource) {
var service = $resource('/articles/index','','index' );
alert("asds");
return service;
});

