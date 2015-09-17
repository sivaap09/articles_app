var CalculatorService = angular.module('CalculatorService', [])
.service('Calculator', function () {
    this.square = function (a) { return a*a};
    
 this.add = function($resource) {
     alert("test" + $resource);
     
     
var service = $resource('/articles/.json','','index');
service.get();
alert("asds");
return service;
};



});
