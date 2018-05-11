<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<base href="<%=basePath%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright"
	content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
<title>系统管理页面</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/statics/easyui/easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/statics/easyui/css/wu.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/statics/easyui/css/icon.css" />
<script type="text/javascript"
	src="<%=path%>/statics/easyui/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/statics/easyui/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/statics/easyui/js/datagrid-detailview.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/easyui/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/jsp/test/test.js"></script>
<!-- <script type="text/javascript" -->
<%-- 	src="${pageContext.request.contextPath }/statics/jsp/user/user.js"></script> --%>
</head>
<body class="easyui-layout">
	<!-- begin of header -->
	<div class="wu-header"
		data-options="region:'north',border:false,split:true">
		<div class="wu-header-left">
			<h1>
				<em>健身后台管理系统</em>
			</h1>
		</div>
		<div class="wu-header-right">
			<p>
				<strong class="easyui-tooltip" title="2条未读消息">${name }</strong>，欢迎您！
			</p>
			<p>
				<a href="#">网站首页</a>|<a href="#">支持论坛</a>|<a href="#">帮助中心</a>|<a
					href="${pageContext.request.contextPath}/admin_logout">安全退出</a>
			</p>
		</div>
	</div>
	<!-- end of header -->
	<!-- begin of sidebar -->
	<div class="wu-sidebar"
		data-options="region:'west',split:true,border:true,title:'导航菜单'">
		<div class="easyui-accordion" data-options="border:false,fit:true">
			<div title="管理员管理" data-options="iconCls:'icon-application-cascade'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="${pageContext.request.contextPath}/user/view"
						iframe="0">管理列表管理</a></li>
					<li iconCls="icon-users"><a href="javascript:void(0)"
						data-icon="icon-users"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-2.html"
						iframe="0">管理员账号</a></li>
					<li iconCls="icon-user-group"><a href="javascript:void(0)"
						data-icon="icon-user-group"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">管理员分级</a></li>
					<li iconCls="icon-book"><a href="javascript:void(0)"
						data-icon="icon-book"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">管理员权限管理</a></li>
					<li iconCls="icon-cog"><a href="javascript:void(0)"
						data-icon="icon-cog"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">系统参数</a></li>
					<li iconCls="icon-application-osx-error"><a
						href="javascript:void(0)" data-icon="icon-application-osx-error"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">操作日志</a></li>
				</ul>
			</div>
			<div title="引导页管理"
				data-options="iconCls:'icon-application-form-edit'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="layout-3.html" iframe="0">启动引导</a></li>
				</ul>
			</div>
			<div title="用户管理" data-options="iconCls:'icon-creditcards'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="${pageContext.request.contextPath}/user/view"
						iframe="0">学员注册管理</a></li>
					<li iconCls="icon-users"><a href="javascript:void(0)"
						data-icon="icon-users"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">教练注册管理</a></li>
					<li iconCls="icon-user-group"><a href="javascript:void(0)"
						data-icon="icon-user-group"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">密码修改</a></li>
					<li iconCls="icon-book"><a href="javascript:void(0)"
						data-icon="icon-book"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">数据信息</a></li>
					<li iconCls="icon-cog"><a href="javascript:void(0)"
						data-icon="icon-cog"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">学员管理</a></li>
					<li iconCls="icon-application-osx-error"><a
						href="javascript:void(0)" data-icon="icon-application-osx-error"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">学员等级管理</a></li>
					<li iconCls="icon-application-osx-error"><a
						href="javascript:void(0)" data-icon="icon-application-osx-error"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">教练管理</a></li>
				</ul>
			</div>
			<div title="信息管理" data-options="iconCls:'icon-cart'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="layout-3.html" iframe="0">课程管理</a></li>
					<li iconCls="icon-users"><a href="javascript:void(0)"
						data-icon="icon-users"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">课程介绍</a></li>
					<li iconCls="icon-user-group"><a href="javascript:void(0)"
						data-icon="icon-user-group"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">预约管理</a></li>
					<li iconCls="icon-book"><a href="javascript:void(0)"
						data-icon="icon-book"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">定制课程</a></li>
					<li iconCls="icon-cog"><a href="javascript:void(0)"
						data-icon="icon-cog"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">计划列表</a></li>
					<li iconCls="icon-application-osx-error"><a
						href="javascript:void(0)" data-icon="icon-application-osx-error"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">项目细节</a></li>
					<li iconCls="icon-application-osx-error"><a
						href="javascript:void(0)" data-icon="icon-application-osx-error"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">圈子管理</a></li>
				</ul>
			</div>
			<div title="发布管理" data-options="iconCls:'icon-bricks'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="layout-3.html" iframe="0">图片管理</a></li>
					<li iconCls="icon-users"><a href="javascript:void(0)"
						data-icon="icon-users"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">文章管理</a></li>
					<li iconCls="icon-user-group"><a href="javascript:void(0)"
						data-icon="icon-user-group"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">门店管理</a></li>
					<li iconCls="icon-book"><a href="javascript:void(0)"
						data-icon="icon-book"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">学习管理</a></li>
				</ul>
			</div>
			<div title="学员健康数据管理系统" data-options="iconCls:'icon-chart-curve'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="layout-3.html" iframe="0">健康信息采集</a></li>
					<li iconCls="icon-users"><a href="javascript:void(0)"
						data-icon="icon-users"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">评价系统管理</a></li>
					<li iconCls="icon-user-group"><a href="javascript:void(0)"
						data-icon="icon-user-group"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">信息推送</a></li>
				</ul>
			</div>
			<div title="统计系统" data-options="iconCls:'icon-wrench'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="layout-3.html" iframe="0">课程统计报表</a></li>
					<li iconCls="icon-users"><a href="javascript:void(0)"
						data-icon="icon-users"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">私教统计报表</a></li>
				</ul>
			</div>
			<div title="数据管理" data-options="iconCls:'icon-wrench'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="layout-3.html" iframe="0">数据模型建立</a></li>
					<li iconCls="icon-users"><a href="javascript:void(0)"
						data-icon="icon-users"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">数据统计</a></li>
				</ul>
			</div>
			<div title="消息管理" data-options="iconCls:'icon-wrench'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="layout-3.html" iframe="0">消息分类</a></li>
					<li iconCls="icon-users"><a href="javascript:void(0)"
						data-icon="icon-users"
						data-link="${pageContext.request.contextPath}/statics/temp/layout-3.html"
						iframe="0">消息列表</a></li>
				</ul>
			</div>
			<div title="系统对接" data-options="iconCls:'icon-wrench'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="layout-3.html" iframe="0">信息导入</a></li>
				</ul>
			</div>
			<div title="接口对接" data-options="iconCls:'icon-wrench'"
				style="padding: 5px;">
				<ul class="easyui-tree wu-side-tree">
					<li iconCls="icon-chart-organisation"><a
						href="javascript:void(0)" data-icon="icon-chart-organisation"
						data-link="layout-3.html" iframe="0">网易云盾</a></li>
					<li iconCls="icon-users"><a href="javascript:void(0)"
						data-icon="icon-users" data-link="temp/layout-3.html" iframe="0">智能手环接入</a></li>
					<li iconCls="icon-user-group"><a href="javascript:void(0)"
						data-icon="icon-user-group" data-link="temp/layout-3.html"
						iframe="0">短信接口</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- end of sidebar -->
	<!-- begin of main -->
	<div class="wu-main" data-options="region:'center'">
		<div id="wu-tabs" class="easyui-tabs"
			data-options="border:false,fit:true">
			<div title="首页"
				data-options="href:'${pageContext.request.contextPath}/statics/temp/layout-1.html',closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
		</div>
	</div>
	<!-- end of main -->
	<!-- begin of footer -->
	<div class="wu-footer"
		data-options="region:'south',border:true,split:true">&copy; 2013
		Wu All Rights Reserved</div>
	<!-- end of footer -->
	<script type="text/javascript">
	function refresh() {
	 var currentTab = $('#wu-tabs').tabs('getSelected');
	 RefreshTab(currentTab);
		
	}
	
		$(function() {
			$('.wu-side-tree a').bind("click", function() {
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe') == 1 ? true : false;
				addTab(title, url, iconCls, iframe);
			});
		})

		/**
		 * Name 载入树形菜单 
		 */
		$('#wu-side-tree').tree({
			url : 'statics/temp/menu.php',
			cache : false,
			onClick : function(node) {
				var url = node.attributes['url'];
				if (url == null || url == "") {
					return false;
				} else {
					addTab(node.text, url, '', node.attributes['iframe']);
				}
			}
		});

		/**
		 * Name 选项卡初始化
		 */
		$('#wu-tabs').tabs({
			tools : [ {
				iconCls : 'icon-reload',
				border : false,
				handler : function() {
					refresh();
// 					$('#wu-datagrid').datagrid('reload');
				}
			} ]
		});

		/**
		 * Name 添加菜单选项
		 * Param title 名称
		 * Param href 链接
		 * Param iconCls 图标样式
		 * Param iframe 链接跳转方式（true为iframe，false为href）
		 */
		function addTab(title, href, iconCls, iframe) {
			var tabPanel = $('#wu-tabs');
			if (!tabPanel.tabs('exists', title)) {
				var content = '<iframe scrolling="auto" frameborder="0"  src="'
						+ href + '" style="width:100%;height:100%;"></iframe>';
				if (iframe) {
					tabPanel.tabs('add', {
						title : title,
						content : content,
						iconCls : iconCls,
						fit : true,
						cls : 'pd3',
						closable : true
					});
				} else {
					tabPanel.tabs('add', {
						title : title,
						href : href,
						iconCls : iconCls,
						fit : true,
						cls : 'pd3',
						closable : true
					});
				}
			} else {
				tabPanel.tabs('select', title);
			}
		}
		/**
		 * Name 移除菜单选项
		 */
		function removeTab() {
			var tabPanel = $('#wu-tabs');
			var tab = tabPanel.tabs('getSelected');
			if (tab) {
				var index = tabPanel.tabs('getTabIndex', tab);
				tabPanel.tabs('close', index);
			}
		}
		//刷新当前标签Tabs
	    function RefreshTab(currentTab) {
	        var url = $(currentTab.panel('options')).attr('href');
	        $('#wu-tabs').tabs('update', {
	            tab: currentTab,
	            options: {
	                href: url
	            }
	        });
	        currentTab.panel('refresh');
	  }
	</script>
</body>
</html>
