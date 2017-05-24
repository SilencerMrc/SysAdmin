<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!doctype html>
<html>
<head>
<meta charset=UTF-8">
<title>FileExplorer</title>
<link rel="shortcut icon" type="image/x-icon"
	href="${ctx}/static/images/chen.ico" media="screen" />
<link rel="stylesheet" href="${ctx }/static/css/reset.css">
<link rel="stylesheet" href="${ctx }/static/css/supersized.css">
<link rel="stylesheet" href="${ctx }/static/css/login.css">
<link rel="stylesheet" href="${ctx }/static/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ctx }/static/layer/skin/default/layer.css">
<style type="text/css">
.content {
	position: absolute;
	width: 200px;
	height: 200px;
	/* border: 1px solid black; */
	top: 45%;
	left: 50%;
	margin-left: -100px;
	margin-top: -100px;
	text-align: center;
}

img {
	width: 70px;
	height: 70px;
	border-radius: 70px;
	border: 3px solid white;
}

.title {
	margin-top: 5px;
	color: white;
}

.input-group {
	margin-top: 10px;
}
</style>
<body onkeydown="KeyDown();" >
	<div class="page-container">
		<div class="content">
			<div>
				<img src="${ctx }/static/images/photo.png">
			</div>
			<div class="title">Daisy_li</div>
			<div class="input-group">
				<input type="password" id="password" class="form-control"
					placeholder="enter your pwd" style="background-color: transparent">
				<span class="input-group-btn">
					<button class="btn btn-success" type="button" id="button"
						style="background-color: transparent" onclick="submit();">
						<span class="glyphicon glyphicon-arrow-right"></span>
					</button>
				</span>
			</div>
		</div>
		<div class="connect">
			<p>If you're in love, what defines the notion: pursuing the best
				for yourself, or the best for the one you love?</p>
			<p style="margin-top: 20px;">爱在其中，何者是你所求：为自己争取最好的一切？还是为她争取最好的一切？</p>
		</div>
	</div>

</body>
<!-- <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script -->
<script type="text/javascript" src="${ctx }/static/js/jquery.min.js"></script>
<script src="${ctx }/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx }/static/js/supersized.3.2.7.min.js"></script>
<script src="${ctx }/static/js/supersized-init.js"></script>
<script src="${ctx }/static/layer/layer.js"></script>
<script type="text/javascript">
	function loadTopWindow() {

	}
	window.onload = function() {
		if (window.top != null && window.top.document.URL != document.URL) {
			window.top.location = document.URL; //这样就可以让登陆窗口显示在整个窗口了   
		}
		if (window.length > 0) {
			window.parent.location.reload();
		}
		$(".connect p").eq(0).animate({
			"left" : "0%"
		}, 600);
		$(".connect p").eq(1).animate({
			"left" : "0%"
		}, 400);
	}
	function KeyDown() {
		if (event.keyCode == 13) {
			event.returnValue = false;
			event.cancel = true;
			$("button").click();
		}
	}
	function submit() {
		var password = $("#password").val();
		if (password == '') {
			layer.msg('密码不能为空', {
				time : 1000
			});
			return;
		}
		$.post('${ctx}/login', {
			'password' : password
		}, function(result) {
			if (result.success)
				window.location.href = "${ctx}/sys/index";
			else
				layer.msg(result.msg);
		});
	}
</script>
</html>