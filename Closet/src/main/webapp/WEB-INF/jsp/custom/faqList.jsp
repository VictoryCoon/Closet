<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div class="serviceTitle">
	<h1>Customer Service</h1>
	<p>F & Q</p>
</div>

<!-- Left메뉴는 따로 편집. -->
<%@ include file="/WEB-INF/jsp/custom/customLeft.jsp"%>

<div class="listFrame">
	<ul class="bBanner">
		<li>질문</li><!-- 작성자명/성별 -->
		<li>답변</li>
	</ul>
	<ul class="bContent">
		<li><span>▼</span></li>
		<li>
			<p>왜 그렇게 생기셨나요?</p>
		</li>
		<li>
			<p>교회다녀서요.</p>
		</li>
	</ul>
	<ul class="bContent">
		<li><span>▼</span></li>
		<li>
			<p>왜 그렇게 생기셨나요?</p>
		</li>
		<li>
			<p>교회다녀서요.</p>
		</li>
	</ul>
<%-- 	<c:forEach items="${list}" var="dto">
		<ul class="bContent">
			<li>${dto.userName}</li><!-- 작성자명/성별 -->
			<li>${dto.boardTitle}</li>
		</ul>
	</c:forEach> --%>
</div>
<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>
