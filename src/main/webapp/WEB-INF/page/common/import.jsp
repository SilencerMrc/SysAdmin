<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<meta charset="UTF-8">
<title>Mr.C & Daisy_li</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />
<link rel="shortcut icon" type="image/x-icon"
	href="${ctx}/static/images/chen.ico" media="screen" />
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${ctx }/static/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctx }/static/dist/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${ctx }/static/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${ctx }/static/layer/skin/default/layer.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<style>
body {
	background: #ECF0F5;
}

::-webkit-scrollbar {
	width: 2px;
	height: 2px;
	background-color: #F5F5F5;
}
/*定义滚动条轨道 内阴影+圆角*/
::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	/* border-radius: 10px; */
	background-color: #F5F5F5;
}

/*定义滑块 内阴影+圆角*/
::-webkit-scrollbar-thumb {
	/* border-radius: 3px; */
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
	background-color: #555;
}

::-webkit-scrollbar-thumb:hover {
	border-radius: 2px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
	background-color: rgba(7, 170, 247, 1);
}

.content-header {
	background: #374850;
	width: 100%;
	height: 40px;
	position: fixed;
	top: 0px;
	z-index: 1000;
	color: white;
	border-left: 2px solid #374850;
	/* border-bottom: 2px solid black; */
}

.content {
	position: fixed;
	top: 40px;
	padding: 5px 10px;
	top: 40px;
	width: 100%;
	overflow-y: auto;
	overflow-x: hidden;
}

.my-breadcrumb {
	margin-top: -7px;
}

.content-header>.breadcrumb>li>a {
	color: #777;
}
</style>

<!-- script begin-->
<script type="text/javascript" src="${ctx }/static/js/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${ctx }/static/js/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
	$.widget.bridge('uibutton', $.ui.button);
	var AdminLTEOptions = {
		/* sidebarExpandOnHover : false, */
		enableBoxRefresh : true,
		enableBSToppltip : true,
		navbarMenuSlimscroll : true,
		navbarMenuSlimscrollWidth : "3px", //The width of the scroll bar
		/* navbarMenuHeight : "200px", // */
		animationSpeed : 300,
		sidebarSlimScroll : true,
	}
	var authMenu = "";
</script>
<!-- Bootstrap 3.3.7 -->
<script src="${ctx }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
<!-- Slimscroll -->
<script src="${ctx }/static/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- AdminLTE App -->
<script src="${ctx }/static/dist/js/app.min.js"></script>
<script src="${ctx }/static/layer/layer.js"></script>
<!-- script end -->
<script>
	$(function() {
		$('html').css('height', '100%');
		$('body').css('height', '100%');
		$('.content').css('height', $('body').height() - $('.content-header').height() - 15 + 'px');
	})
</script>