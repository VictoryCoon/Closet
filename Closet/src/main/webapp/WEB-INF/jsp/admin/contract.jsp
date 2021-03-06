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
		<div class="contract">
			<h2 style="margin-bottom:30px;">계약관리</h2>
			<ul>
				<li>계약업체</li>
				<li>상품분류</li>
				<li>기타사항</li>
			</ul>
			<ul>
				<li>
					상호 : <input type="text" id="comName" name="comName"/>
				</li>
				<li>
					카테고리 : <select id="cate1">
						<option value="">선택</option>
					</select>
				</li>
				<li>
					<textarea id="remark"></textarea>
				</li>
			</ul>
			<ul>
				<li>
					사업자등록번호 : <input type="text" id="comNumb" name="socialNo"/><!-- 숫자와 -만 처리하는 정규식 찾기 -->
				</li>
				<li>
					상품 : <select id="cate2">
						<option value="">선택</option>
					</select>
				</li>
				<li>
				&nbsp;
				</li>
			</ul>
			<button id="submit" style="margin-top:30px;">저장</button>
		</div>
	</div>
</div>
</body>
</html>
