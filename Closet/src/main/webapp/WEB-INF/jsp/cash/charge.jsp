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
var afterAmt;
$(document).ready(function() {
	setTimeout(function() {	
		/* 포인트 관리 */
		$("#usePoint").keyup(function(){
			/* 숫자만 입력 */
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
			
			/* 포인트 잔액 계산 Trigger */
			var restPoint = stringToInt("<%=sessionPoint%>");
			var usedPoint = stringToInt($("#usePoint").val());
			var selectedAmt = stringToInt($("#cashAmt").val());
			
			afterPoint = restPoint - usedPoint; 
			afterAmt = stringToInt($("#cashAmt").val()) - usedPoint;
			
			if(afterPoint < 0 ) {
				alert("사용할 수 있는 포인트가 부족합니다.");
				$("#usePoint").val(0);
				$("#afterPoint").text("<%=sessionPoint%>");
				return;
			} else if(selectedAmt < usedPoint) {
				alert("결제금액보다 더 많은 포인트를 사용하실 수 없습니다.");
				$("#usePoint").val("");
				$("#afterPoint").text("<%=sessionPoint%>");
				$("#cashAmtBySelected").text(selectedAmt);
				return;
			}else {
				$("#afterPoint").text(afterPoint);
				$("#cashAmtBySelected").text(afterAmt);
			}
		});
	},200);

	$("#afterPoint").text("<%=sessionPoint%>");
	$("#usePoint").val("0");
	
	/* 금액변경 */
	$("#cashAmt").change(function(){
		$("#usePoint").val("");
		$("#cashAmtBySelected").text($("#cashAmt option:selected").val());
	});	
});

function onSet(checkValue) {
	var frameSet = $("#infoSet");
	var tag = "";
	
	frameSet.fadeIn(1000);
	
	if(checkValue == "BK") {			// 무통장 OR 가상계좌
		
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
		tag += '			<input type="text" id="account" placeholder="Account" maxlength="16"/>';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<span class="annotations">계좌번호는 (-)기호를 제외하고 입력해주세요.<br/>결제하신 계좌번호는 환급계좌로 사용됩니다.</span><!-- 어차피 숫자만 로직 넣을것임 -->';
		tag += '		</li>';
		tag += '		<li>';
		tag += '			<button id="pay" style="width:120px;height:45px;"> 결 제 </button>';
		tag += '		</li>';
		tag += '	</ul>';
		
		frameSet.html(tag);
	} else if (checkValue == "CD") {	// 신용카드
		
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
		tag += '			<input type="text"     id="cardNo1" name="cardNo1" maxlength="4"/><span> - </span>';
		tag += '			<input type="password" id="cardNo2" name="cardNo2" placeholder="＊＊＊＊" maxlength="4"/><span> - </span>';
		tag += '			<input type="password" id="cardNo3" name="cardNo3" placeholder="＊＊＊＊" maxlength="4"/><span> - </span>';
		tag += '			<input type="text"     id="cardNo4" name="cardNo4" maxlength="4"/>';
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
	} else if (checkValue == "MB") {	// 휴대폰ARS
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
	} else if (checkValue == "KA") {	// 카카오페이
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
		
		$("#pay").click(function() {
			
			if($("#cashAmt").val() == "0") {
				alert("충전하실 금액을 선택해주세요.");
				return;
			}
			
			if($("input[name=paymentType]:checked").val() == "BK") {
				
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
				
			} else if($("input[name=paymentType]:checked").val() == "CD") {		
				
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
				
			} else if($("input[name=paymentType]:checked").val() == "MB") {
				/* 사실 세션정보에서 가져온 연락처를 쓸 것이다. */
				if($("#mobile").val() == "") {
					alert("휴대폰 번호를 입력 해 주세요.");
					return;
				}
			} else if($("input[name=paymentType]:checked").val() == "KA") {
				alert("카카오페이는 제휴나 하고!");
			}
			
			$("#cashParam02").val(stringToInt($("#cashAmt").val()));	// Raw
			$("#cashParam03").val(stringToInt($("#cashAmtBySelected").text()));	// Real
			$("#cashParam04").val($("input:radio[name=paymentType]:checked").val());
			//$("#cashParam05").val($("#selectBankCdReceive").val());
			$("#cashParam06").val($("#selectBankCdSend").val());
			$("#cashParam07").val($("#depositor").val());
			$("#cashParam08").val($("#account").val());
			$("#cashParam09").val($("#selectCardCd").val());
			if($("input[name=paymentType]:checked").val() == "CD") {
				$("#cashParam10").val($("#cardNo1").val() + "" + $("#cardNo2").val() + "" + $("#cardNo3").val() + "" + $("#cardNo4").val());
			} else {
				$("#cashParam10").val("");
			}
			$("#cashParam11").val($("#cardOw").val());
			$("#cashParam12").val($("#cardQuota").val());
			$("#cashParam13").val($("#cardPw").val());
			$("#cashParam14").val($("#cardExpYear").val());
			$("#cashParam15").val($("#cardExpMonth").val());
			$("#cashParam16").val($("#mobile").val());
			$("#cashParam17").val(stringToInt($("#usePoint").val()));
			
			console.log($("#cashParam01").val());
			console.log($("#cashParam02").val());
			console.log($("#cashParam03").val());
			console.log($("#cashParam04").val());
			//console.log($("#cashParam05").val());
			console.log($("#cashParam06").val());
			console.log($("#cashParam07").val());
			console.log($("#cashParam08").val());
			console.log($("#cashParam09").val());
			console.log($("#cashParam10").val());
			console.log($("#cashParam11").val());
			console.log($("#cashParam12").val());
			console.log($("#cashParam13").val());
			console.log($("#cashParam14").val());
			console.log($("#cashParam15").val());
			console.log($("#cashParam16").val());
			console.log($("#cashParam17").val());
			
			pay();
		});
	},500);
}

function pay() {
	var params = {
		'userId'          : document.cashCharge.userId.value,
		'cashRawAmt'     : document.cashCharge.cashRawAmt.value,
		'cashRealAmt'     : document.cashCharge.cashRealAmt.value,
		'pmtKind'         : document.cashCharge.pmtKind.value,
		//'rcvBankCd'    : document.cashCharge.pmtRcvBankCd.value,
		'bankCd'       : document.cashCharge.pmtBankCd.value,
		'depositor'    : document.cashCharge.pmtDepositor.value,
		'account'      : document.cashCharge.pmtAccount.value,
		'cardCd'       : document.cashCharge.pmtCardCd.value,
		'cardNo'       : document.cashCharge.pmtCardNo.value,
		'cardOw'       : document.cashCharge.pmtCardOw.value,
		'cardQuota'    : document.cashCharge.pmtCardQuota.value,
		'cardPw'       : document.cashCharge.pmtCardPw.value,
		'cardExpYear'  : document.cashCharge.pmtCardExpYear.value,
		'cardExpMonth' : document.cashCharge.pmtCardExpMonth.value,
		'mobile'       : document.cashCharge.pmtMobile.value,
		'point'        : document.cashCharge.pmtPoint.value,
	};
	
	$.ajax({
		url:'/cash/tryCharge.do',
		type:'POST',
		data:params,
		contentType:"application/x-www-form-urlencoded;charsset=UTF-8",
		dataType:'json',
		success:function(rsp) {
			if(rsp.SP_ReturnCode != "0") {
				if(rsp.SP_StatusValue == "BK") {
					alert("무통장!");
					return;
					execBank();
				} else if(rsp.SP_StatusValue == "CD") {
					alert("카드!");
					return;
					execCard();
				} else if(rsp.SP_StatusValue == "MB") {
					alert("모바일!");
					return;
					execMobile();
				} else if(rsp.SP_StatusValue == "KA") {
					alert("카카오!");
					return;
					alert("카카오페이는 제휴나 하고!");
				}
				//document.cashCharge.action = "/cash/charge.do";
				//document.cashCharge.submit();
			} else {
				alert("Error : "+rsp.SP_ReturnMsg);
				return;
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown) {
			alert("Ajax Error : Check parameters or statements Of Ajax Elements in the Inspector log.");
			console.log("ParamData : " + params);
			console.log("XMLHttpRequest : " + XMLHttpRequest);
			console.log("textStatus : " + textStatus);
			console.log("errorThrown : " + errorThrown);
			return;
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
<form name="cashCharge" method="POST" style="display:none;">
	<input type="text" id="cashParam01" name="userId"          value="<%=sessionId%>"/>
	<input type="text" id="cashParam02" name="cashRawAmt"      value=""/>
	<input type="text" id="cashParam03" name="cashRealAmt"     value=""/>
	<input type="text" id="cashParam04" name="pmtKind"         value=""/>
	<!-- <input type="text" id="cashParam05" name="pmtRcvBankCd"    value=""/> -->
	<input type="text" id="cashParam06" name="pmtBankCd"       value=""/>
	<input type="text" id="cashParam07" name="pmtDepositor"    value=""/>
	<input type="text" id="cashParam08" name="pmtAccount"      value=""/>
	<input type="text" id="cashParam09" name="pmtCardCd"       value=""/>
	<input type="text" id="cashParam10" name="pmtCardNo"       value=""/>
	<input type="text" id="cashParam11" name="pmtCardOw"       value=""/>
	<input type="text" id="cashParam12" name="pmtCardQuota"    value=""/>
	<input type="text" id="cashParam13" name="pmtCardPw"       value=""/><!-- 카드만기:연도 -->
	<input type="text" id="cashParam14" name="pmtCardExpYear"  value=""/><!-- 카드만기:연 -->
	<input type="text" id="cashParam15" name="pmtCardExpMonth" value=""/><!-- 카드만기:월 -->
	<input type="text" id="cashParam16" name="pmtMobile"       value="<%=sessionMobile%>"/><!-- 휴대폰번호 -->
	<input type="text" id="cashParam17" name="pmtPoint"        value=""/><%-- 포인트 <%=sessionPoint%> --%>
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
					<option value=    "0"> 선택</option>
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
				<input type="text" id="usePoint" value="0" class="point"/> / 사용 후 포인트 : <span id="afterPoint"></span>
			</li>
			<li><span>￦ </span><span id="cashAmtBySelected">-</span></li>
			<li>
				<input type="radio" name="paymentType" value="BK" onclick="onSet(this.value);"/><span> 무통장 </span>
				<input type="radio" name="paymentType" value="CD" onclick="onSet(this.value);"/><span> 신용카드 </span>
				<input type="radio" name="paymentType" value="MB" onclick="onSet(this.value);"/><span> 휴대폰ARS </span>
				<input type="radio" name="paymentType" value="KA" onclick="onSet(this.value);"/><span> 카카오페이 </span>
			</li>
		</ul>
	</div>
	<div class="chargePmt" id="infoSet" style="display:none;"></div>
</div>

<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>
