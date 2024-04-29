<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="/css/orderDetail.css">

<div id="section">
	<div id="article">
		<h1>注文履歴詳細</h1>
		<dl>
			<dt>注文日時</dt>
			<dd><fmt:formatDate value="${orderHeader.orderDatetime}" pattern="yyyy年MM月dd日 HH時mm分ss秒"/></dd>
		</dl>
		<table>
			<c:forEach items="${orderDetailList}" var="orderDetail">
				<tr>
					<td><c:out value="${orderDetail.bookName}"/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
