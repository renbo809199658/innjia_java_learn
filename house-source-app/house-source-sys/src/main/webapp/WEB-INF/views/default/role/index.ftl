<#include "/frame/_layout.ftl"/>
<@layout page_tab="role">


<div id="right-sidebar">
	<form id="searchForm" >
	<div class="sidebar-container">
		<div class="ibox-content">
			<a class="pull-right right-sidebar-toggle" aria-expanded="false"><i class="close fa fa-times-circle-o" style="font-size: 25px"></i></a>
			<div class="">&nbsp;</div>
			<div class="common-search">
				<div class="form-group">
					<label class="control-label">角色名称：</label>
					<div>
						<input type="text" class="form-control" name="roleName" value="${search.roleName}" size="25" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label">备注说明：</label>
					<input type="text" class="form-control" name="remark" value="${search.remark}" size="25" />
				</div>
				<div class="form-group">
					<label class="control-label">所属角色</label>
					${common.getSelectByRole("upId",search.id,0)}
				</div>
				<div class="form-group">
					<label class="control-label">角色等级：</label>
					<select name="level" class="form-control">
						<option value="">请选择</option>
						<option value="0" <#if search.level=='0'> selected="selected"</#if>>${common.getRoleLevelStrName(0)}</option>
						<option value="1" <#if search.level=='1'> selected="selected"</#if>>${common.getRoleLevelStrName(1)}</option>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">创建日期：</label>
					<div class="">
						<div class="input-append form-group" >
							<input class="laydate-icon form-control layer-date" id="dateStart" value='${common.toDate((search.dateStart!""),"yyyy-MM-dd HH:mm:ss")}' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" name="dateStart" readOnly style="cursor: pointer; " />
							<span class="limit">-</span>
							<input class="laydate-icon form-control layer-date" id="dateStart" value='${common.toDate((search.dateEnd!""),"yyyy-MM-dd HH:mm:ss")}' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" name="dateEnd" readOnly style="cursor: pointer; " />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">状态：</label>
					<select name="status" class="form-control" style="width: 85px;">
						<option value="">请选择</option>
						<option value="AVAILABLE" <#if search.status=='AVAILABLE'> selected="selected"</#if>>可用</option>
						<option value="FORBID" <#if search.status=='FORBID'> selected="selected"</#if>>禁止</option>
						<option value="DELETE" <#if search.status=='DELETE'> selected="selected"</#if>>删除</option>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">排序条件：</label>
					<select name="orderField" class="form-control">
						<option value="createTime" <#if search.orderField=='createTime'> selected="selected"</#if>>创建日期</option>
						<option value="roleName" <#if search.orderField=='roleName'> selected="selected"</#if>>角色名称</option>
						<option value="level" <#if search.orderField=='level'> selected="selected"</#if>>角色等级</option>
						<option value="upId" <#if search.orderField=='upId'> selected="selected"</#if>>所属角色</option>
					</select>
					<label class="radioButton"><input name="orderDirection" type="radio" value="desc" checked/>降序</label>
					<label class="radioButton"><input name="orderDirection" type="radio" value="asc"/>升序</label>
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
	</div>
	</form>
</div>


<div class="ibox">
    <div class="ibox-title">
    	<div class="page-toolbar form-inline">
    		<div class="btn-group">
    			<div class="form-group" style="margin-left:10px;">
					<form id="search-bar">
						<input type="text" class="form-control" name="roleName" value="" placeholder="角色名" />
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
        url:"${basePath}/admin/role/list.do",
        tableId:"table",
        addurl:"${basePath}/admin/role/add.do",//添加界面url,实现添加不可少
        editurl:"${basePath}/admin/role/edit.do",//编辑界面url，实现编辑不可少
        updateurl:"${basePath}/admin/role/update.do",//更新url，实现更新不可少
        deleteurl:"${basePath}/admin/role/batchDelete.do",//删除url，实现删除不可少
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
				name: 'roleName',
				index: 'roleName',
				label: '角色名称',
				width: 200
			},
			{
				name: 'level',
				index: 'level',
				label: '角色等级',
				width: 150
			},
			{
				name: 'upRoleName',
				index: 'upRoleName',
				label: '所属角色',
				width: 200
			},
			{
				name: 'remark',
				index: 'remark',
				label: '备注',
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
					var editBtn = "<a option='modalEdit' href='${basePath}/admin/role/edit.do?navTabId=editMemberInfo&id=" + rows.id +"' class='btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 编辑</a>";
					var optionBtn = "<a option='' href='${basePath}/admin/role/roleOperator.do?id=" + rows.id +"' class='J_menuItem btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 功能</a>";
					var userBtn = "<a option='' href='${basePath}/admin/role/roleUser.do?id=" + rows.id +"' class='J_menuItem btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 成员</a>";
					return editBtn + " " + optionBtn + " " + userBtn;
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