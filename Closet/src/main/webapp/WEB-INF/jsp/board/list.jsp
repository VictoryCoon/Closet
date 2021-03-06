<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<script>
var clickCount = 1;
$(document).ready(function(){
	$("#viewDesc").click(function(){
		$(".detailFrame").fadeIn();
		
	});
	$("#closeDesc").click(function(){
		$(".detailFrame").fadeOut();
		
	});
	
	$("#viewDesc").click(function(){
		var elements = $("#viewItem, #viewCloset, #viewDesc");
		console.log(clickCount);
		if(clickCount == 1){
			elements.animate({
				width:'-=50px'
			});
			clickCount = 0;
		}else if(clickCount == 0) {
			elements.animate({
				width:'+=50px'
			});
			clickCount = 1;
		}

	})
});
</script>
<body>
<div class="itemFrame" id="viewItem">
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
<div class="boardFrame" id="viewCloset">
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
	<div class="descView" id="viewDesc">
		Descriptions.
	</div>
</div>
<!-- <div class="detailFrame">
	<span class="closeDetail" id="closeDesc"></span>
	<div class="detailWidth">
		<div class="dtlContent1" id="detailItem">
		
		</div>
		<div class="dtlContent2" id="detailBoard">
		
		</div>
		<div class="dtlContent3" id="detailDesc">
		
		</div>
		<div class="boardRpy" id="boardRpy">
		
		</div>
	</div>
</div> -->
<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>
