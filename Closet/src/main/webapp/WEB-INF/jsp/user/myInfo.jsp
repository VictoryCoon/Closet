<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<%@ include file="/WEB-INF/jsp/common/head.jsp"%>

<script>
$(document).ready(function(){
	var sessionPw = "<%=sessionPw%>";
	var profile = "<%=sessionProfilePhoto %>";
	$("#photoArea").css({'background':'url(' + profile + ') no-repeat 50%','background-size':'100%'});
	
	$("#passwordChange").click(function(){

		if($("#changePw").val() != "" || $("#changePw").val() != "") {
			if($("#changePw").val() == $("#confirmPw").val()) {
				$("#cgPw").val($("#changePw").val());
			} else {
				alert("변경 비밀번호 확인이 일치하지 않습니다.");
				return;
			}
		} else {
			alert("변경된 내용이 없습니다.");
			return;
		}
		
		document.updatePassword.action="/user/updatePassword.do";
		document.updatePassword.submit();
	});
	$("#mobileChange").click(function(){
		
		// 휴대폰 인증관련 크로스 스크립트 공격 관련 보호처리, Trigger 함수 보완.
		if($("#cgMobile1").val() == "") {
			alert("휴대폰번호 앞자리를 입력하세요.");
			return;
		}
		
		if($("#cgMobile2").val() == "") {
			alert("휴대폰번호 중간자리를 입력하세요.");
			return;
		}
		
		if($("#cgMobile3").val() == "") {
			alert("휴대폰번호 뒷자리를 입력하세요.");
			return;
		}
		
		if($("#certifyYn").val() != "N") {	// "N" : TEST
			alert("휴대폰 인증을 먼저 진행하세요.");
			return;
		} else {
			if(confirm("휴대폰번호를 변경하시겠습니까?")) {
				var mobile = $("#cgMobile1").val() + $("#cgMobile2").val() + $("#cgMobile3").val();
				$("#cgMobile").val(mobile);
				
				document.updateMobile.action="/user/updateMobile.do";
				document.updateMobile.submit();
			}
		}
	});
	
	$("#mobileCertify").click(function(){
		
		/* 휴대폰 인증관련 로직 추가 */
		
		$("#mobileCertify").hide();
		$("#mobileChange").fadeIn();

	});
	
	$("#enrollSex").click(function(){
		var selected = $("input[name='selectSex']:checked").val();
		if(selected != "M" && selected != "F") {
			alert("성별을 선택해주세요.");
			return;
		}
		
		if(confirm("성별을 등록하시겠습니까?\n한 번 등록된 성별은 변경하실 수 없습니다.")) {
			$("#cgSex").val(selected);
		
			document.updateSex.action="/user/updateSex.do";
			document.updateSex.submit();
		}
	});
	
	$("#showPrivate").keyup(function(event){
	    if(event.keyCode == 13){
	        $("#viewPhysical").click();
	    }
	});
	
	$("#viewPhysical").click(function(){
		if($("#showPrivate").val() != sessionPw) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#showPrivate").val("");
			$("#showPrivate").focus();
			return;
		} else {
			$("#showPrivate").hide();
			$("#viewPhysical").text("Viewing");
			$("#viewPhysical").attr("disabled", true);
			$("#privateInfo").fadeIn(2000);
			$("body").stop().animate({
				scrollTop : $(document).height()
			},1500);
		}
	});

	$("#sizeLength, #sizeWeight, #sizeHead, #sizeNeck, #sizeShoulder, #sizeWaist, #sizeThigh, #sizeFoot, #sizeFinger").click(function(){
		if(confirm("입력하신 사이즈를 등록하시겠습니까?")) {
 			$("#cgLength").val(("#userLength").val());
			$("#cgWeight").val(("#userWeight").val());
			$("#cgHead").val(("#userHead").val());
			$("#cgNeck").val(("#userNeck").val());
			$("#cgShoulder").val(("#userShoulder").val());
			$("#cgWaist").val(("#userWaist").val());
			$("#cgThigh").val(("#userThigh").val());
			$("#cgFoot").val(("#userFoot").val());
			$("#cgFinger").val(("#userFinger").val());
			
			document.updateSize.action = "/user/updateSize.do";
			document.updateSize.submit();
			
		}
	});

	$("#goDrop").click(function(){
		location.href="/user/drop";
	});
	
	$("#goCharge").click(function(){
		location.href="/cash/charge";
	});
	
	$("#goChangeCloset").click(function(){
		location.href="/closet/closetShop";
	});
});

function profileWindow() {
	$("#profilePhoto").click();
}

function profileUpload(value) {
	alert("파일경로 : " + value);
}

</script>
<body>
<!-- 비밀번호 변경 ParameterSet -->
<form name="updatePassword" method="POST">
	<input type="hidden" id="cgPw" name="userPw" value=""/>
	<input type="hidden" name="userId" value="<%=sessionId%>"/>
</form>

<!-- 휴대폰번호 변경 ParameterSet -->
<form name="updateMobile" method="POST">
	<input type="hidden" id="cgMobile" name="mobile" value=""/>
	<input type="hidden" name="userId" value="<%=sessionId%>"/>
</form>

<!-- 성별확정 ParameterSet -->
<form name="updateSex" method="POST">
	<input type="hidden" id="cgSex" name="sex" value=""/>
	<input type="hidden" name="userId" value="<%=sessionId%>"/>
</form>

<!-- 신체치수 등록/변경 ParameterSet -->
<form name="updateSize" method="POST">
	<input type="hidden" id="cgLength"   name="length" value=""/>
	<input type="hidden" id="cgWeight"   name="weight" value=""/>
	<input type="hidden" id="cgHead"     name="head" value=""/>
	<input type="hidden" id="cgNeck"     name="neck" value=""/>
	<input type="hidden" id="cgShoulder" name="shoulder" value=""/>
	<input type="hidden" id="cgWaist"    name="waist" value=""/>
	<input type="hidden" id="cgThigh"    name="thigh" value=""/>
	<input type="hidden" id="cgFoot"     name="foot" value=""/>
	<input type="hidden" id="cgFinger"   name="finger" value=""/>
	<input type="hidden"                 name="userId" value="<%=sessionId%>"/>
</form>
<div class="userInfo">
	<h1 class="title">User Informations</h1>
	<div class="infoList">
		<ul class="item">
			<li>ID</li>
			<li>이름</li>
			<li>성별</li>
			<li>가입일자</li>
			<li>휴대폰</li>
			<!-- <li>주소(가 필요한가?)</li> -->
			<li>옷장</li>
			<li>포인트 잔액</li>
			<li>최종 결제일</li>
			<li>비밀번호 변경</li>
		</ul>
		<ul class="current">
			<li><%=sessionId %></li>
			<li><%=sessionName %></li>
			<li><%=sessionSexKorFormat %></li>
			<li><%=sessionRegDateKOR %></li>
			<li><%=sessionMobileHipen %></li>
			<li><%=sessionClosetName %></li>
			<li>￦ <%=sessionCash %></li>
			<li><%=sessionCashLastDateKOR %></li>
			<li>
				<input type="password" id="changePw"  name="changePw"  placeholder="Password"/>
				<input type="password" id="confirmPw" name="confirmPw" placeholder="Password Confirm"/>
				&nbsp;<button id="passwordChange">Change</button>
			</li>
		</ul>
		<ul class="update">
			<li>　</li>
			<li>　</li>
			<% if(sessionSex == "" || sessionSex == null) { %>
				<li>
					<input type="radio" name="selectSex" style="width:24px;height:24px;margin-top:6px;" value="M"/> 남자 
					&nbsp;&nbsp;
					<input type="radio" name="selectSex" style="width:24px;height:24px;margin-top:6px;" value="F"/> 여자 
					&nbsp;&nbsp;
					<button id="enrollSex" style="width:120px;font-size:1.0em;">성별등록</button>
				</li>
			<% } else { %>
				<li>　</li>
			<% } %>
			<li>　</li>
			<li>
				<input type="text" id="cgMobile1" name="cgMobile1" maxlength="3" placeholder="＊＊＊"/> -
				<input type="text" id="cgMobile2" name="cgMobile2" maxlength="4" placeholder="＊＊＊＊"/> -
				<input type="text" id="cgMobile3" name="cgMobile3" maxlength="4" placeholder="＊＊＊＊"/>
				<button id="mobileCertify">Certify</button>
				<button style="display:none;" id="mobileChange">Change</button>
				<button style="display:none;" id="mobileChanged" disabled>Changed</button>
				<input type="hidden" id="certifyYn" name="certifyYn" value="N"/>
			</li>
			<!-- <li>
				<input type="text" id="post" name="post"/><button>우편번호 검색</button><br/>
				상세주소 1 : <input type="text" id="state" name="state"/><br/>
				상세주소 2 : <input type="text" id="city" name="city"/><br/>
				상세주소 3 : <input type="text" id="street" name="street"/><br/>
			</li> -->
			<li><button id="goChangeCloset" style="width:120px;font-size:1.0em;">옷장 바꾸기</button></li>
			<li><button id="goCharge" style="width:120px;font-size:1.0em;">포인트 충전</button></li>
			<li>　</li>
			<li>　</li>
		</ul>
	</div>
	<input type="password" id="showPrivate" style="float:left;margin-top:12px;width:150px;height:30px;border-radius:6px;margin-right:6px;text-indent:6px;font-size:1.0em;"/>
	<button id="viewPhysical" style="float:left;margin-top:12px;width:150px;">View Size</button>
	<button id="goDrop" style="float:right;margin-top:12px;width:150px;">회원탈퇴 ></button>
	<div class="privateInfo" id="privateInfo" style="display:none;">
	<% if(sessionSex != null) { %>
		<% if(sessionSex.equals("M")) { %>
		<div class="profilePhoto">
			<a href="javascript:profileWindow();" id="photoArea">프로필 사진 등록 (320 X 320)</a>	<!-- 사진 호출 Ajax 구현 -->
			<form action="/file/uploadProfile.do" method="POST" enctype="multipart/form-data" class="fileSet" style="display:none;">
				<input type="file" id="profilePhoto" name="profilePhoto" onchange="javascript:profileUpload(this.value);"/>
				<!-- <button type="submit" id="profileUpload">등록/수정</button> -->
			</form>
		</div>
		<ul class="item">	<!-- 치수는 남성/여성 포멧을 확인해야한다. -->
			<li>신장 : </li>
			<li>체중 : </li>
			<li>머리둘레 : </li>
			<li>목둘레 : </li>
			<li>어깨 : </li>
			<li>허리 : </li>
			<li>다리통 : </li>
			<li>발 : </li>
			<li>손가락둘레 : </li>
		</ul>
		<ul class="mesure">
			<li><%=sessionLength %> cm</li>
			<li><%=sessionWeight %> kg</li>
			<li><%=sessionHead %> cm</li>
			<li><%=sessionNeck %> cm</li>
			<li><%=sessionShoulder %> cm</li>
			<li><%=sessionWaist %> cm</li>
			<li><%=sessionThigh %> cm</li>
			<li><%=sessionFoot %> mm</li>
			<li><%=sessionFinger %> mm</li>
		</ul>
		<ul class="enroll">
			<li><input type="text" id="userLength"		placeholder="cm"/><button id="sizeLength"  >사이즈 등록/변경</button></li>
			<li><input type="text" id="userWeight"		placeholder="kg"/><button id="sizeWeight"  >사이즈 등록/변경</button></li>
			<li><input type="text" id="userHead"		placeholder="cm"/><button id="sizeHead"    >사이즈 등록/변경</button></li>
			<li><input type="text" id="userNeck"		placeholder="cm"/><button id="sizeNeck"    >사이즈 등록/변경</button></li>
			<li><input type="text" id="userShoulder"	placeholder="cm"/><button id="sizeShoulder">사이즈 등록/변경</button></li>
			<li><input type="text" id="userWaist"		placeholder="cm"/><button id="sizeWaist"   >사이즈 등록/변경</button></li>
			<li><input type="text" id="userThigh"		placeholder="cm"/><button id="sizeThigh"   >사이즈 등록/변경</button></li>
			<li><input type="text" id="userFoot"		placeholder="mm"/><button id="sizeFoot"    >사이즈 등록/변경</button></li>
			<li><input type="text" id="userFinger"		placeholder="mm"/><button id="sizeFinger"  >사이즈 등록/변경</button></li>
		</ul>
		<% } else if(sessionSex.equals("F")) { %>
		여성의 경우 사이즈계열이 다르다.
		조사가 필요함.
		<% } %>
	<% } else { %>
		지정된 성별이 없습니다.
	<% } %>
	</div>
</div>
</body>
</html>