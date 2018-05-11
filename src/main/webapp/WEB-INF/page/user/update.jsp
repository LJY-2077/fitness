<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户更新</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<table border="" bordercolor="blue" title="数据表格"  align="center" style="text-align: center;">
		<tr bgcolor="#ffff" >
			<td>序号</td>
			<td>头像</td>
			<td>来源</td>
			<td>昵称</td>
			<td>姓名</td>
			<td>性别</td>
			<td>电话</td>
			<td>创建时间</td>
			<td>修改时间</td>
		</tr>
		<c:forEach items="${list }" var="list" varStatus="vs">
			<tr>
				<td>${vs.count }</td>
				<td><img style="width: 100px;height: 100px;" src="${list.headIcon }" /></td>
				<td>${list.origin }</td>
				<td>${list.nickName }</td>
				<td>${list.name }</td>
				<td>${list.gender }</td>
				<td>${list.tel }</td>
				<td><fmt:formatDate value="${list.gmtCreate }" /></td>
				<td><fmt:formatDate value="${list.gmtModify }" /></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>
