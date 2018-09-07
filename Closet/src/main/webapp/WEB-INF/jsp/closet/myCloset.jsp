<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<%
	String conPath = request.getContextPath();
	System.out.print(conPath);
%>
<script>
$(document).ready(function() {
	$(function(){
	    $(".gridster ul").gridster({
	        widget_margins: [8, 8],
	        widget_base_dimensions: [140, 140],
	    	resize : {
	    		enabled : true,
	    		max_size: [4, 4],
	    		min_size: [1, 1]
	    	}
	    });

	});
});
</script>
<body>
<div class="title">
	<h1>MyCloset</h1>
	<button>Boarding</button>
</div>
<!-- <div class="closet">
	<div class="closetView" id="closet">
		ClosetImageView
	</div>
	<div class="closetOption" id="option">
		<ul>
			<li>Name : </li>
			<li>Brand : </li>
			<li>Capacity : </li>
			<li>Used : </li>
			<li>Rest : </li>
		</ul>
	</div>
</div>
<div class="items">
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
<div class="mannequin">
	<div class="mannequinView" id="mannequin">
		mannequin
	</div>
</div> -->
<div class="gridster">
	<ul>
		<li data-row="1" data-col="1" data-sizex="4" data-sizey="2">
			<span class="gs-resize-handle gs-resize-handle-both"></span>
		</li>
		<li data-row="1" data-col="1" data-sizex="2" data-sizey="4">
			<span class="gs-resize-handle gs-resize-handle-both"></span>
		</li>
		<li data-row="1" data-col="1" data-sizex="2" data-sizey="4">
			<span class="gs-resize-handle gs-resize-handle-both"></span>
		</li>
		<li data-row="1" data-col="1" data-sizex="4" data-sizey="2">
			<span class="gs-resize-handle gs-resize-handle-both"></span>
		</li>
	</ul>
</div>
<div class="box">
	<form action="/file/upload.do" method="POST" enctype="multipart/form-data" class="fileSet">
		<input type="file" id="uploadFile1" name="uploadFile"/>
		<input type="hidden" name="category" value="outer"/>
		<button type="submit">Upload</button>
		<button type="reset">Cancel</button>
	</form>
	<div class="closetBox">
		<div class="boxList" id="outer">
			<span>Outer</span>
			<ul>
				<li>item1</li>
				<li>item2</li>
				<li>item3</li>
				<li>item1</li>
				<li>item2</li>
				<li>item3</li>
				<li>item1</li>
				<li>item2</li>
				<li>item3</li>
				<li>item1</li>
				<li>item2</li>
				<li>item3</li>
			</ul>
		</div>
	</div>
</div>
<div class="box">
	<form action="/file/upload.do" method="POST" enctype="multipart/form-data" class="fileSet">
		<input type="file" id="uploadFile2" name="uploadFile"/>
		<input type="hidden" name="category" value="top"/>
		<button type="submit">Upload</button>
		<button type="reset">Cancel</button>
	</form>
	<div class="closetBox">
		<div class="boxList" id="top">
			<span>Top</span>
			<ul>
				<li>item1</li>
				<li>item2</li>
				<li>item3</li>
			</ul>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>
