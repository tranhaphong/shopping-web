<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/define.jsp"%>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="/css/passwordChangeInput.css">


<div id="section">
	<form:form modelAttribute="passwordChangeForm" action="update">
	<div id="article">
		<form:errors path="passwordSame"/>
		<dl>
			<dt><spring:message code="passwordChangeForm.password1"/></dt>
			<dd>
				<form:errors path="password1" element="p" cssClass="error"/>
				<input type="text" name="password1">
			</dd>
			<dt><spring:message code="passwordChangeForm.password2"/></dt>
			<dd>
				<form:errors path="password2" element="p" cssClass="error"/>
				<input type="text" name="password2">
			</dd>
		</dl>
		<input type="submit" value="更新" class="btn">
	</div>
	</form:form>
</div>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
