<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/jsp/common/javaScripts.jsp"%>
<%@ include file="/WEB-INF/jsp/common/css.jsp"%>

<script>
var currentDate ="";	//현재일자 전역변
var message = "${msg}";
$(document).ready(function() {
	if(message != "") {
		alert(message);
		message = "";
	}else {
		message = "";
	}
	
	$("#home").click(function(){
		location.href="adminHome";
	});
	
	/* Js 날짜 포멧 Start */
	var dateSet = new Date();
	var year = dateSet.getFullYear();
	var month = dateSet.getMonth() + 1;
	if(month < 10) {
		month = "0" + month;
	}
	var date = dateSet.getDate();
	if(date < 10) {
		date = "0" + date;
	}
	currentDate = year + "" + month + "" + date;
});
</script>