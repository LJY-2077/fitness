/**
 * 
 */

$(function() {
	alert($)
})

function showImg(value, row, index) {
	if (row.headIcon) {
		return "<img style='width:100px;height:100px;' border='1' src='${pageContext.request.contextPath}"
				+ row.headIcon + "'/>";
	}
}

function newUser() {
	$('#wu-dialog-2').dialog({
		closed : false,
		modal : true,
		title : "添加信息",
		buttons : [ {
			text : '确定',
			iconCls : 'icon-ok',
			handler : function() {
				$('#wu-form-2').form('submit', {
					url : 'user/save',
					onSubmit : function() {
						// do some check
						// return false to prevent submit;
					},
					success : function(data) {
						$('#userDateTable').datagrid('reload');
						$('#wu-dialog-2').dialog('close');
					}
				});

				// $('#wu-form-2').form('submit');
			}
		}, {
			text : '取消',
			iconCls : 'icon-cancel',
			handler : function() {
				$('#wu-dialog-2').dialog('close');
			}
		} ]
	});
	;
}

function userdate() {
	$('#userDateTable')
			.datagrid(
					{
//						url : '${pageContext.request.contextPath}/user/queryUserList',
						url : path+ 'user/queryUserList',
						title : '用戶列表',
						fitColumns : true,// 自适应宽度，占满,不能和冻结列同时设置成true
						autoRowHeight : true,// 自动行高度
						striped : true, // 斑马线效果
						idField : 'id', // 主键列
						loadMsg : '正在加载数据请稍后...',
						nowrap : true,// 设置为true 有利于提高性能
						rownumbers : true, // 显示行号
						singleSelect : true, // 是否单选
						pagination : true,
						pageList : [ 2, 20, 30, 50 ],// 每页行数选择列表
						pageSize : 10, // 设置默认初始的每页行数rows
						pageNumber : 1,// 设置默认初始的页码page
						remoteSort : false, // 是否服务器端排序，设成false才可以在页面进行排序
						// sortName:'sname', //指定列名可以进行排序
						sortable : true,
						multiSort : true,
						columns : [ [
								{
									field : 'headIcon',
									title : '头像',
									width : 80,
									formatter : function(value, row) {
										var str = "";
										if (value != "" || value != null) {
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
								} ] ],
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
