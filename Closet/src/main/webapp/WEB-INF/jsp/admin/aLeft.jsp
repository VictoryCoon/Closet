<script>
$(document).ready(function(){
	$("#general").click(function(){
		location.href="general";
	});
	$("#contract").click(function(){
		location.href="contract";
	});
	$("#content").click(function(){
		location.href="content";
	});
	$("#client").click(function(){
		location.href="client";
	});
});
</script>
<div class="adminList">
	<ul>
		<li id="general">General</li>
		<li id="contract">Contract</li>
		<li id="content">Contents</li>
		<li id="client">Clients</li>
	</ul>
</div>