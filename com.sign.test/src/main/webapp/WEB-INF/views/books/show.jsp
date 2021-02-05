<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page pageEncoding="utf-8"%>
<div class="jumbotron">
    <h1>${ book.title }</h1>
    <p>${ book.author }저</p>
</div>
<div class="container">
    <div class="row">
        <div class="col-6">
            <img src="${ book.image }">
        </div>
        <div class="col-6">
            <h3>${ book.title }</h3>
            <p>저자: ${ book.author }</p>
        </div>
    </div>
    <div class="my-5">
        <h3>리뷰</h3>
    </div>
    <c:if test="${ fn:length(reviews) gt 0 }">
        <table class="table table-stripped">
            <thead>
                <tr>
                    <th>User</th>
                    <th>Text</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="review" items="${ reviews }">
                    <tr>
                        <td>${ review.user.email }</td>
                        <td>${ review.text }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:url var="reviewsPath" value="/reviews" />
    <f:form modelAttribute="review" action="${ reviewsPath }" method="post">
        <c:forEach var="error" items="${ fieldErrors }">
            <div class="alert alert-warning">
                <strong>${ error.getField() }</strong>: ${ error.getDefaultMessage() }
            </div>
        </c:forEach>
        <f:textarea path="text" cssClass="form-control" rows="5" />
        <f:hidden path="bookId" />
        <f:hidden path="userId" />
        <button class="btn btn-block btn-primary" type="submit">리뷰 등록</button>
    </f:form>
</div>