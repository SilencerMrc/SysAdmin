<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.main-footer {
	width: 100%;
	position: fixed;
	bottom: 0px;
	height: 40px;
	line-height: 15px;
}

.my-right {
	position: fixed;
	right: 20px;
	background-color: white;
}
</style>
<footer class="main-footer">
	<div class="pull-right hidden-xs my-right">
		<b>Version</b> 1.0.1
	</div>
	<strong>Copyright &copy; 2014-2017 <a href="#">Mr.C &
			Daisy_li</a>.
	</strong> All rights reserved.
</footer>
<script type="text/javascript">
	var h1 = $(".main-header").height();
	var h2 = $(".main-footer").height();
	$("#myiframe").css('height', $('body').height() - h1 - h2 -31 + 'px');
</script>