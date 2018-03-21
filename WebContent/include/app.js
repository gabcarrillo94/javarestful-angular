(function() {
	
	var app = angular.module("app", ['ngSanitize', 'ngRoute']);
	
	app.controller("HttpCtrl", function($scope, $http) {
		$scope.customHome = "";
		$scope.navTitle = 'All Users';
		$scope.operation="";
		$scope.userLogged = false;
		
		var response = $http.get('/RestfulWebServiceExample/rest/actors/');
		response.success(function(data) {
			$scope.actors = data;
			console.log("[main] # of items: " + data.length)
			angular.forEach(data, function(element) {
				console.log("[main] actor: " + element.name);
			});
		})
		response.error(function(data, status, headers, config) {
			alert("AJAX failed to get data, status=" + status);
		})
		
		$scope.clearForm = function() {
			$scope.actor = {
				id:'',
				name:'',
				email:'',
				password:'',
				firstName:'',
				lastName:''
			};
		}
		
		$scope.login = function(email, password) {
			$scope.jsonObj = angular.toJson($scope.actor, false);
			console.log("[update] data: " + $scope.jsonObj);
			
			if(email && password) {
				var response = $http.post('/RestfulWebServiceExample/rest/actors/login', $scope.jsonObj);
				
				response.success(function(data, status) {
					newUser = data;
					$scope.resetSearch();
					
					console.log(newUser.firstName);
					
					if(newUser.firstName) {
						console.log("Session created..." + angular.toJson(data, false) + ", status=" + status);
						$scope.userLogged = true;
						$scope.actor = newUser;
					}	
					else{
						console.log("User doesn't exist");
					}
					
			    });
				
				response.error(function(data, status) {
					alert("AJAX failed to get data, status=" + status);
				})
			}
		}
		
		$scope.resetSearch = function(name) {
			//var app = this;
			$scope.customHome = "";
			$scope.operation="";
			$scope.clearForm();
			$scope.userLogged = false;
			$scope.navTitle = 'All Users';
			$scope.searchName = '';
			
			var response = $http.get('/RestfulWebServiceExample/rest/actors/');
			response.success(function(data) {
				$scope.actors = data;
				//$scope.$apply();
				console.log("[resetSearch] # of items: " + data.length)
		    });
			
			response.error(function(data, status, headers, config) {
				alert("AJAX failed to get data, status=" + status);
			})
		};
	});	
})();