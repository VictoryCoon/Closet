<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/jsp/common/head.jsp"%>
<%
	String conPath = request.getContextPath();
	System.out.print(conPath);
%>
<body>
<h1>custom/view.jsp 페이지 입니다.</h1>

<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
</body>
</html>
