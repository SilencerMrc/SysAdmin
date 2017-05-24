<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<%@ include file="./common/import.jsp"%>
<style type="text/css">
.content-wrapper {
	overflow: hidden;
}

.my-content-header {
	height: 40px;
	position: fixed;
}

.content {
	padding: 0px;
	margin-top: 40px;
	overflow: auto;
}

.my-breadcrumb {
	float: left;
}
</style>

</head>

<body class="hold-transition skin-blue sidebar-mini fixed">
	<!-- 标题栏 -->
	<%@ include file="./common/header.jsp"%>
	<!-- 左侧菜单栏 -->
	<%@ include file="./common/aside.jsp"%>
	<div class="content-wrapper">
		<iframe id="myiframe" src="${ctx }/sys/home"
			style="width: 100%; border: 0px;"></iframe>
		<%-- <section class="content-header my-content-header">
			<h1 style="margin-top: -7px;">
				41uLove<small>后台管理系统</small>
			</h1>
			<ol class="breadcrumb my-breadcrumb" style="margin-top: -5px;">
				<li><a href="${ctx }/sys/index"><i class="fa fa-dashboard"></i>
						首页</a></li>
				<li class="active">首页</li>
			</ol>
		</section>
		<section class="content">
			<iframe id="myiframe" src="${dir }/sys/home"
				style="width: 100%; border: 0px;"></iframe>
		</section> --%>
	</div>
	<!-- 底部菜单栏 -->
	<%@ include file="./common/footer.jsp"%>

</body>
<script type="text/javascript">
	$(function() {
		$(".treeview-menu > li").click(function() {
			var url = $(this).find('a').attr('href');
			$(".treeview-menu > li").removeClass('active');
			$(this).addClass('active');
			if (url == '#')
				return;
			var index = layer.load(2);
			$("#myiframe").attr('src', url);
			$("#myiframe").load(function() {
				layer.close(index);
			});
		});
		$(".refresh-bar").click(function() {
			var index = layer.load(2);
			$('#myiframe').attr('src', $('#myiframe').attr('src'));
			$("#myiframe").load(function() {
				layer.close(index);
			});
		});

		$(".content-wrapper").css('top', $('body').height() - $('header').height + 'px');
		var iframeHeight = $('iframe').height();
		var iframeWidth = $('iframe').width();
		$("iframe").contents().find("html").css({
			'height' : iframeHeight + 'px',
			'width' : iframeWidth + 'px'
		});
	})
</script>
</html>