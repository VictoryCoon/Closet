<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<script>
$(document).ready(function() {
	$("#pay").click(function() {
		pay();
	});
});

function onSet(checkValue) {
	var frameSet = $("#infoSet");
	var tag = "";
	
	frameSet.fadeIn(1000);
	
	if(checkValue == "B") {			// 무통장 OR 가상계좌
		
		$(".chargePmt").css({'height':'300px'});
		
		tag += '<h3>&lt; 결제정보(무통장) &gt;</h3>';
		tag += '	<ul>';
		tag += '		<li>';
		tag += '			<select id="selectBankCdReceive">';
		tag += '				<option value=""> - - - - - - 입금 은행선택 - - - - - - </option>';
		tag += '				<option value="002">ㄴㄱ은행 000-00-000000</option>';
		tag += '			</select>';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<select id="selectBankCdSend">';
		tag += '				<option value=""> - - - - - - 예금 은행슨택 - - - - - - </option>';
		tag += '				<option value="088">신한은행</option>';
		tag += '			</select>';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<input type="text" id="account" placeholder="Account"/>';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<span class="annotations">계좌번호는 (-)기호를 제외하고 입력해주세요.</span><!-- 어차피 숫자만 로직 넣을것임 -->';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<button id="pay" style="width:120px;height:45px;"> 결 제 </button>';
		tag += '		</li>';
		tag += '	</ul>';
		
		frameSet.html(tag);
	} else if (checkValue == "C") {	// 신용카드
		
		$(".chargePmt").css({'height':'360px'});
		
		tag += '<h3>&lt; 결제정보(신용카드) &gt;</h3>';
		tag += '	<ul>';
		tag += '		<li>';
		tag += '			<select id="selectCardCd">';
		tag += '				<option value="">- - - - - - - - 은행선택 - - - - - - - -</option>';
		tag += '				<option value="088">신한은행</option>';
		tag += '			</select>';
		tag += '		</li>';
		tag += '		<li class="cardNoFormat">';
		tag += '			<input type="text"     id="cardNo1" name="cardNo1" placeholder="＊＊＊＊" maxlength="4"/><span> - </span>';
		tag += '			<input type="password" id="cardNo2" name="cardNo2" placeholder="＊＊＊＊" maxlength="4"/><span> - </span>';
		tag += '			<input type="password" id="cardNo3" name="cardNo3" placeholder="＊＊＊＊" maxlength="4"/><span> - </span>';
		tag += '			<input type="text"     id="cardNo4" name="cardNo4" placeholder="＊＊＊＊" maxlength="4"/>';
		tag += '		</li>';
		tag += '		<li class="cardPwFormat">';
		tag += '			<h3>신용카드 비밀번호(앞 2자리) : </h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		tag += '			<input type="password" id="cardPw" placeholder="＊＊" maxlength="2"/>&nbsp;<span> / ＊＊</span>';
		tag += '		</li>';
		tag += '		<li  class="cardExpFormat">';
		tag += '			<h3>신용카드 만료 월/년 : </h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		tag += '			<input type="text" id="cardExpMonth" placeholder="MM" maxlength="2"/><span> /</span>';
		tag += '			<input type="text" id="cardExpYear" placeholder="YYYY" maxlength="4"/>';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<span>&nbsp;</span>';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<button id="pay" style="width:120px;height:45px;"> 결 제 </button>';
		tag += '		</li>';
		tag += '	</ul>';
	
		frameSet.html(tag);
	} else if (checkValue == "M") {	// 휴대폰ARS
		frameSet.html("MobileTest");
	} else if (checkValue == "K") {	// 카카오페이
		frameSet.html("KakaopayTest");
	} else {
		$(".chargePmt").css({'height':'0'});
		frameSet.html("");
	}
	
	setTimeout(function() {
		/* 숫자만 입력 */
		$("#account, #cardNo1, #cardNo2, #cardNo3, #cardNo4, #cardPw, #cardExpYear, #cardExpMonth").keyup(function(){
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
	},1000);
}

function pay() {
	
	if(("input[name:paymentType]:checked").val() == "B") {
		execBank();
	} else if(("input[name:paymentType]:checked").val() == "C") {
		execCard();
	} else if(("input[name:paymentType]:checked").val() == "M") {
		execMobile();
	} else if(("input[name:paymentType]:checked").val() == "K") {
		alert("카카오페이는 제휴나 하고!");
	}
	
	document.cashCharge.action = "/cash/charge.do";
	document.cashCharge.submit();
	
}

function execBank() {
	// 무통장 및 가상계좌 결제호출 메소드 정의
	alert("무통장!");
}

function execCard() {
	// 신용카드 결제호출 메소드 정의
	alert("카드!");
}

function execMobile() {
	// 휴대폰ARS 결제호출 메소드 정의
	alert("ARS!");
}

</script>
<body>
<form name="cashCharge" method="POST">
	<input type="hidden" id="cashParam1"  name="leafCd"          value=""/>
	<input type="hidden" id="cashParam2"  name="cashTempNo"      value=""/>
	<input type="hidden" id="cashParam3"  name="cashTempAmt"     value=""/>
	<input type="hidden" id="cashParam4"  name="pmtKind"         value=""/>
	<input type="hidden" id="cashParam5"  name="pmtBankCd"       value=""/>
	<input type="hidden" id="cashParam6"  name="pmtAccount"      value=""/>
	<input type="hidden" id="cashParam7"  name="pmtCardCd"       value=""/>
	<input type="hidden" id="cashParam8"  name="pmtCardNo"       value=""/>
	<input type="hidden" id="cashParam9"  name="pmtCardPw"       value=""/>
	<input type="hidden" id="cashParam10" name="pmtCardExpYear"  value=""/>
	<input type="hidden" id="cashParam11" name="pmtCardExpMonth" value=""/>
	<input type="hidden" id="cashParam12" name="pmtMobile"       value=""/>
	<input type="hidden" id="cashParam13" name="pmtPoint"        value=""/>
	<input type="hidden" id="cashParam14" name="birthday"        value="<%=sessionBirthday%>"/>
	<input type="hidden" id="cashParam15" name="userName"        value="<%=sessionName%>"/>
	<input type="hidden" id="cashParam16" name="userId"          value="<%=sessionId%>"/>
</form>
<div class="chargePage">
	<h1 class="title">Leaf Shop</h1>
	<div class="chargeDtl">
		<ul>
			<li>금액선택 : </li>
			<li>결제금액 : </li>
			<li>결제방법 : </li>
		</ul>
		<ul>
			<li>
				<select id="leafAmt">
					<option value="">선택</option>
					<option value= "5000">￦ &nbsp;5,000</option>
					<option value="10000">￦ 10,000</option>
					<option value="15000">￦ 15,000</option>
					<option value="20000">￦ 20,000</option>
					<option value="25000">￦ 25,000</option>
					<option value="30000">￦ 30,000</option>
					<option value="35000">￦ 35,000</option>
					<option value="40000">￦ 40,000</option>
					<option value="45000">￦ 45,000</option>
					<option value="50000">￦ 50,000</option>
				</select> 
			</li>
			<li><span id="cashAmtByLeaf">리프가 선택되면 Trigger</span></li>
			<li>
				<input type="radio" name="paymentType" value="B" onclick="onSet(this.value);"/><span> 무통장 </span>
				<input type="radio" name="paymentType" value="C" onclick="onSet(this.value);"/><span> 신용카드 </span>
				<input type="radio" name="paymentType" value="M" onclick="onSet(this.value);"/><span> 휴대폰ARS </span>
				<input type="radio" name="paymentType" value="K" onclick="onSet(this.value);"/><span> 카카오페이 </span>
			</li>
		</ul>
	</div>
	<div class="chargePmt" id="infoSet" style="display:none;">
		<h3>&lt; 결제정보(신용카드) &gt;</h3>
		<ul>
			<li>
				<select id="selectCardCd">
					<option value=""> - - - 은행선택 - - - </option>
					<option value="088">신한은행</option>
				</select>
			</li>
			<li>
				<button id="pay" style="width:120px;height:45px;"> 결 제 </button>
			</li>
		</ul>
	</div>
</div>

<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>
