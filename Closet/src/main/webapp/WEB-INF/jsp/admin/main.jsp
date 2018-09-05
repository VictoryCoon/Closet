<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/jsp/common/javaScripts.jsp"%>
<%@ include file="/WEB-INF/jsp/common/css.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/aSession.jsp"%>
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
	
	$("#adminOut").click(function(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href = "/admin/logOut.do";
		}
	});
});
</script>
<body>
<form name="generalSetting" method="POST">
</form>
<form name="userSetting" method="POST">
</form>
<form name="contractSetting" method="POST">
</form>
<form name="closetSetting" method="POST">
</form>
<div class="adminMain">
	<div class="adminInfo">
		<h1>Informations</h1>
		<ul>
			<li>Company</li>
			<li>Established</li>
			<li>CEO</li>
			<li>BankList</li>
			<li>Certified Informations</li>
			
		</ul>
	</div>
</div>
</body>
</html>
