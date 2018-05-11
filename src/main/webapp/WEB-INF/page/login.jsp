<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>系统登录页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="${pageContext.request.contextPath}/statics/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=path%>/statics/easyui/js/jquery-1.8.0.min.js"></script>
<script language="JavaScript"
	src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/cloud.js"
	type="text/javascript"></script>

<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		})
	});
</script>
<script type="text/javascript">
	$(function() {
		$("#loginBtn")
				.click(
						function() {
							var name = $("#name").val();
							var pwd = $("#pwd").val();
							// 			window.location = 'login';
							$
									.ajax({
										type : 'POST',
										url : "${pageContext.request.contextPath}/admin_login",
										data : {
											"name" : name,
											"password" : pwd
										},
										// 				contentType : "applicaiton/json",//发送至服务器数据类型
										dataType : "json",//服务器返回的数据类型
										success : function(data) {
											if (data.status == "1") {
												alert(data.msg);
												window.location = '${pageContext.request.contextPath}/main';
											} else {
												alert(data.msg);
											}

										},
										error : function() {
											alert("系统错误。")
										}
									});

						})

	})
</script>

</head>

<body
	style="background-color:#1c77ac; background-image:url(${pageContext.request.contextPath}/statics/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>


	<div class="logintop">
		<span>欢迎登录后台管理界面平台</span>
		<ul>
			<li><a target="_blank" href="#">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>

	<div class="loginbody">

		<span class="systemlogo"></span>

		<div class="loginbox">
			<form action="">
				<ul>
					<li><input id="name" name="" type="text" class="loginuser"
						value="" placeholder="输入用户名" /></li>
					<li><input id="pwd" name="" type="password" class="loginpwd"
						value="" placeholder="输入密码" /></li>
					<li><input id='loginBtn' type="button" class="loginbtn"
						value="登录" /><label><input name="" type="checkbox"
							value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label></li>
				</ul>
			</form>
		</div>

	</div>

</body>
</html>
