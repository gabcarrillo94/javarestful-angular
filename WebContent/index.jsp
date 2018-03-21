<html ng-app="app">
	<head>
		<title>Login Example</title>
		<link href="include/styles.css" rel="stylesheet">
		<!-- Use Bootstrap -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>		
		<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular-sanitize.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular-route.js"></script>
		
		<script type="text/javascript" src="include/app.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	</head>
	
	<body ng-controller="HttpCtrl as app">
	
  	<div class="container">
		<div class="header">
			<h1 class="custom">Login</h1>
		</div>

		<div class="leftPanel">
			<div class="LeftPanelHeader">{{navTitle}}</div>
			<table class="side">
			  <tr ng-repeat="a in actors">
			    <td class="side">{{a.name}}</td>
			  </tr>
			</table>
		</div>
		
		<div class="MainBody">
		
			<div ng-show="userLogged">
				<h1>Hola Mundo!</h1>
				<h2>{{actor.lastName}}, {{actor.firstName}}</h2>
			</div>
		
			<form id="main" ng-hide="userLogged">
				<table>
					<tr>
						<td class="display_bold"><label for="email">Email:</label></td>
					</tr>
					<tr>
						<td class="display"><input id="email type="text" ng-model="actor.email" size="30"></td>
					</tr>
					<tr>
						<td class="display_bold"><label for="password">Password:</label></td>
					</tr>
					<tr>
						<td class="display"><input id="password" type="password" ng-model="actor.password" size="30"></td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						  <table>						  	
						  	<tr>
						  	  <td><button ng-click="login(actor.email, actor.password)" class="btn btn-success btn-sm" title="Init Session">
						  	  Log in</button></td> 	  
						  	</tr>
						  </table>
						</td>
					</tr>
					
				</table>
			</form>
		</div>

	</div>
	</body>
</html>