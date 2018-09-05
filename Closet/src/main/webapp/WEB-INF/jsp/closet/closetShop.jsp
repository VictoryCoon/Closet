<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<script>
$(document).ready(function() {
	$(function(){ //DOM Ready
	    $(".gridster ul").gridster({
	        widget_margins: [10, 10],
	        widget_base_dimensions: [140, 140]
	    });

	});
});
</script>
<body>
<h1>closet/closetShop.jsp 페이지 입니다.(테스트 중)</h1>
<div class="gridster">
	<ul>
		<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
			<span class="gs-resize-handle gs-resize-handle-both"></span>
		</li>
		<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
			<span class="gs-resize-handle gs-resize-handle-both"></span>
		</li>
		<li data-row="3" data-col="1" data-sizex="1" data-sizey="1">보</li>

		<li data-row="1" data-col="2" data-sizex="2" data-sizey="1">입</li>
		<li data-row="2" data-col="2" data-sizex="2" data-sizey="2">
			<span class="gs-resize-handle gs-resize-handle-both"></span>
		</li>
		<li data-row="1" data-col="4" data-sizex="1" data-sizey="1">까</li>
		<li data-row="2" data-col="4" data-sizex="2" data-sizey="1"></li>
		<li data-row="3" data-col="4" data-sizex="1" data-sizey="1"></li>

		<li data-row="1" data-col="5" data-sizex="1" data-sizey="1"></li>
		<li data-row="3" data-col="5" data-sizex="1" data-sizey="1"></li>

		<li data-row="1" data-col="6" data-sizex="1" data-sizey="1"></li>
		<li data-row="2" data-col="6" data-sizex="1" data-sizey="2">
			<span class="gs-resize-handle gs-resize-handle-both"></span>
		</li>
	</ul>
</div>
<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>