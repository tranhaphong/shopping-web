<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/define.jsp" %>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<link rel="stylesheet" href="/css/topIndex.css">

<div id="section">
	<div id="article">
		<h1>商品一覧</h1>
		<table>
			<c:forEach items="${bookList}" var="book">
				<tr>
					<td>
						<a href="/cart/add?bookId=<c:out value="${book.id}"/>">
						<img src="${pageContext.request.contextPath}/img/add.png"></a>
					</td>
					<td><c:out value="${book.bookName}" /></td>
					<td>&yen;<fmt:formatNumber pattern="#,###" value="${book.price}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
