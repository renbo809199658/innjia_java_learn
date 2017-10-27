<#include "/frame/_layout.ftl"/>
<@layout page_tab="user">

<div id="right-sidebar">
	<div class="sidebar-container">
	<form id="searchForm">
		<div class="ibox-content">
			<a class="pull-right right-sidebar-toggle" aria-expanded="false"><i class="close fa fa-times-circle-o" style="font-size: 25px"></i></a>
			<div class="">&nbsp;</div>
			<div class="common-search">
				<div class="form-group">
					<label class="control-label">账号：</label>
					<div class="">
						<input type="text" class="form-control" name="loginName" value="" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">姓名：</label>
					<div class="">
						<input type="text" id="userName" class="form-control" name="userName" value="" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">手机：</label>
					<div class="">
						<input type="text" id="mobile" class="form-control" name="mobile" value="" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">邮箱：</label>
					<div class="">
						<input type="text" id="email" class="form-control" name="email" value="" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">工号：</label>
					<div class="">
						<input type="text" id="jobNumber" class="form-control" name="jobNumber" value="" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">创建日期：</label>
					<div class="">
						<div class="input-append form-group" >
							<input class="laydate-icon form-control layer-date" id="dateStart" value='' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" name="dateStart" readOnly style="cursor: pointer; " />
							<span class="limit">-</span>
							<input class="laydate-icon form-control layer-date" id="dateStart" value='' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" name="dateEnd" readOnly style="cursor: pointer; " />
						</div>
					</div>
				</div>
				<div class="">
					<button class="btn btn-primary btn-sm col-sm-12" type="button" onclick="search('searchForm')">查询</button>
					<div class="hr-line-dashed col-sm-12"></div>
					<li class="dropdown hidden-xs">
                        <a class="btn btn-danger btn-sm col-sm-12 right-sidebar-toggle" aria-expanded="false">关闭</a>
                    </li>
				</div>
			</div>
		</div>
		</form>
	</div>
</div>

<div class="ibox">
    <div class="ibox-title">
    	<div class="page-toolbar form-inline">
    		<div class="btn-group">
    			<a option="modalAdd" href="${basePath}/admin/user/add.do?navTabId=saveCompanyInfo" class="btn btn-outline btn-default" type="button"><i class="fa fa-plus"></i> 新建</a>
					<a option="selectDelete" href="${basePath}/admin/user/batchDelete.do?navTabId=${navTabId}" class="btn btn-outline btn-default" type="button" ><i class="fa fa-trash"></i> 删除</a>
    				<a option="selectModalEdit" href="${basePath}/admin/user/edit.do?navTabId=editCompanyInfo" class="btn btn-outline btn-default" type="button"><i class="fa fa-paste"></i> 编辑</a>
    			<div class="form-group" style="margin-left:10px;">
					<form id="search-bar">
						<input type="text" class="form-control" name="userName" value="" placeholder="姓名" />
						<input type="text" class="form-control" name="loginName" value="" placeholder="账号" />
						<input type="text" class="form-control" name="mobile" value="" placeholder="手机" />
						<button class="btn btn-primary btn-sm " type="button" onclick="search('search-bar')"> 搜索</button>
					</form>
				</div>
    		</div>
    		<div class="pull-right">
    			<a aria-expanded="false" class="right-sidebar-toggle btn btn-outline btn-default" type="button"><i class="fa fa-search"></i> 更多搜索</a>
    		</div>
    	</div>
    </div>
    <div class="ibox-content">

<div class="pageContent">
	<table id="table"></table>
	<div id="pager"></div>
	
</div>

<script>

	var options = {
        url:"${basePath}/admin/user/list.do",
        tableId:"table",
        addurl:"${basePath }/admin/user/add.do",
        updateurl:"${basePath}/admin/user/update.do",//更新url，实现更新不可少
        deleteurl:"${basePath}/admin/user/batchDelete.do",//删除url，实现删除不可少
        pager:"#pager",
        prmNames: {
             		sort: "sort",
             		order: "order",
             		search: "search"
             	},
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
				width: 200
			},
			{
				name: 'loginName',
				index: 'loginName',
				label: '账户',
				width: 150
			},
			{
				name: 'mobile',
				index: 'mobile',
				label: '手机',
				width: 200
			},
			{
				name: 'email',
				index: 'email',
				label: '邮箱',
				width: 150
			},
			{
				name: 'jobNumber',
				index: 'jobNumber',
				label: '工号',
				width: 150
			},
			{
				name: 'createTime',
				index: 'createTime',
				label: '创建时间',
				width: 200,
				date:true
			},
			{
				name: 'edit_btn',
				index: '',
				label: '操作',
				width: 200,
				formatter: function (value, grid, rows, state) {
					var editBtn = "<a option='modalEdit' href='${basePath}/admin/user/edit.do?id=" + rows.id +"' class='btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 编辑</a>";					
					return editBtn ;
				}
			}
		]
	}
	
	$(function () {
		common_jqgrid.createOptions(options);
		common_jqgrid.init();
    	
	});
</script>

</@layout>