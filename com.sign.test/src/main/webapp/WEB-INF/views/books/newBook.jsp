<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- BootStrap 4 -->
	<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<!-- 4 end -->
<title>Books NEW</title>
</head>
<body>
    <div class="container">
        <div class="jumbotron">
            <h1>Books NEW</h1>
            <p>views/books/newBook.jsp</p>
        </div>
        <form action="<c:url value="/books" />" method="post" enctype="multipart/form-data">
            <div class="form-group form-group-lg">
                <label class="control-label">도서 제목</label>
                <input name="title" type="text" class="form-control">
            </div>
            <div class="form-group form-group-lg">
                <label class="control-label">저자</label>
                <input name="author" type="text" class="form-control">
            </div>
             <div class="form-group form-group-lg">
            	<input name="file" class="form-control-file" type="file">
            </div>
            <button type="submit" class="btn btn-lg btn-primary">전송</button>
        </form>
    </div>
</body>
</html>