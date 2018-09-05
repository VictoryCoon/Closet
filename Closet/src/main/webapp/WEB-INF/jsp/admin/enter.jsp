<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>
<%@ include file="/WEB-INF/jsp/common/javaScripts.jsp"%>
<%@ include file="/WEB-INF/jsp/common/css.jsp"%>
<script>
	$(document).ready(function() {
		/* 접속 : 회원 */
		$("#enterAdmin").click(function() {
			if($("#adminId").val() == "" || $("#adminId").val() == null){
				alert("ID를 입력하세요.");
				$("#adminId").focus();
				return;
			}
			
			if($("#adminPw").val() == "" || $("#adminPw").val() == null){
				alert("비밀번호를 입력하세요.");
				$("#adminPw").focus();
				return;
			}
			document.adminLogin.action = "/admin/logIn.do"
			document.adminLogin.submit();
		});
	});
</script>
<body>
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
