<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/jsp/common/javaScripts.jsp"%>
<%@ include file="/WEB-INF/jsp/common/css.jsp"%>
<%@ include file="/WEB-INF/jsp/sign/session.jsp"%>
<script>
var currentDate ="";	//현재일자 전역변
var message = "${msg}";
$(document).ready(function(){
	
	if(message != "") {
		alert(message);
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
	/* Js 날짜 포멧 E N D */
	
	$("#logo").click(function(){
		location.href = "/";
	});
	
	$("#about").click(function(){
		location.href = "/about";
	});
	
	$("#board").click(function(){
		location.href = "/board/list";
	});
	
	$("#cService").click(function(){
		location.href = "/custom/faqList";
	});
	
	$("#closet").click(function(){
		location.href = "/board/list";
	});
	
	$("#myCloset").click(function(){
		location.href = "/closet/myCloset";
	});
	
	$("#myInfo").click(function(){
		location.href = "/user/info";
	});

	$("#sign_up").click(function(){
		//openSignUp();
		openPolicy();
	});
	
	$("#sign_in").click(function(){
		openSignIn();
	});
	
	$("#contract").click(function(){
		openContract();
	});
	
	$("#log_in").click(function(){
		openLogIn();
	});
	
	$("#certifyMobile").click(function(){
		alert("Certify Test N->Y");
		$("#certifyYn").val("Y");
		$("#certifyMobile").hide();
		$("#certifiedMobile").fadeIn();
		return;
	});

	/* 가입정보 제출 트리거 : enter */
	$("#joinId, #joinPw, #joinPc, #joinName, #birthYear, #birthMonth, #birthDate, #birthKind, #mobile1, #mobile2, #mobile3").keyup(function(event){
	    if(event.keyCode == 13){
	        $("#submitInfo").click();
	    }
	});
	
	/* 가입정보 제출 */
	$("#submitInfo").click(function(){
		signUp();
	});

	/* 접속 트리거 : enter */
	$("#userPw, #userId").keyup(function(event){
	    if(event.keyCode == 13){
	        $("#signInSubmit").click();
	    }
	});
	
	/* 접속 : 회원 */
	$("#signInSubmit").click(function() {
		if($("#userId").val() == "" || $("#userId").val() == null){
			alert("ID를 입력하세요.");
			$("#userId").focus();
			return;
		}
		
		if($("#userPw").val() == "" || $("#userPw").val() == null){
			alert("비밀번호를 입력하세요.");
			$("#userPw").focus();
			return;
		}
		document.signIn.action = "/user/signIn.do"
		document.signIn.submit();
	});
	
	$("#logInSubmit").click(function() {
		if($("#conId").val() == "" || $("#conId").val() == null){
			alert("ID(사업자등록번호)를 입력하세요.");
			$("#conId").focus();
			return;
		}
		
		if($("#conPw").val() == "" || $("#conPw").val() == null){
			alert("비밀번호를 입력하세요.");
			$("#conPw").focus();
			return;
		}
		document.logIn.action = "/user/logIn.do"
		document.logIn.submit();
	});
	
	$("#sign_out").click(function(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href = "/user/signOut.do";
		}
	});
});

</script>
<html>
<head>
<title>MyCloset</title>
<link rel="shorcut icon" type="image/x-icon" href="/favicon.ico"/>
</head>
<%@ include file="/WEB-INF/jsp/sign/sign.jsp"%>
<div class="banner">
	<div class="limitWidth">
		<ul>
			<li class="logo" id="logo"></li>
			<li class="board" id="board"></li>
			<li class="cService" id="cService"></li>
			<% if(request.getRequestURI().indexOf("/board/") != -1) { %>
			<li class="searchForm" id="searchForm">
				<form name="search" method="POST">
					<input type="text"/>
					<select>
						<option value="">All</option>
					</select>
					<input type="submit" value="Search"/>
				</form>
			</li>
			<% 
				}  else { } 
			%>
			<li class="userStatus">	<!-- 코어라이브러리로 세션여부 부여 -->
			<% if(sessionYn == "Y") { %>
				<div id="statusLogin" class="statusLogin" style="display:blcok;">
					<span class="sign_out" id="sign_out"></span>
					<span class="myInfo" id="myInfo"></span>
					<span class="closet" id="myCloset"></span>
				</div>
			<% } else if(sessionYn == "N") { %>
				<div id="statusLogout" class= "statusLogout" style="display:blcok;">
					<span class="sign_in" id="sign_in"></span>
					<span class="log_in" id="log_in"></span>
					<span class="sign_up" id="sign_up"></span>
					<span class="contract" id="contract"></span>
				</div>
			<% } %>
			</li>
		</ul>
	</div>
</div>
<div class="menu">
	<div class="limitWidth">
		<ul>
		</ul>
	</div>
</div>