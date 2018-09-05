<!-- HEX Color Chart : https://www.rapidtables.com/web/color/RGB_Color.html -->

<%
	/* Responsive Format For Mobile Environment */
	int isMobile = 0;

	String agent = request.getHeader("USER-AGENT");
	String [] device = {
		"iPhone","iPod","Android",
		"BlackBerry","Windows CE",
		"Nokia","Webos",
		"Opera Mini","SonyEricsson",
		"Opera Mobi","IEMobile"
	};

	int j = -1;
	
	for(int i=0; i<device.length;i++) {
		j = agent.indexOf(device[i]);
		if(j > -1){
			isMobile = 1;
			break;
		} else {
			isMobile = 0;
		}
	}
%>

<% if(isMobile == 0) { %>

<!-- Common -->
<link rel="stylesheet" type="text/css" href="/file/css/reset.css" media="all"/>
<link rel="stylesheet" type="text/css" href="/file/css/head.css" media="all"/>
<link rel="stylesheet" type="text/css" href="/file/css/bottom.css" media="all"/>
<link rel="stylesheet" type="text/css" href="/file/css/button.css" media="all"/>
<link rel="stylesheet" type="text/css" href="/file/css/layer.css" media="all"/>

<!-- Main -->
<link rel="stylesheet" type="text/css" href="/file/css/main.css" media="all"/>

<!-- Sign Up & Sign In & Sign Out -->
<link rel="stylesheet" type="text/css" href="/file/css/sign.css" media="all"/>

<!-- User -->
<link rel="stylesheet" type="text/css" href="/file/css/myInfo.css" media="all"/>

<!-- About -->
<link rel="stylesheet" type="text/css" href="/file/css/about.css" media="all"/>

<!-- Board -->
<link rel="stylesheet" type="text/css" href="/file/css/bList.css" media="all"/>

<!-- Closet -->
<link rel="stylesheet" type="text/css" href="/file/css/myCloset.css" media="all"/>

<!-- Cash -->
<link rel="stylesheet" type="text/css" href="/file/css/charge.css" media="all"/>

<!-- Customer Service -->
<link rel="stylesheet" type="text/css" href="/file/css/cList.css" media="all"/>
<link rel="stylesheet" type="text/css" href="/file/css/faqList.css" media="all"/>
<!-- <link rel="stylesheet" type="text/css" href="/file/css/qnaList.css" media="all"/>
<link rel="stylesheet" type="text/css" href="/file/css/answerList.css" media="all"/>
<link rel="stylesheet" type="text/css" href="/file/css/answerEdit.css" media="all"/> -->

<!-- GridSter.Css -->
<link rel="stylesheet" type="text/css" href="/file/jsComponent/gridsterJavaScript/dist/jquery.gridster.css" media="all"/>
<!-- <link rel="stylesheet" type="text/css" href="/file/jsComponent/gridsterJavaScript/dist/jquery.gridster.min.css" media="all"/> -->

<% } else if(isMobile != 0){ %>

<% } %>
