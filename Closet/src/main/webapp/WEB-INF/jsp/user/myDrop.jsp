<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<%@ include file="/WEB-INF/jsp/common/head.jsp"%>

<script>
$(document).ready(function(){

	$("#dropNow").click(function(){
		
		if($("#deletePw").val() == "") {
			alert("비밀번호를 입력하세요.");
			return;
		}
				
		if($("#deleteCf").val() == "") {
			alert("비밀번호 확인을 입력하세요.");
			return;
		}
		
		if($("#deletePw").val() != $("#deleteCf").val()) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.\n다시 한 번 입력해주시기 바랍니다.");
			$("#deletePw").val("");
			$("#deleteCf").val("");
			return;
		}
		
		
		if($("#deletePw").val() != "<%=sessionPw %>") {
			alert("비밀번호가 맞지 않습니다.\n다시 한 번 입력해주시기 바랍니다.");
			$("#deletePw").val("");
			$("#deleteCf").val("");
			return;
		}
		
		if(confirm("회원탈퇴를 하시겠습니까?")) {
			
			$("#dropPw").val($("#deletePw").val());
			$("#remark").val($("#deleteRs").val());
			
			document.drop.action="/user/userDrop.do";
			document.drop.submit();
		}
		
	});
	
	$("#back").click(function(){
		location.href = "/user/info";
	});

});
</script>
<body>
<form name="drop" method="POST">
	<input type="hidden" id="dropPw"      name="userPw" value=""/>
	<input type="hidden" id="remark"      name="remark" value=""/>
	<input type="hidden" id="sessionUser" name="userId" value="<%=sessionId%>"/>
</form>
<div class="dropUser">
	<h1 class="title">Drop</h1>
	<div class="dropFormat">
	<ul>
		<li><input type="password" id="deletePw" maxlength="16" placeholder="Password"/></li>
		<li><input type="password" id="deleteCf" maxlength="16" placeholder="Password Confirm"/></li>
		<li><input type="text"     id="deleteRs" maxlength="64" placeholder="탈퇴사유 50자 이내"/></li>
	</ul>
	</div>
	<button id="back">Back</button>
	<button id="dropNow">Drop</button>
</div>
</body>
</html>