
<div class="ibox">
    <div class="ibox-title">
    	
    </div>
    <div class="ibox-content">
    	<table id="table"></table>
		<div id="pager"></div>
    </div>
</div>

<script>

	var options = {
        url:"${basePath}/admin/user/list.do",
        tableId:"table",
        pager:"#pager",
        colModel: [
			{
				name: 'id',
				index: 'id',
				label: 'id',
				width: 300,
				sorttype: "int",
				hidden:true,
				search:true, 
				stype:'text', 
				searchoptions:{sopt:['eq','cn'],attr:{title:'Select Name'}}
			},
			{
				name: 'userName',
				index: 'userName',
				label: '姓名',
				width: 500
			},
			{
				name: 'loginName',
				index: 'loginName',
				label: '账户',
				width: 500
			},
			{
				name: 'edit_btn',
				index: '',
				label: '操作',
				width: 300,
				formatter: function (value, grid, rows, state) {
					var addBtn = "<button option='' onclick='ajaxConfirmDo(\"" + rows.id +"\")' class='btn btn-default btn-xs'><i class='glyphicon glyphicon-plus'></i>添加1</button>";
					return addBtn ;
				}
			}
		]
	}
	
	$(function () {
		common_jqgrid.createOptions(options);
		common_jqgrid.init();
    	
	});
	
	function ajaxConfirmDo(userId) {
		<#list role.users as user>
			if ("${user.id}" == userId) {
				console.log("已添加");
				common_modals.swalShow("已添加","");
				return false;
			}
		</#list>
		
		var href = "${basePath}/admin/role/addRoleUser.do";
    	var message = "确认添加？";
    	var param = {
    		roleId:"${role.id!}",
    		userId:userId
    	};
    	ajaxConfirm(message,href,param,function(){
    		window.location.reload();//刷新当前页面.
    	});
	}
	
</script>
