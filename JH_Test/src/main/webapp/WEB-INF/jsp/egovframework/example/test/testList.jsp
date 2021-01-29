<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
	<!-- Bootstrap CSS -->

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
		integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

	<!--  <link href="/css/test/test.css" rel="stylesheet" type="text/css"> -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>

<body>

	<h1 style="text-align: center;">게시판List</h1>

	<div class="testlist" >
		<form id="boardForm" name="boardForm" method="post">
			<table class="list_table">
				<colgroup>
					<col width="20%" />
					<col width="50%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<tbody>
					<thead style="margin-left: 10%;">

						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일자</th>
						</tr>
						<hr>
					</thead>

					<!-- jstl 데이터베이스를 검색해 넘겨 받은 list 를 result 라는 이름으로 순차적으로 실행을 시키게 됨  java의 for문같이 순차적으로 실행시킴-->

					<c:forEach items="${list}" var="result">
						<tr>
							<td>
								<c:out value="${result.testId}" />
							</td>
							<td><a href='#' onClick='fn_view(${result.testId})'>
									<c:out value="${result.testTitle }" /></a></td>
							<td>
								<c:out value="${result.testName}" />
							</td>
							<td>
								<c:out value="${result.testDate}" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
	<div>
		<button id="btn_write" type="button" class="btn_write">글작성</button>
	</div>
	<br>
</body>
<script type="text/javascript">
	//글 작성 버튼 클릭 시 testRegister로 이동
	$("#btn_write").click(function javascript_onclikc() {
		$(location).attr('href', 'testRegister.do');

	});

	//글조회
	//	어떤 게시물을 클릭했는지 게시물의 번호(testId)를 넘겨 줘야 함 따라서 게시물 클릭 이벤트에서 게시물의 번호를 인자 값으로 받습니다.
	//  get 방식으로 데이터를 전송합니다. 따라서 ? 연산자를 사용해 testId를 주소 뒤에 붙여 줍니다
	function fn_view(testId) {

		var form = document.getElementById("boardForm");
		var url = "<c:url value='/testDetail.do'/>";
		url = url + "?testId=" + testId;

		form.action = url;
		form.submit();
	}
</script>

</html>