// Define a new module for our app
var app = angular.module('app', ['ngResource','CalculatorService','StudentService']);

// Create the instant search filter

app.controller('StudentController', function ($scope, Tasks) {
    $scope.status;
    $scope.students;
    getStudents();

    function getStudents() {
        Tasks.service()
            .success(function (articles) {
                $scope.items = articles;
            })
            .error(function (error) {
                $scope.status = 'Unable to load customer data: ' + error.message;
            });
    }

    });


app.filter('searchFor', function(){
alert("sads");
	// All filters must return a function. The first parameter
	// is the data that is to be filtered, and the second is an
	// argument that may be passed with a colon (searchFor:searchString)

	return function(arr, searchString){

		if(!searchString){
			return arr;
		}

		var result = [];

		searchString = searchString.toLowerCase();

		// Using the forEach helper method to loop through the array
		angular.forEach(arr, function(item){

			if(item.title.toLowerCase().indexOf(searchString) !== -1){
				result.push(item);
			}

		});

		return result;
	};

});

app.controller('CalculatorController', function ($scope, Calculator) {

    $scope.findSquare = function () {
        $scope.answer = Calculator.add($scope.number);
    }
});





// The controller

app.controller('InstantSearchController', function($scope, $resource){
alert("testtstts");
/*$http.get('articles/').success(function(data){
	alert("dasdsad");
        alert(data);
        //  $scope.items = data;
          alert("dasdsad");
        });

var service = $resource("/articles/",
    {},
    {'query': {method: 'GET', isArray: true, "transformResponse": function (data) {
        return JSON.parse(data).objects;
    }}});
    */
 //   var service = $resource("/articles/.json", {id: "5"}, {get: {method: "GET"}});

//alert("update" + service);


	// The data model. These items would normally be requested via AJAX,
	// but are hardcoded here for simplicity. See the next example for
	// tips on using AJAX.

	$scope.items1 = [
		{
			url: 'http://www.tutorialspoint.com/android/',
			title: 'Android tutorials',
			image: 'http://www.tutorialspoint.com/android/images/android-mini-logo.jpg'
		},
		{
			url: 'http://www.tutorialspoint.com/angularjs/',
			title: 'AngularJs Tutorials ',
			image: 'http://www.tutorialspoint.com/angularjs/images/angularjs-mini-logo.jpg'
		},
		{
			url: 'http://www.tutorialspoint.com/html5/',
			title: 'HTML5 Tutorials',
			image: 'http://www.tutorialspoint.com/html5/images/html5-mini-logo.jpg'
		},
		{
			url: 'http://www.tutorialspoint.com/css/',
			title: 'CSS Tutorials',
			image: 'http://www.tutorialspoint.com/css/images/css-mini-logo.jpg'
		},
		{
			url: 'http://www.tutorialspoint.com/java/',
			title: 'Java Tutorials',
			image: 'http://www.tutorialspoint.com/java/images/java-mini-logo.jpg'
		},
		{
			url: 'http://www.tutorialspoint.com/joomla/',
			title: 'Joomla Tutorials',
			image: 'http://www.tutorialspoint.com/joomla/images/joomla-mini-logo.jpg'
		},
		{
			url: 'http://www.tutorialspoint.com/html/',
			title: 'HTML Tutorials ',
			image: 'http://www.tutorialspoint.com/html/images/html-mini-logo.jpg'
		}
	];


});
