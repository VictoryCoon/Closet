<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Calendar" %>
<script>

/* 정책사항 */
function openPolicy() {
	$(".policy").fadeIn();
	$("#signFrame").fadeIn();
}
function closePolicy() {
 	$("input[id=item1]").attr("checked",false);
	$("input[id=item2]").attr("checked",false);
	$("input[id=item3]").attr("checked",false);
	
	$(".policy").fadeOut();
	$("#signFrame").fadeOut();
}

function disAgree() {
 	$("input[id=item1]").attr("checked",false);
	$("input[id=item2]").attr("checked",false);
	$("input[id=item3]").attr("checked",false);
	
	$(".policy").fadeOut();
	$("#signFrame").fadeOut();
}

function agree() {
	
	if($("input[id='item1']").is(":checked") == false) {
		alert($("#term1").text()+"에 동의하지 않았습니다.");
		return;
	}
	
	if($("input[id='item3']").is(":checked") == false) {
		alert($("#term2").text()+"에 동의하지 않았습니다.");
		return;
	}
	
	if($("input[id='item3']").is(":checked") == false) {
		alert($("#term3").text()+"에 동의하지 않았습니다.");
		return;
	}
	
	if(confirm("위 사항에 모두 동의하십니까?")){
		$(".policy").hide();
		$(".signUp").fadeIn();
	}
}

/* 가입창 내리기 */
function closeSignUp() {
	$("#joinId").val("");
	$("#joinPw").val("");
	$("#joinPc").val("");
	$("#joinName").val("");
	$("#birthYear").val(""); 
	$("#birthMonth").val("");
	$("#birthDate").val("");
	$("#birthKind").val("");
	$("#mobile1").val("");
	$("#mobile2").val("");
	$("#mobile3").val("");
	$("#certifyYN").val("N");
	
	$(".signUp").fadeOut();
	$("#signFrame").fadeOut();
}

function closeSignIn() {
	$(".signIn").fadeOut();
	$("#signFrame").fadeOut();
}

function closeLogIn() {
	$(".logIn").fadeOut();
	$("#signFrame").fadeOut();
}

function openContract() {
	$(".contract").fadeIn();
	$("#signFrame").fadeIn();
}

function closeContract() {
	$("#comRegId").val("");
	$("#comRegPw").val("");
	$("#comRegPc").val("");
	
	$(".contract").fadeOut();
	$("#signFrame").fadeOut();
}

function openSignIn() {
	$(".signIn").fadeIn();
	$("#signFrame").fadeIn();	
}

function openLogIn() {
	$(".logIn").fadeIn();
	$("#signFrame").fadeIn();	
}

/* ID 중복확인 */
function userIdChk() {
	var chkId = $("#joinId").val();
	var postData = {
		'userId' : chkId
	};
	
	if(chkId == "" || chkId == null){
		alert("ID를 입력하세요.");
		$("#joinId").focus();
		return;
	}
	
	if(chkId.length < 8 || chkId.length > 16) {		// 정규식 넣어야함.
		alert("ID는 영문 또는 영문 + 숫자로 8~16글자 입니다.");
		return;
	}
	
	$.ajax({
		url:'/user/userIdChk.json',
		type:'POST',
		data:postData,
		contentType:"application/x-www-form-urlencoded;charsset=UTF-8",
		dataType:'json',
		success:function(rsp) {
			$.each(rsp, function(k,v) {	// key, value : 현재호출방식에서는 key 값이 전부 null(undefined)이다. value.attribute만 호출하면 된다.
				console.log(v.cnt);
				if(v.cnt != "0") {
					alert("이미 존재하는 ID입니다.");
				} else {
					alert("사용이 가능한 ID입니다!");
					$("#joinId").attr("readonly", true);
					$("#joinId").css({'background-color':'#CCCCCC'});
					$("#idChkYn").val("Y");
				}
			});
			
		},
		error:function(XMLHttpRequest, textStatus, errorThrown) {
			alert("Ajax Error : Check parameters or statements Of Ajax Elements in the Inspector log.");
			console.log("ParamData : " + postData);
			console.log("XMLHttpRequest : " + XMLHttpRequest);
			console.log("textStatus : " + textStatus);
			console.log("errorThrown : " + errorThrown);
			return;
		}
	});
}

/* 가입 */
function signUp() {
	
	var userId = $("#joinId").val();
	var userPw = $("#joinPw").val();
	var userPc = $("#joinPc").val();
	var userName = $("#joinName").val();
	var birthday = /* Format : year + month + day = YYYYMMDD */
		$("#birthYear option:selected").val() +
		$("#birthMonth option:selected").val() +
		$("#birthDate option:selected").val();
	var birthKind = $("#birthKind option:selected").val();
	var mobile = /* Format : CCCNNNNMMMM */
		$("#mobile1").val() +
		$("#mobile2").val() +
		$("#mobile3").val();
	var certifyYn = $("#certifyYn").val();
	
	if(userId == "" || userId == null){
		alert("ID를 입력하세요.");
		$("#joinId").focus();
		return;
	}
	
	if($("#idChkYn").val() == "N") {
		alert("ID중복 여부를 확인해주세요.");
		// 버튼 포커싱은 안하려고. . .
		return;
	}
	
	if(userPw == "" || userPw == null){
		alert("비밀번호를 입력하세요.");
		$("#joinPw").focus();
		return;
	}
	
	if(userPw.length < 8 || userPw.length > 16) {
		alert("비밀번호는 특수문자를 포함한 영문, 숫자 8 ~ 16자리로 입력해 주세요.");
		$("#joinPw").focus();
		return;
	} else {
		var stringRegx = /[~!@\#$%<>^&*\()\-=+_\’]/gi;	// 특수문자 관련 Js 정규식
	    var isValid = true; 

		if(stringRegx.test(userPw)) {
			isValid = false; 
		}

		if(isValid == true){
			alert('특수문자를 포함하여 입력해 주세요.');
			$("#joinPw").focus();
			return;
		}
	}

	if(userPc == "" || userPc == null){
		alert("비밀번호확인을 입력하세요.");
		$("#joinPc").focus();
		return;
	}
	
	if(userPw != userPc){
		alert("비밀번호와 비밀번호확인이 일치하지 않습니다.\n다시한번 입력해 주세요.");
		$("#userPw").val("");
		$("#userPc").val("");
		return;
	}
	
	if(userName == "" || userName == null){
		alert("이름을 입력하세요.");
		$("#joinName").focus();
		return;
	}
	
	if($("#birthYear").val() == "" || $("#birthYear").val() == null){
		alert("생년월일 중 연도를 선택하세요.");
		$("#birthYear").focus();
		return;
	}	
	
	if($("#birthMonth").val() == "" || $("#birthMonth").val() == null){
		alert("생년월일 중 월자를 선택하세요.");
		$("#birthMonth").focus();
		return;
	}
	
	if($("#birthDate").val() == "" || $("#birthDate").val() == null){
		alert("생년월일 중 일자를 선택하세요.");
		$("#birthDate").focus();
		return;
	}
	
	if($("#birthKind").val() == "" || $("#birthKind").val() == null){
		alert("양음력 구분을 선택하세요.");
		$("#birthKind").focus();
		return;
	}
	
	if($("#mobile1").val() == "" || $("#mobile1").val() == null){
		alert("휴대폰번호 앞자리를 입력하세요.");
		$("#mobile1").focus();
		return;
	}
	
	if($("#mobile2").val() == "" || $("#mobile2").val() == null){
		alert("휴대폰번호 중간자리를 입력하세요.");
		$("#mobile2").focus();
		return;
	}
	
	if($("#mobile3").val() == "" || $("#mobile3").val() == null){
		alert("휴대폰번호 뒷자리를 입력하세요.");
		$("#mobile3").focus();
		return;
	}
	
	if(certifyYn != "Y"){
		alert("휴대폰번호 인증을 진행하세요.");
		$("#certifyMobile").focus();
		return;
	}
	
	if(confirm("입력된 내용을 제출하시겠습니까?")){
		
		$("#signParam1").val(userId);
		$("#signParam2").val(userPw);
		$("#signParam3").val(userName);
		$("#signParam4").val("U");	// USER_KIND
		$("#signParam5").val(birthday);
		$("#signParam6").val(birthKind);
		$("#signParam7").val(currentDate);	// REG_DATE
		$("#signParam8").val("");	// SOCIAL_NO
		$("#signParam9").val(mobile);

		document.signUp.action = "/user/signUp.do"
		document.signUp.submit();
		
	}
}
</script>
<form name="signUp" method="POST">
	<input type="hidden" id="signParam1" name="userId"/>
	<input type="hidden" id="signParam2" name="userPw"/>
	<input type="hidden" id="signParam3" name="userName"/>
	<input type="hidden" id="signParam4" name="userKind"/>
	<input type="hidden" id="signParam5" name="birthday"/>
	<input type="hidden" id="signParam6" name="birthKind"/>
	<input type="hidden" id="signParam7" name="regDate"/>
	<input type="hidden" id="signParam8" name="socialNo"/>
	<input type="hidden" id="signParam9" name="mobile"/>
</form>
<form name="contract" method="POST">
	<input type="hidden" id="contParam1" name="userId"/>
	<input type="hidden" id="contParam2" name="userPw"/>
	<input type="hidden" id="contParam3" name="userName"/>
	<input type="hidden" id="contParam4" name="userKind"/>
	<input type="hidden" id="contParam5" name="regDate"/>
	<input type="hidden" id="contParam6" name="socialNo"/>
	<input type="hidden" id="contParam7" name="mobile"/>
</form>
<section class="signFrame" id="signFrame" style="display:none;">
	<div class="policy" style="display:none;">
		<span class="closeBox" onclick="javascript:closePolicy();"></span>
		<div class="items">
			<h1>1. <span id="term1">Terms A</span></h1>
			<textarea id="termA" style="resize:none;"></textarea>
			<input type="checkbox" id="item1"name="item1"/><span>상기 명시된 내용에 동의합니다.</span>
		</div>
		<div class="items">
			<h1>2. <span id="term2">Terms B</span></h1>
			<textarea id="termB" style="resize:none;"></textarea>
			<input type="checkbox" id="item2"name="item2"/><span>상기 명시된 내용에 동의합니다.</span>
		</div>
		<div class="items">
			<h1>3. <span id="term3">Terms C</span></h1>
			<textarea id="termC" style="resize:none;"></textarea>
			<input type="checkbox" id="item3"name="item3"/><span>상기 명시된 내용에 동의합니다.</span>
		</div>
		<div class="btns">
			<button id="disagree" onclick="javascript:disAgree();">Disagree</button>
			&nbsp;
			<button id="agree" onclick="javascript:agree();">Agree</button>
		</div>
	</div>
	<div class="signUp" style="display:none;">
		<span class="closeBox" onclick="javascript:closeSignUp();"></span>
		<h1>Sign - Up</h1>
		<div class="format">
			<input type="text" id="joinId" name="userId" maxlength="16" placeholder="ID"/><button onclick="javascript:userIdChk();">Check</button>
			<input type="hidden" id="idChkYn" name="idChkYn" value="N">
			<input type="password" id="joinPw" name="userPw" maxlength="16" placeholder="Password"/>
			<input type="password" id="joinPc" name="userPc" maxlength="16" placeholder="Confirm Password"/>
			<input type="text" id="joinName" name="userName" maxlength="20" placeholder="Name"/>
			<br/>
				<%-- <%
					Calendar Cl = Calendar.getInstance();
					int years = Cl.get(Calendar.YEAR);
					int months = Cl.get(Calendar.MONTH);
				%>
				<p><%=years %></p>
				<p><%=months %></p> --%> 
			<select id="birthYear">
				<option value="">Year</option>
				<option value="2018">2018</option>
				<option value="2017">2017</option>
				<option value="2016">2016</option>
				<option value="2015">2015</option>
				<option value="2014">2014</option>
				<option value="2013">2013</option>
				<option value="2012">2012</option>
				<option value="2011">2011</option>
				<option value="2010">2010</option>
				<option value="2009">2009</option>
				<option value="2008">2008</option>
				<option value="2007">2007</option>
			</select>
			<!-- 나중에 For 문으로 처리하자... -->
			<select id="birthMonth">
				<option value="">Month</option>
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<select id="birthDate">
				<option value="">Day</option>
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
			</select>
			<select id="birthKind">
				<option value="">S/L</option>
				<option value="S">S/C</option>	<!-- 양력 : Solar Calendar -->
				<option value="L">L/C</option>	<!-- 음력 : Lunar Calendar -->
			</select>
			<br/>
			<div class="mobileDiv">
				<input type="text" id="mobile1" name="mobile1" maxlength="3" placeholder="＊＊＊" class="mobile1"/><span> - </span>
				<input type="text" id="mobile2" name="mobile2" maxlength="4" placeholder="＊＊＊＊" class="mobile2"/><span> - </span>
				<input type="text" id="mobile3" name="mobile3" maxlength="4" placeholder="＊＊＊＊" class="mobile3"/>
				<button id="certifyMobile"   class="certify">Certify</button><!-- 왜 지멋대로 submit??? -->
				<button id="certifiedMobile" class="certified" style="display:none;" disabled>Certified</button>
			</div>
			<input type="button" class="signUpSubmit" value="Sign Up" id="submitInfo"/>
		</div>
		<input type="hidden" id="certifyYn" value="N"/>
	</div>
	<div class="signIn" style="display:none;"><!-- 회원용가입 -->
		<span class="closeBox" onclick="javascript:closeSignIn();"></span>
		<h1>Sign - In</h1>
		<form name="signIn" method="POST">
			<input type="text" id="userId" name="userId" maxlength="16" placeholder="ID"/>
			<input type="password" id="userPw" name="userPw" maxlength="16" placeholder="Password"/>
			<input type="button" id="signInSubmit" class="signInSubmit" value="Sign - In"/>
		</form>
	</div>
	<div class="logIn" style="display:none;"><!-- 기업용가입 -->
		<span class="closeBox" onclick="javascript:closeLogIn();"></span>
		<h1>Contractor Log - In</h1>
		<form name="LogIn" method="POST">
			<input type="text" id="conId" name="userId" maxlength="16" placeholder="ID(또는 사업자등록번호)"/><!-- 사업자등록번호 로그인도 가능하도록 -->
			<input type="password" id="conPw" name="userPw" maxlength="16" placeholder="Password"/>
			<input type="button" id="logInSubmit" class="signInSubmit" value="Log - In"/>
		</form>
	</div>
</section>