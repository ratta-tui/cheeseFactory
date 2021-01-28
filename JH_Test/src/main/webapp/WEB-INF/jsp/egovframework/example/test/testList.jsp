<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<link href="/css/test/test.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<title>Insert title here</title>
</head>
<body>
	<h1 >게시판 LIST</h1>
	<hr>
	<div class="testlist">
		<from id="boardForm" name="boardForm" mothod="post">
			<table class="list_table">
				<colgroup>
					<col width="20%" />
					<col width="50%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<tbody>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일자</th>
						</tr>
					</thead>
				<c:forEach items="${list}" var="result">	
					<tr>
						<td><c:out value="${result.testId}" /></td>
						<td><c:out value="${result.testTitle}" /></td>
						<td><c:out value="${result.testName}" /></td>
						<td><c:out value="${result.testDate}" /><td>
					</tr>

				</c:forEach>	
				</tbody>
			</table>
		</from>
	</div>		
</body>
</html>