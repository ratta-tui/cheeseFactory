<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">



<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<link href="/css/test/test.css" rel="stylesheet" type="text/css">
<title>testing </title>
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
						<td>
							<a href='#' onclick='fn_view(${result.testId})'>
							<c:out value="${result.testTitle}"/>
							</a>
						</td>
						<td><c:out value="${result.testName}" /></td>
						<td><c:out value="${result.testDate}" /><td>
					</tr>

				</c:forEach>	
				</tbody>
			</table>
		</from>
	</div>		
	<div>
		<button id="btn_write" type="button" class="btn_write">글작성하기</button>
	</div>
	<br>
</body>

<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>


<script type="text/javascript">
	$("#btn_write").click(function javascript_onclickc() {
		$(location).attr('href','testRegister.do');
	});	

	function fn_view(testId) {
		var form = document.getElementById("boardForm");
		var url = "<c:url value='/testDetail.do'/>";
		url = url + "?testId" + testId;

		form.action = url;
		form.submit();
	}
</script>
</html>