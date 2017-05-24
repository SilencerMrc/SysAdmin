<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="main-sidebar">
	<section class="sidebar">
		<div class="menu-top">
			<div class="user-panel">
				<div class="pull-left image">
					<img src="${ctx }/static/images/photo.png" class="img-circle"
						alt="User Image">
				</div>
				<div class="pull-left info">
					<p>41uLove</p>
					<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
				</div>
			</div>
			<!-- search form -->
			<form action="#" method="get" class="sidebar-form">
				<div class="input-group">
					<input type="text" name="q" class="form-control"
						placeholder="Search..."> <span class="input-group-btn">
						<button type="submit" name="search" id="search-btn"
							class="btn btn-flat">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form>
			<!-- /.search form -->
			<ul class="sidebar-menu">
				<li class="header" style="color: white;">主菜单</li>
			</ul>
		</div>
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="treeview"><a href="#"> <i class="fa fa-dashboard"></i>
					<span>系统设置</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="${ctx }/sys/fileExplorer" onclick="return false;"
						id="11"><i class="fa fa-circle-o"></i>文件管理</a></li>
					<li><a href="#"><i class="fa fa-circle-o"></i> 日志管理</a></li>
				</ul></li>
	</section>
</aside>

