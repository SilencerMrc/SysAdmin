<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html style="height: 100%;">
<head>
<%@include file="../common/import.jsp"%>
<link href="${ctx }/static/ztree/css/zTreeStyle.css" rel="stylesheet">
<script type="text/javascript"
	src="${ctx }/static/ztree/js/jquery.ztree.core.min.js"></script>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

.input-group-addon, .panel-body {
	background: #ECF0F5 !important;
}

.tree-panel, .tree-panel-right {
	margin-top: 10px;
	padding: 0px;
}

.tree-panel-right {
	margin-left: 36px;
}

.node_name, .zTreeDemoBackground, .left {
	text-overflow: ellipsis;
}

.my-add {
	position: fixed;
	width: 95%;
	top: 50px;
	height: 30px;
}

.content-bottom {
	position: fixed;
	width: 100%;
	top: 80px;
}

.panel-body {
	overflow: auto;
}

tr {
	border-top: 0px;
	border-bottom: 2px solid #F5F5F5;
}

.table-hover>tbody>tr:hover {
	background: #1C86EE;
}
</style>
<SCRIPT type="text/javascript">
	var setting = {
		view : {
			selectedMulti : true
		},
		async : {
			enable : true,
			url : "${ctx}/sys/file/tree",
			autoParam : [ "name", "path" ],
			dataFilter : filter
		},
		callback : {
			onClick : showFiles,
		}
	};

	function showFiles(event, treeId, treeNode) {
		var ztree = $.fn.zTree.getZTreeObj("tree");
		var expandFlag = treeNode.open;
		ztree.expandNode(treeNode, !expandFlag, false, true);
		$("#gridTitle").text(treeNode.path);
		$("#input-path").val(treeNode.path);
		$.get('${ctx}/sys/file/list', {
			'path' : treeNode.path
		}, function(files) {
			var htmlStr = "";
			$.each(files, function(i, file) {
				var className = file.type == 'floder' ? 'fa fa-folder' : 'fa fa-file';
				var tdClass = file.type == 'floder' ? 'td-folder' : 'td-file';
				htmlStr += '<tr><td class="'+tdClass+'" path="'+file.path+'"><i class="'+className+'"></i> ' + file.name + '</td><td>'
						+ file.updateTime + '</td><td>' + file.type + '</td><td>' + file.size + '</td></tr>';
			})
			$('tbody').html(htmlStr);
		});
	}

	function filter(treeId, parentNode, childNodes) {
		if (!childNodes)
			return null;
		for (var i = 0, l = childNodes.length; i < l; i++) {
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
		}
		return childNodes;
	}

	$(document).ready(function() {
		$.fn.zTree.init($("#tree"), setting);

		$('.content-bottom').css('height', $('.content').height() - 30 + 'px');
		$('.panel-body').css('height', $('.content-bottom').height() - $(".panel-heading").height() - 30 + 'px');
	});
</SCRIPT>
</head>
<body style="height: 100%;">
	<section class="content-header">
		<h1 style="margin-top: -7px;">
			41uLove<small>后台管理系统 </small>
		</h1>
		<ol class="breadcrumb" style="margin-top: -7px;">
			<li><a href="${ctx }/sys/index"><i class="fa fa-dashboard"></i>
					首页</a></li>
			<li class="active">系统设置</li>
			<li class="active">文件管理</li>
		</ol>
	</section>
	<div style="height: 15px;"></div>
	<section class="content">
		<div class="input-group input-group-sm my-add">
			<div class="input-group-addon">地址栏：</div>
			<input id="input-path" type="text" class="form-control" placeholder="输入路径跳转">
			<span class="input-group-btn">
				<button type="button" class="btn btn-info btn-flat">Go!</button>
			</span>
		</div>
		<div class="content-bottom">
			<div class="col-md-3 col-xs-3 tree-panel">
				<div class="panel panel-default">
					<div class="panel-heading"
						style="font-size: 12px; padding: 5px 15px">
						<i class="fa fa-bars"></i> 文件树目录
					</div>
					<div class="panel-body">
						<div class="zTreeDemoBackground left">
							<ul id="tree" class="ztree"></ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8 col-xs-8 tree-panel-right ">
				<div class="panel panel-default">
					<div class="panel-heading"
						style="font-size: 12px; padding: 5px 15px">
						<i class="fa fa-folder-open"></i> <span id="gridTitle">文件详情</span>
					</div>
					<div class="panel-body" style="padding: 0px 2px;">
						<table class="table table-hover table-condensed">
							<thead>
								<tr>
									<th class="col-sm-6">名称</th>
									<th class="col-sm-3">修改时间</th>
									<th class="col-sm-2">类型</th>
									<th class="col-sm-1">大小</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
</body>
</html>