<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ page pageEncoding="utf-8" session="false"%>
<div class="jumbotron">
	<h1>Books INDEX</h1>
	<p>views/books/index.jsp</p>
	<s:authorize access="hasRole('ADMIN')">
		<a href="<c:url value="/books/newBook" />" class="btn btn-lg btn-primary">도서등록</a>
	</s:authorize>
</div>
<div class="container">
	<div class="row">
		<c:forEach var="book" items="${books}" varStatus="status">
			<div class="col-md-4">
				<div class="card">
					<img src="<c:url value="${ book.image }" />" class="card-img-top" />
					<div class="card-body">
						<h3 class="card-title">${ book.title }</h3>
						<p class="card-text">this is the Amumal DaeJanChi You know what i'm saying? I truely want Tuaigeun</p>
						<a href="#" class="btn btn-primary">상세보기</a>
						<s:authorize access="hasRole('ADMIN')">
							<a href="<c:url value='/books/edit/${ book.id }' />"
								class="btn btn-lg btn-default">수정</a>
							<a href="<c:url value='/books/delete/${ book.id }' />"
								class="btn btn-lg btn-danger">삭제</a>
						</s:authorize>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>