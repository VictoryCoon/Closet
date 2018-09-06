<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>
<%@ include file="/WEB-INF/jsp/common/javaScripts.jsp"%>
<%@ include file="/WEB-INF/jsp/common/css.jsp"%>
<script>
var message = "${msg}";
$(document).ready(function() {
	
	if(message != "") {
		alert(message);
	}else {
		message = "";
	}
	
	$("#adminId, #adminPw").keyup(function(event){
	    if(event.keyCode == 13){
	        $("#enterAdmin").click();
	    }
	});
	
	$("#enterAdmin").click(function() {
		var adminId = $("#adminId").val();
		var adminPw = $("#adminPw").val();
		
		if(adminId == "" || adminId == null){
			alert("ID를 입력하세요.");
			$("#adminId").focus();
			return;
		}
		
		if(adminPw == "" || adminPw == null){
			alert("비밀번호를 입력하세요.");
			$("#adminPw").focus();
			return;
		}
		
		var postData = {
			'adminId' : adminId,
			'adminPw' : adminPw,
		};
		/* 접속 : 관리자 */	
		$.ajax({
			url:'/admin/adminLogin.do',
			type:'POST',
			data:postData,
			contentType:"application/x-www-form-urlencoded;charsset=UTF-8",
			dataType:'json',
			success:function(rsp) {
				$.each(rsp, function(k,v) {	// key, value : 현재호출방식에서는 key 값이 전부 null(undefined)이다. value.attribute만 호출하면 된다.
					console.log(v.cnt);
					if(v.cnt != "0") {
						$("#access").val("Y");
						document.adminAccess.action ="adminAccess.do";	// 그냥 접근하면 에러나게함.
						document.adminAccess.submit();
					} else {
						$("#access").val("N");
						alert("아이디와 비밀번호를 확인해 주세요.");
					}
				});
				
			},
			error:function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Ajax Error : Check parameters or statements Of Ajax Elements in the Inspector log.");
				//console.log("ParamData" + postData);
				return;
			}
		});
	});
});
</script>
<body>
<form name="adminAccess" method="POST">
	<input type="hidden" id="access" name="access"/>
</form>
<div class="adminEnter">
	<div class="enter">
		<h1>Administrator Log - In</h1>
		<form name="adminLogin" method="POST">
			<ul>
				<li><input type="text" id="adminId" name="userId" maxlength="16" placeholder="ID"/></li>
				<li><input type="password" id="adminPw" name="userPw" maxlength="16" placeholder="Password"/></li>
			</ul>
		</form>
		<button id="enterAdmin">Enter</button>
	</div>
</div>
</body>
</html>
