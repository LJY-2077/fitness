<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">


<title>用户列表</title>

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
	<table id="userDateTable" class="easyui-datagrid" toolbar="#toolbar"
		singleSelect="true" fitColumns="true">

		<thead data-options="frozen:true"></thead>
	</table>

	<div id="toolbar">
		<div style="margin-bottom: 5px">
			<a href="javaScript:void(0);" class="easyui-linkbutton"
				iconCls="icon-add" plain="true" onclick="newUser()">添加</a> <a
				href="javaScript:void(0);" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a> <a
				href="javaScript:void(0);" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true" onclick="deleteData()">删除</a>


		</div>
		<div>
			Date From: <input class="easyui-datebox" style="width: 80px">
			To: <input class="easyui-datebox" style="width: 80px">
			Language: <input class="easyui-combobox" style="width: 100px"
				url="data/combobox_data.json" valueField="id" textField="text">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
		</div>

	</div>
	<div id="wu-dialog-2" class="easyui-dialog"
		data-options="closed:true,iconCls:'icon-save'"
		style="width: 400px; padding: 10px;">
		<form id="wu-form-2" class="easyui-form" method="post"
			data-options="novalidate:true" enctype="multipart/form-data">
			<table>
				<tr>
					<td width="60" align="right">姓 名:</td>
					<td><input class="easyui-validatebox" type="text" name="name"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td align="right">昵 称:</td>
					<td><input type="text" name="nickName" /></td>
				</tr>
				<tr>
					<td align="right">性別:</td>
					<td><input type="text" name="gender" /></td>
				</tr>
				<tr>
					<td align="right">电 话:</td>
					<td><input type="text" name="tel" /></td>
				</tr>
				<tr>
					<td align="right">头像:</td>
					<td><input type="file" name="file" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="wu-dialog-3" class="easyui-dialog"
		data-options="closed:true,iconCls:'icon-edit'"
		style="width: 400px; padding: 10px;">
		<form id="wu-form-3" class="easyui-form"
			data-options="novalidate:true" method="post"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td width="60" align="right">姓 名:</td>
					<td><input class="easyui-validatebox" type="hidden" name="id"
						data-options="required:true" /> <input class="easyui-validatebox"
						type="text" name="name" data-options="required:true" /></td>
				</tr>
				<tr>
					<td align="right">昵 称:</td>
					<td><input type="text" name="nickName" /></td>
				</tr>
				<tr>
					<td align="right">性別:</td>
					<td><input type="text" name="gender" /></td>
				</tr>
				<tr>
					<td align="right">电 话:</td>
					<td><input type="text" name="tel" /></td>
				</tr>
				<tr>
					<td align="right">头像:</td>
					<td><input class="easyui-textbox" type="hidden"
						name="headIcon" data-options="required:true" /> <input
						type="file" name="file" /></td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		$(function() {
			userdata();
		})

		// 	表格数据
		function userdata() {
			$('#userDateTable')
					.datagrid(
							{
								url : '${pageContext.request.contextPath}/user/queryUserList',
								title : '用戶列表',
								fit:true,
								fitColumns : false,// 自适应宽度，占满,不能和冻结列同时设置成true
								autoRowHeight : true,// 自动行高度
								striped : true, // 斑马线效果
								idField : '', // 主键列
								loadMsg : '正在加载数据请稍后...',
								nowrap : true,// 设置为true 有利于提高性能
								rownumbers : true, // 显示行号
								frozen : true,//冻结行
								singleSelect : false, // 是否单选
								pagination : true,
								pageList : [5, 10, 15, 20],// 每页行数选择列表
								pageSize : 5, // 设置默认初始的每页行数rows
								pageNumber : 1,// 设置默认初始的页码page
								remoteSort : false, // 是否服务器端排序，设成false才可以在页面进行排序
								// sortName:'sname', //指定列名可以进行排序
								sortable : true,
								multiSort : true,
								//冻结列
								frozenColumns : [[

										{
											field : "headIcon",
											title : '头像',
											width : 80,
											formatter : function(value, row) {
												var str = "";
												if (value != ""
														|| value != null) {
													str = "<img style=\"height: 80px;width: 80px;\" src=\"${pageContext.request.contextPath}"
												+ value + "\"/>";
													return str;
												}
											}
										}, {
											field : "name",
											title : '姓名',
											width : 80
										}]],
								columns : [[
										{
											field : 'headIcon',
											title : '头像',
											width : 80,
											formatter : function(value, row) {
												var str = "";
												if (value != ""
														|| value != null) {
													str = "<img style=\"height: 80px;width: 80px;\" src=\"${pageContext.request.contextPath}"
														+ value + "\"/>";
													return str;
												}
											}
										},{
											field : "headIcon",
											title : '头像',
											width : 80,
											formatter : function(value, row) {
												var str = "";
												if (value != ""
														|| value != null) {
													str = "<img style=\"height: 80px;width: 80px;\" src=\"${pageContext.request.contextPath}"
												+ value + "\"/>";
													return str;
												}
											}
										},{
											field : "headIcon",
											title : '头像',
											width : 80,
											formatter : function(value, row) {
												var str = "";
												if (value != ""
														|| value != null) {
													str = "<img style=\"height: 80px;width: 80px;\" src=\"${pageContext.request.contextPath}"
												+ value + "\"/>";
													return str;
												}
											}
										},{
											field : "headIcon",
											title : '头像',
											width : 80,
											formatter : function(value, row) {
												var str = "";
												if (value != ""
														|| value != null) {
													str = "<img style=\"height: 80px;width: 80px;\" src=\"${pageContext.request.contextPath}"
												+ value + "\"/>";
													return str;
												}
											}
										}, {
											field : 'name',
											title : '姓名',
											width : 80
										}, {
											field : 'nickName',
											title : '昵称',
											width : 80,
											sortable : true
										}, {
											field : 'gender',
											title : '性别',
											width : 80,
											align : 'right',
											sortable : true
										}, {
											field : 'tel',
											title : '电话',
											width : 80,
											align : 'right',
											sortable : true
										}, {
											field : 'gmtCreate',
											title : '创建时间',
											width : 80,
											sortable : true
										}, {
											field : 'gmtModify',
											title : '修改时间',
											width : 80,
											align : 'center'
										}]],
								view : detailview,
								detailFormatter : function(rowIndex, rowData) {
									return '<table  class="easyui-datagrid" style="text-align: center;" title="详细信息" ><tr>'
											+ '<td  style="border:1"><img width="100px" src="${pageContext.request.contextPath}'
										+ rowData.headIcon
										+ '"></td>'
											+ '<td style="border:1">'
											+ '<p>姓名: '
											+ rowData.name
											+ '</p>'
											+ '</td>'
											+ '<td style="border:1">'
											+ '<p>电话: '
											+ rowData.tel
											+ '</p>'
											+ '</td></tr></table>';
								}
							});
		}

		//表格图片显示
		function showImg(value, row, index) {
			if (row.headIcon) {
				return "<img style='width:100px;height:100px;' border='1' src='${pageContext.request.contextPath}"
					+ row.headIcon + "'/>";
			}
		}
		//用户添加
		function newUser() {
			$('#wu-dialog-2')
					.dialog(
							{
								closed : false,
								modal : true,
								title : "添加信息",
								buttons : [
										{
											text : '确定',
											iconCls : 'icon-ok',
											handler : function() {
												$('#wu-form-2')
														.form(
																'submit',
																{
																	url : '${pageContext.request.contextPath}/user/save',
																	onSubmit : function() {
																		return $(
																				this)
																				.form(
																						"enableValidation")
																				.form(
																						'validate');
																	},
																	success : function(
																			data) {
																		$(
																				'#userDateTable')
																				.datagrid(
																						'reload');
																		$(
																				'#wu-dialog-2')
																				.dialog(
																						'close');
																	}
																});

												// $('#wu-form-2').form('submit');
											}
										},
										{
											text : '取消',
											iconCls : 'icon-cancel',
											handler : function() {
												$('#wu-dialog-2').dialog(
														'close');
											}
										}]
							});;
		}

		function editUser() {
			var row = $('#userDateTable').datagrid("getSelections");
			if ($(row).length < 1 || $(row).length > 1) {
				alert("请选择要查看的记录，只能选取单行！");
				return;
			}
			$('#wu-form-3').form('load', {
				id : row[0].id,
				name : row[0].name,
				nickName : row[0].nickName,
				gender : row[0].gender,
				tel : row[0].tel,
				headIcon : row[0].headIcon,
			});

			$('#wu-dialog-3')
					.dialog(
							{
								closed : false,
								modal : true,
								title : "编辑信息",
								buttons : [
										{
											text : '确定',
											iconCls : 'icon-ok',
											handler : function() {
												$('#wu-form-3')
														.form(
																'submit',
																{
																	url : '${pageContext.request.contextPath}/user/update',
																	onSubmit : function() {
																		return $(
																				this)
																				.form(
																						"enableValidation")
																				.form(
																						'validate');
																	},
																	success : function(
																			data) {
																		$(
																				'#userDateTable')
																				.datagrid(
																						'reload');
																		$(
																				'#wu-dialog-3')
																				.dialog(
																						'close');
																	}
																});

												// $('#wu-form-2').form('submit');
											}
										},
										{
											text : '取消',
											iconCls : 'icon-cancel',
											handler : function() {
												$('#wu-dialog-3').dialog(
														'close');
											}
										}]
							});;

		}

		function deleteData() {
			var data = $('#userDateTable').datagrid("getSelections");
			//删除 
			var delurl = "${contextPath}/cardGift/cardGift.do?method=deleteCardGift&amp;activeId="
					+ data[0].activeId
					+ "&amp;giftGoodId="
					+ data[0].giftGoodId;
			//发送删除请求
			$.ajax({
				type : "POST",
				dataType : 'json',
				url : delurl,
				success : function(msg) {
					if (msg.success) {
						//保存回调函数使用的数据
						XW_dialog.addData('callbackData', msg.map);
						//删除成功
						XW_dialog.tips(msg.errorMsg, 3);
						deleteCallBack();
					} else {
						XW_dialog.alert('', msg.errorMsg);
					}
				}
			});
		}

		function loadRemote() {
			$('#ff').form('load', 'form_data1.json');
		}
		function clearForm() {
			$('#ff').form('clear');
		}
	</script>
</body>
</html>
