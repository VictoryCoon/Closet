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
	<p>Q & A</p>
</div>

<!-- Left메뉴는 따로 편집. -->
<%@ include file="/WEB-INF/jsp/custom/customLeft.jsp"%>

<div class="listFrame">
	<ul class="bBanner">
		<li>Writer</li><!-- 작성자명/성별 -->
		<li>Category</li>
		<li>Title</li>
		<li>Time</li>
		<li>Hit</li>
	</ul>
	<c:forEach items="${list}" var="dto">
		<ul class="bContent">
			<li>${dto.userName}</li><!-- 작성자명/성별 -->
			<li>${dto.boardTitle}</li>
			<li>${dto.boardContent}</li>
			<li>Time</li>
			<li>Hit</li>
		</ul>
	</c:forEach>
</div>
<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>
