<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/jsp/admin/aHead.jsp"%>
<body>
<div class="adminMain">
	<h1 id="home">Management</h1>
	<%@ include file="/WEB-INF/jsp/admin/aLeft.jsp"%>
	<div class="adminStatus">
		<div class="general">
			<h2 style="margin-bottom:30px;">컨텐츠관리</h2>
			<ul>
				<li>옷장</li>
				<li>Promotion</li>
				<li>Survey</li>
			</ul>
			<ul>
				<li>
					<select id="eventList">
						<option value="">선택</option>
					</select>
				</li>
				<li>
					<select id="promoList">
						<option value="">선택</option>
					</select>
				</li>
				<li>
					<select id="surveyList">
						<option value="">선택</option>
					</select>
				</li>
			</ul>
			<ul>
				<li>
					활성화 : <input type="radio" id="eventY" name="eventYn" value="Y"/>
					비활성 : <input type="radio" id="eventN" name="eventYn" value="N"/>
				</li>
				<li>
					활성화 : <input type="radio" id="promoY" name="promoYn" value="Y"/>
					비활성 : <input type="radio" id="promoN" name="promoYn" value="N"/>
				</li>
				<li>
					활성화 : <input type="radio" id="surveyY" name="surveyYn" value="Y"/>
					비활성 : <input type="radio" id="surveyN" name="surveyYn" value="N"/>
				</li>
			</ul>
			<button id="submit" style="margin-top:30px;">저장</button>
		</div>
	</div>
</div>
</body>
</html>
