<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<body>
<div class="itemFrame">
	<div class="itemList" id="itemList">
		<ul>
			<li>Outer</li>
			<li>Top</li>
			<li>innerTop</li>
			<li>Bottom</li>
			<li>innerBottom</li>
			<li>Shoes</li>
			<li>AccBelt</li>
			<li>AccHead</li>
			<li>AccFinger</li>
			<li>AccWristlet</li>
			<li>Piercing</li>
		</ul>
	</div>
</div>
<div class="boardFrame">
	<div class="closetView">
		<!-- .html()메소드로 객체 호출. -->
		ClosetImageView
	</div>
	<div class="liking">
		<span class="clover"></span>
		<span class="cloverPoint" id="cCount">0</span>
		<span class="flover"></span>
		<span class="floverPoint" id="fCount">0</span>
	</div>
	<div class="closetInfo">
		<ul class="userInfo">
			<li id="userPhoto" style="background:url('/file/img/ssu.png') no-repeat 50%;background-size:100%;"></li>
			<li id="regDate">2018-MM-DD(Mon), 24:mm:ss</li>
			<li id="userName">작성자</li>
			<li id="boardTitle">제목</li>
		</ul>
	</div>
	<div class="boardLayer">
		
	</div>
</div>
<div class="contentFrame">
	<div class="descView">
		Descriptions.
	</div>
</div>

<%-- <div class="listFrame">
	<ul class="bBanner">
		<li>Writer</li><!-- 작성자명/성별 -->
		<li>Category</li>
		<li><%= request.getRequestURI() %></li>
		<li>Time</li>
		<li>Hit</li>
	</ul>
	<c:forEach items="${list}" var="dto">
		<ul class="bContent">
			<li>${dto.userId}</li>
			<li>${dto.userName}</li><!-- 작성자명/성별 -->			마이바티스 샘플 소스 
			<li>${dto.boardTitle}</li>
			<li>${dto.boardContent}</li>
			<li>${dto.closetCd}</li>
		</ul><br/>
	</c:forEach>
</div>
<form action="write" method="POST">
	제목 : <input type="text" id="title" name="title"/><br/>
	내용 : <input type="text" id="content" name="content"/>
	<input type="submit" value="shot"/>
</form> --%>
<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>
