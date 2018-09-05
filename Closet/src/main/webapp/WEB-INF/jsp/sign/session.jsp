<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%

	HttpSession sessionInfo = request.getSession(true);

	String sessionId = "";
	String sessionName = "";
	String sessionSex = "";
	String sessionSexKorFormat = "";
	String sessionRegDate = "";
	String sessionRegDateKOR = "";
	String sessionRegDateSlash = "";
	String sessionBirthday = "";
	String sessionBirthdayKOR = "";
	String sessionBirthdaySlash = "";
	String sessionPw = "";
	String sessionMobile = "";
	String sessionMobileHipen = "";
	String sessionAddress = "";
	String sessionCash = "";
	String sessionCashLastAmt = "";
	String sessionCashLastDate = "";
	String sessionBankCd = "";
	String sessionBankName = "";
	String sessionClosetCd = "";
	String sessionClosetName = "";
	String sessionCashLastDateKOR = "";
	String sessionCashLastDateSlash = "";
	String sessionProfilePhoto = "";
	String sessionLength = "";
	String sessionWeight = "";
	String sessionHead = "";
	String sessionNeck = "";
	String sessionShoulder = "";
	String sessionWaist = "";
	String sessionThigh = "";
	String sessionFoot = "";
	String sessionFinger = "";
	String sessionBust = "";
	String sessionHip = "";
	
	String sessionYn = "N";

	if(sessionInfo.getAttribute("userId") != null) {
		sessionId = (String) sessionInfo.getAttribute("userId");
		sessionName = (String) sessionInfo.getAttribute("userName");
		sessionSex = (String) sessionInfo.getAttribute("sex");
		if(sessionSex != null) {
			if(sessionSex.equals("M")) {
				sessionSexKorFormat = "남자";
			} else if(sessionSex.equals("F")){
				sessionSexKorFormat = "여자";
			}
		} else {
			sessionSexKorFormat = "미등록";
		}
		sessionRegDate = (String) sessionInfo.getAttribute("regDate");
		sessionRegDateKOR = sessionRegDate.substring(0,4) + "년 " + sessionRegDate.substring(4,6) + "월 " + sessionRegDate.substring(6,8) + "일";
		sessionRegDateSlash = sessionRegDate.substring(0,4) + "/" + sessionRegDate.substring(4,6) + "/" + sessionRegDate.substring(6,8);
		sessionBirthday = (String) sessionInfo.getAttribute("birthday");
		sessionBirthdayKOR = sessionBirthday.substring(0,4) + "년 " + sessionBirthday.substring(4,6) + "월 " + sessionBirthday.substring(6,8) + "일";
		sessionBirthdaySlash = sessionBirthday.substring(0,4) + "/" + sessionBirthday.substring(4,6) + "/" + sessionBirthday.substring(6,8);
		sessionPw = (String) sessionInfo.getAttribute("userPw");
		sessionMobile = (String) sessionInfo.getAttribute("mobile");
		if(sessionMobile.length() == 11) {
			sessionMobileHipen = sessionMobile.substring(0,3) + "-" + sessionMobile.substring(3,7) + "-" + sessionMobile.substring(7,11);	
		} else if(sessionMobile.length() <= 10) {
			sessionMobileHipen = sessionMobile.substring(0,3) + "-" + sessionMobile.substring(3,6) + "-" + sessionMobile.substring(6,10);
		}
		sessionAddress = (String) sessionInfo.getAttribute("address");
		sessionCash = (String) sessionInfo.getAttribute("cash");
		sessionCashLastAmt = (String) sessionInfo.getAttribute("cashLastAmt");
		sessionCashLastDate = (String) sessionInfo.getAttribute("cashLastDate");
		sessionBankCd = (String) sessionInfo.getAttribute("bankCd");
		sessionBankName = (String) sessionInfo.getAttribute("bankName");
		sessionClosetCd = (String) sessionInfo.getAttribute("closetCd");
		sessionClosetName = (String) sessionInfo.getAttribute("closetName");
		if(sessionCashLastDate != null) {
			sessionCashLastDateKOR = sessionCashLastDate.substring(0,4) + "년 " + sessionCashLastDate.substring(4,6) + "월 " + sessionCashLastDate.substring(6,8) + "일";
			sessionCashLastDateSlash = sessionCashLastDate.substring(0,4) + "/" + sessionCashLastDate.substring(4,6) + "/" + sessionCashLastDate.substring(6,8);
		}
		if(sessionInfo.getAttribute("profilePath") !=null && sessionInfo.getAttribute("profileImg") !=null && sessionInfo.getAttribute("profileImgExt") !=null) {
			sessionProfilePhoto = (String) sessionInfo.getAttribute("profilePath") + (String) sessionInfo.getAttribute("profileImg") + (String) sessionInfo.getAttribute("profileImgExt");	
		} else {
			sessionProfilePhoto = "/file/img/noProfile.png";
		}
		
		sessionLength = (String) sessionInfo.getAttribute("length");
		sessionWeight = (String) sessionInfo.getAttribute("weight");
		sessionHead = (String) sessionInfo.getAttribute("head");
		sessionNeck = (String) sessionInfo.getAttribute("neck");
		sessionShoulder = (String) sessionInfo.getAttribute("shoulder");
		sessionWaist = (String) sessionInfo.getAttribute("waist");
		sessionThigh = (String) sessionInfo.getAttribute("thigh");
		sessionFoot = (String) sessionInfo.getAttribute("foot");
		sessionFinger = (String) sessionInfo.getAttribute("finger");
		sessionBust = (String) sessionInfo.getAttribute("bust");
		sessionHip = (String) sessionInfo.getAttribute("hip");
		sessionYn = "Y";
	} else {
		sessionId = "";
		sessionName = "";
		sessionSex = "";
		sessionSexKorFormat = "";
		sessionRegDate = "";
		sessionRegDateKOR = "";
		sessionRegDateSlash = "";
		sessionBirthday = "";
		sessionBirthdayKOR = "";
		sessionBirthdaySlash = "";
		sessionPw = "";
		sessionMobile = "";
		sessionMobileHipen = "";
		sessionAddress = "";
		sessionCash = "";
		sessionCashLastAmt = "";
		sessionCashLastDate = "";
		sessionBankCd = "";
		sessionBankName = "";
		sessionClosetCd = "";
		sessionClosetName = "";
		sessionProfilePhoto = "";
		sessionLength = "";
		sessionWeight = "";
		sessionHead = "";
		sessionNeck = "";
		sessionShoulder = "";
		sessionWaist = "";
		sessionThigh = "";
		sessionFoot = "";
		sessionFinger = "";
		sessionBust = "";
		sessionHip = "";
		sessionYn = "N";
	}

	if(request.getRequestURI().indexOf("/user/") != -1 || request.getRequestURI().indexOf("/closet/") != -1 || request.getRequestURI().indexOf("/cash/") != -1 ) {
		if(sessionId == "" || sessionId == null) {
			response.sendRedirect("/sessionEndUp");
		}
	}
%>