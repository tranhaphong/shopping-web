<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/define.jsp" %>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
<link rel="stylesheet" href="/css/orderList.css">



<div id="section">
	<div id="article">
		<h1>注文履歴</h1>
		<table>
			<c:forEach items="${orderHeaderList}" var="orderHeader">
				<tr>
					<td>
						<a href="detail?orderHeaderId=<c:out value="${orderHeader.id}"/>" class="btn">詳細</a>
					</td>
					<td><fmt:formatDate value="${orderHeader.orderDatetime}" pattern="yyyy年MM月dd日 HH時mm分ss秒"/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</html>