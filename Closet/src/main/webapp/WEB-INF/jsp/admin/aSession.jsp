<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%

	HttpSession sessionAdmin = request.getSession(true);

	String sessionId = "";
	String sessionPw = "";
	String sessionYn = "N";

	if(sessionAdmin.getAttribute("userId") != null) {
		sessionId = (String) sessionAdmin.getAttribute("userId");
		sessionPw = (String) sessionAdmin.getAttribute("userPw");
		sessionYn = "Y";
	} else {
		sessionId = "";
		sessionPw = "";
		sessionYn = "N";
	}

	if(request.getRequestURI().indexOf("/admin/") != -1) {
		if(sessionId == "" || sessionId == null) {
			response.sendRedirect("/sessionExpired");
		}
	}
%>