<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<title>Books Edit</title>
</head>
<body>
	<div class="container">
        <div class="jumbotron">
            <h1>Books Edit</h1>
        </div>
        <form action="<c:url value='/books/updates'/>" method="post">
            <div class="form-group form-group-lg">
                <label class="control-label">도서 제목</label>
                <input type="text" name="title" class="form-control" value="${ book.title}">
            </div>

            <div class="form-group form-group-lg">
                <label class="control-label">저자</label>
                <input type="text" name="author" class="form-control" value="${ book.author}">
            </div>
             <div class="form-group form-group-lg">
            	<input name="file" class="form-control-file" type="file">
            </div>
			<input name="id" type="hidden" value="${ book.id}">
        	<button type="submit" class="btn btn-lg btn-primary">전송</button>
        </form>
    </div>
</body>
</html>