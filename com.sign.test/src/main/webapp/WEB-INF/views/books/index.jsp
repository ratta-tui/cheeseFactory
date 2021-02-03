<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- MDB BOOT -->
	<!-- Font Awesome -->
	<link
	  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	  rel="stylesheet"
	/>
	<!-- Google Fonts -->
	<link
	  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	  rel="stylesheet"
	/>
	<!-- MDB -->
	<link
	  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.css"
	  rel="stylesheet"
	/>
<!-- MDB END -->
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<title>Books</title>
</head>
<body>
    <div class="container">
        <div class="jumbotron">
            <h1>Books INDEX</h1>
            <p>views/books/index.jsp</p>
            <a href="<c:url value="/books/newBook" />" class="btn btn-lg btn-primary">도서등록</a>
        </div>
        <div class="row">
        <c:forEach var="book" items="${books}" varStatus="status">
            <div class="col-md-4">
              <div class="card">
                  <img src="${ book.image }" class="card-img-top" />
                  <div class="caption">
                      <h3> ${ book.title } <small>${ book.author }</small></h3>
                     <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                      <a href="<c:url value='/books/edit/${ book.id }'/>" class="btn btn-primary">수정</a>
                      <a href="<c:url value='/books/delete/${ book.id}'/>" class="btn btn-danger">삭제</a>
                      
                  </div>
              </div>
            </div>
          </c:forEach>
        </div>
    </div>
</body>
</html>