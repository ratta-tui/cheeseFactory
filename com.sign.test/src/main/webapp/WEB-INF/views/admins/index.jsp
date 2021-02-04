<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ page pageEncoding="utf-8"%>


<div class="jumbotron">
	<h1>관리자 페이지</h1>
	<p>views/admins/index.jsp</p>
</div>
<div class="container">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>User</th>
				<th>Roles</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${ users }">
				<tr>
					<td>${ user.email }</td>
					<td>
						<c:forEach var="authority" items="${ user.authorities }">${ authority.authority }</c:forEach>
					</td>
					
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
</div>