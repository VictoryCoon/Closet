<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<script>
var successCode = "";
var afterPoint;
$(document).ready(function() {
	$("#afterPoint").text("<%=sessionPoint%>");
	
	setTimeout(function() {	
		/* 숫자만 입력 */
		$("#usePoint").keyup(function(){
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
			
			/* 포인트 잔액 계산 Trigger */
			var restPoint = stringToInt("<%=sessionPoint%>");
			var usedPoint = stringToInt($("#usePoint").val());
			afterPoint = restPoint - usedPoint; 
			
			$("#afterPoint").text(afterPoint);
			
			if(afterPoint < 0 ) {
				alert("사용할 수 있는 포인트가 부족합니다.");
				$("#usePoint").val("");
				$("#afterPoint").text("<%=sessionPoint%>");
				return;
			}
		});
	},500);
	
	$("#cashAmt").change(function(){
		alert(afterPoint);
		var totalAmt = stringToInt($("#cashAmt option:selected").val()) - afterPoint
		
		$("#cashAmtBySelected").text("￦ " + totalAmt);
	});
	
	$("#pay").click(function() {
		
		var cardNo = $("#cardNo1").val() + $("#cardNo2").val() + $("#cardNo3").val() + $("#cardNo4").val();
		
		if(("input[name:paymentType]:checked").val() == "B") {
			
			if($("#selectBankCdReceive").val() == "") {
				alert("입금하실 은행을 선택해 주세요.");
				return;
			}
			
			if($("#selectBankCdSend").val() == "") {
				alert("예금하실 은행을 선택해 주세요.");
				return;
			}
			
			if($("#depositor").val() == "") {
				alert("예금주를 입력해 주세요.");
				return;
			}
			
			if($("#account").val() == "") {
				alert("계좌번호를 입력해 주세요.");
				return;
			}
			
			execBank();
			
		} else if(("input[name:paymentType]:checked").val() == "C") {
			
			if($("#selectCardCd").val() == "") {
				alert("신용카드사를 선택해 주세요.");
				return;
			}
			
			if($("#cardNo1").val() == "") {
				alert("신용카드번호 첫 번째 4자리를 입력해 주세요.");
				return;
			}
			
			if($("#cardNo2").val() == "") {
				alert("신용카드번호 두 번째 4자리를 입력해 주세요.");
				return;
			}
			
			if($("#cardNo3").val() == "") {
				alert("신용카드번호 세 번째 4자리를 입력해 주세요.");
				return;
			}
			
			if($("#cardNo4").val() == "") {
				alert("신용카드번호 네 번째 4자리를 입력해 주세요.");
				return;
			}
			
			if($("#cardOw").val() == "") {
				alert("신용카드 소유주를 입력해 주세요.");
				return;
			}
			
			if($("#cardPw").val() == "") {
				alert("신용카드 비밀번호 앞 2자리를 입력해 주세요.");
				return;
			}
			
			if($("#cardExpMonth").val() == "") {
				alert("신용카드 만기월자를 입력해 주세요.");
				return;
			}
			
			if($("#cardExpYear").val() == "") {
				alert("신용카드 만기연도를 앞 2자리를 입력해 주세요.");
				return;
			}
			
			execCard();
			
		} else if(("input[name:paymentType]:checked").val() == "M") {
			/* 사실 세션정보에서 가져온 연락처를 쓸 것이다. */
			if($("#mobile").val() == "") {
				alert("휴대폰 번호를 입력 해 주세요.");
				return;
			}
			
			execMobile();
		} else if(("input[name:paymentType]:checked").val() == "K") {
			alert("카카오페이는 제휴나 하고!");
		}
		
		$("#cashParam01").val("cashTempNo");	// 이건 생성방법을 따로 고안.(CashTrialLog테이블을 만들어볼까...)
		$("#cashParam02").val($("#cashAmt").val());
		$("#cashParam03").val($("input:radio[name=paymentType]:checked").val());
		$("#cashParam04").val($("#selectBankCdReceive").val());
		$("#cashParam05").val($("#selectBankCdSend").val());
		$("#cashParam06").val($("#depositor").val());
		$("#cashParam07").val($("#account").val());
		$("#cashParam08").val($("#selectCardCd").val());
		$("#cashParam09").val(cardNo);
		$("#cashParam10").val($("#cardOw").val());
		$("#cashParam11").val($("#cardPw").val());
		$("#cashParam12").val($("#cardExpYear").val());
		$("#cashParam13").val($("#cardExpMonth").val());
		$("#cashParam14").val($("#mobile").val());
		
		pay();
	});
});

function stringToInt(value) {
	if ((!value) || value == "")
		return 0;
	val = String(value).replace(/,/g, '');
	return parseInt(value, 10);
}

function stringToFloat(value) {
	if ((!value) || value == "")
		return 0;
	val = String(value).replace(/,/g, '');
	return parseFloat(value, 10);
}

function onSet(checkValue) {
	var frameSet = $("#infoSet");
	var tag = "";
	
	frameSet.fadeIn(1000);
	
	if(checkValue == "B") {			// 무통장 OR 가상계좌
		
		$(".chargePmt").css({'height':'360px'});
		
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
		tag += '			<input type="text" id="depsitor" placeholder="Depositor"/>';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<input type="text" id="account" placeholder="Account"/>';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<span class="annotations">계좌번호는 (-)기호를 제외하고 입력해주세요.<br/>결제하신 계좌번호는 환급계좌로 사용됩니다.</span><!-- 어차피 숫자만 로직 넣을것임 -->';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<button id="pay" style="width:120px;height:45px;"> 결 제 </button>';
		tag += '		</li>';
		tag += '	</ul>';
		
		frameSet.html(tag);
	} else if (checkValue == "C") {	// 신용카드
		
		$(".chargePmt").css({'height':'420px'});
		
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
		tag += '		<li class="cardOwFormat">';
		tag += '			<h3>신용카드 명의 : </h3>&nbsp;&nbsp;&nbsp;';
		tag += '			<input type="text" id="cardOw" placeholder="Name" maxlength="16"/>';
		tag += '		</li>';
		tag += '		<li class="cardPwFormat">';
		tag += '			<h3>신용카드 비밀번호(앞 2자리) : </h3>&nbsp;&nbsp;';
		tag += '			<input type="password" id="cardPw" placeholder="＊＊" maxlength="2"/>&nbsp;<span> / ＊＊</span>';
		tag += '		</li>';
		tag += '		<li  class="cardExpFormat">';
		tag += '			<h3>신용카드 만료 월/년 : </h3>&nbsp;&nbsp;';
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
		$(".chargePmt").css({'height':'270px'});
		
		tag += '<h3>&lt; 결제정보(휴대전화 ARS) &gt;</h3>';
		tag += '	<ul>';
		tag += '		<li>';
		tag += '			<select id="selectTeleCd">';
		tag += '				<option value="">- - - - - - - 통신사선택 - - - - - - -</option>';
		tag += '				<option value="">SKT</option>';
		tag += '				<option value="">KT</option>';
		tag += '				<option value="">LG U+</option>';
		tag += '			</select>';
		tag += '		</li>';
		tag += '		<li class="mobileFormat">';
		tag += '			<h3>휴대폰 번호 : </h3>';
		tag += '			<input type="text" id="mobile" maxlength="11" value="<%=sessionMobile%>"/>';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<span class="annotations">휴대폰 번호는 (-)기호를 제외하고 입력해주세요.</span>';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<button id="pay" style="width:120px;height:45px;"> 결 제 </button>';
		tag += '		</li>';
		tag += '	</ul>';
		
		frameSet.html(tag);
	} else if (checkValue == "K") {	// 카카오페이
		frameSet.html("KakaopayTest");
	} else {
		$(".chargePmt").css({'height':'0'});
		frameSet.html("");
	}
	
	setTimeout(function() {
		/* 숫자만 입력 */
		$("#account, #cardNo1, #cardNo2, #cardNo3, #cardNo4, #cardPw, #cardExpYear, #cardExpMonth, #mobile").keyup(function(){
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
	},500);
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
	
	var params = {
		'cashTempNo'      : document.cashCharge.cashTempNo.value,
		'cashTempAmt'     : document.cashCharge.cashTempAmt.value,
		'pmtKind'         : document.cashCharge.pmtKind.value,
		'pmtRcvBankCd'    : document.cashCharge.pmtRcvBankCd.value,
		'pmtBankCd'       : document.cashCharge.pmtBankCd.value,
		'pmtDepositor'    : document.cashCharge.pmtDepositor.value,
		'pmtAccount'      : document.cashCharge.pmtAccount.value,
		'pmtCardCd'       : document.cashCharge.pmtCardCd.value,
		'pmtCardNo'       : document.cashCharge.pmtCardNo.value,
		'pmtCardOw'       : document.cashCharge.pmtCardOw.value,
		'pmtCardPw'       : document.cashCharge.pmtCardPw.value,
		'pmtCardExpYear'  : document.cashCharge.pmtCardExpYear.value,
		'pmtCardExpMonth' : document.cashCharge.pmtCardExpMonth.value,
		'pmtMobile'       : document.cashCharge.pmtMobile.value,
		'pmtPoint'        : document.cashCharge.pmtPoint.value,
		'birthday'        : document.cashCharge.birthday.value,
		'userId'          : document.cashCharge.userId.value,
		'successCode'     : document.cashCharge.successCode.value
	};
	
	$.ajax({
		url:'/cash/test.do',
		type:'POST',
		data:postData,
		contentType:"application/x-www-form-urlencoded;charsset=UTF-8",
		dataType:'json',
		success:function(rsp) {
			document.cashCharge.action = "/cash/charge.do";
			document.cashCharge.submit();
		}
	});
	
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
	<input type="hidden" id="cashParam01" name="cashTempNo"      value=""/><!-- 여부확인 -->
	<input type="hidden" id="cashParam02" name="cashTempAmt"     value=""/><!-- 여부확인 -->
	<input type="hidden" id="cashParam03" name="pmtKind"         value=""/>
	<input type="hidden" id="cashParam04" name="pmtRcvBankCd"       value=""/>
	<input type="hidden" id="cashParam05" name="pmtBankCd"       value=""/>
	<input type="hidden" id="cashParam06" name="pmtDepositor"    value=""/>
	<input type="hidden" id="cashParam07" name="pmtAccount"      value=""/>
	<input type="hidden" id="cashParam08" name="pmtCardCd"       value=""/>
	<input type="hidden" id="cashParam09" name="pmtCardNo"       value=""/>
	<input type="hidden" id="cashParam10" name="pmtCardOw"       value=""/>
	<input type="hidden" id="cashParam11" name="pmtCardPw"       value=""/><!-- 카드만기:연도 -->
	<input type="hidden" id="cashParam12" name="pmtCardExpYear"  value=""/><!-- 카드만기:연 -->
	<input type="hidden" id="cashParam13" name="pmtCardExpMonth" value=""/><!-- 카드만기:월 -->
	<input type="hidden" id="cashParam14" name="pmtMobile"       value=""/><!-- 휴대폰번호 -->
	<input type="hidden" id="cashParam15" name="pmtPoint"        value=""/><%-- 포인트 <%=sessionPoint%> --%>
	<input type="hidden" id="cashParam16" name="birthday"        value="<%=sessionBirthday%>"/>	<!-- 생일자 이벤트 -->
	<input type="hidden" id="cashParam17" name="userId"          value="<%=sessionId%>"/>
	<input type="hidden" id="cashParam18" name="successCode"     value=""/>
</form>
<div class="chargePage">
	<h1 class="title">Cash Shop</h1>
	<div class="chargeDtl">
		<ul>
			<li>금액선택 : </li>
			<li>포인트 : </li>
			<li>결제금액 : </li>
			<li>결제방법 : </li>
		</ul>
		<ul>
			<li>
				<select id="cashAmt">
					<option value=""> 선택</option>
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
			<li>
				<input type="text" id="usePoint" value="" class="point"/> / 사용 후 포인트 : <span id="afterPoint"></span>
			</li>
			<li><span id="cashAmtBySelected">￦ </span></li>
			<li>
				<input type="radio" name="paymentType" value="B" onclick="onSet(this.value);"/><span> 무통장 </span>
				<input type="radio" name="paymentType" value="C" onclick="onSet(this.value);"/><span> 신용카드 </span>
				<input type="radio" name="paymentType" value="M" onclick="onSet(this.value);"/><span> 휴대폰ARS </span>
				<input type="radio" name="paymentType" value="K" onclick="onSet(this.value);"/><span> 카카오페이 </span>
			</li>
		</ul>
	</div>
	<div class="chargePmt" id="infoSet" style="display:none;"></div>
</div>

<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>
