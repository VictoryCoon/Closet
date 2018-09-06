<%@ include file="/WEB-INF/jsp/admin/aHead.jsp"%>
<body>
<script>
$(document).ready(function(){
	$.ajax({
		url:'/admin/companyInfo.json',
		type:'POST',
		data:'',
		contentType:"application/x-www-form-urlencoded;charsset=UTF-8",
		dataType:'json',
		success:function(rsp) {
			var tag = "";
			$.each(rsp, function(k,v) {
				tag += '<li>'+v.adminId+'</li>';
				tag += '<li>'+v.adminPw+'</li>';
				tag += '<li>'+v.cnt+'</li>';
				tag += '<li>'+v.access+'</li>';
				tag += '<li>'+v.access+'</li>';
			});
			$("#companyInfo").html(tag);
			
		},
		error:function(XMLHttpRequest, textStatus, errorThrown) {
			alert("Ajax Error : Check parameters or statements Of Ajax Elements in the Inspector log.");
			return;
		}
	});
});
</script>
<div class="adminMain">
	<h1 id="home">Management</h1>
	<%@ include file="/WEB-INF/jsp/admin/aLeft.jsp"%>
	<div class="adminStatus">
		<div class="main">
			<ul>
				<li>Company : </li>
				<li>CEO : </li>
				<li>Tel : </li>
				<li>Fax : </li>
				<li>Address : </li>
			</ul>
			<ul id="companyInfo">
			
			</ul>
		</div>
	</div>
</div>
</body>
</html>
