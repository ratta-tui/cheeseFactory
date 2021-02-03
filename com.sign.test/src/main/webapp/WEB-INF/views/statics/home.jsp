<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" session="false" %>
<!doctype html>

<html>
	<head>
	
		<!-- Required meta tags -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    
	    <!-- Bootstrap CSS -->
	    <link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
		<title>Home</title>
	</head>
	<body class="container">
		<div class="jumbotron">
			<h1>Test</h1>
			<P>  The time on the server is ${serverTime}. </P>
		</div>
	</body>
</html>
