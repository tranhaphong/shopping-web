<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/jsp/common/define.jsp" %>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
    <link rel="stylesheet" href="/css/cartIndex.css">



<div id="section">
	<div id="article">
		<h1>カート</h1>

		<dl>
			<dt>合計金額</dt>
			<dd>&yen;<fmt:formatNumber pattern="#,###" value="${cartDto.summaryPrice}" /></dd>
		</dl>

		<c:if test="${!empty cartDto.bookList}">
		<p>
			<form action="/order/purchase" method="post">
				<input type="submit" class="btn" value="この内容で注文する">
			</form>
		</p>
		</c:if>

		<table>
			<c:forEach items="${cartDto.bookList}" var="book" varStatus="st">
				<tr>
					<td><c:out value="${book.bookName}" /></td>
					<td>&yen;<fmt:formatNumber pattern="#,###" value="${book.price}" /></td>
					<td><a href="delete?cartIndex=${st.index}"><img src="/img/trash.png"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

</body>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</html>