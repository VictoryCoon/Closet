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
<div class="aboutSymbol">
</div>
<div class="aboutEthic">
	우리기업은<br/>
	돈을 벌기위해<br/>
	설립되었습니다.<br/>
	돈은 항상 옳습니다.<br/>
	그게아니라고 생각하신다면,<br/>
	일단 돈부터 버시고 말씀하세요.<br/>
	정신고승리는 어릴때만 먹힙니다.<br/>
</div>
<div class="aboutContent">
	<h1>정신승리</h1>
	<br/>
	<p>
		이 말은 중국 소설가 루쉰의 명저, 아큐정전(阿Q正傳)에서 나온 정신승리법(精神勝利法)이라는 말에서 유래한 것이다.
		소설의 주인공 아큐는 성격이 거의 잡인에 가까운 사람인데, 길을 가다가 무뢰배를 만나 그들에게 폭행을 당해도 이내 "저 녀석들은 내 아들이다.
		그러니까 나는 아들에게 맞은 것뿐이다"라고 정신적 승리를 하는 모습을 보인다. 또한 자신 역시도 자기보다 약하거나 힘없는 사람, 비구니 등을 비웃는 등 전형적인 강자에게 비굴하고 약자에게 무자비한 모습을 보인다.
		루쉰은 당대의 중국 민중들을 비판하기 위해 이 작품을 썼지만 노벨문학상을 받은 프랑스 작가 로맹 롤랑은 이 작품을 "가련한 아Q를 생각하면 눈물이 났다.
		보통들 약자에게 강하고 강자에게 상대도 못하는 중국인들을 다루었다고 하나 그것이 어디 중국인에게만 해당하는 이야기일까?
		아Q란 모습은 현대인들, 많은 사람들의 또다른 모습이기도 하다."라고 평했다.
		어떻게 보면 부정적인 의미의 자기만족과 비슷하다. 그러나 정신승리라는 용어가 인터넷 상에서 퍼지기 시작하면서 자기가 정신승리를 하고 있으면서 애먼 상대방을 정신승리한다고 적반하장식으로 대꾸하기도 한다.
	</p>
</div>
<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>

</body>
</html>
