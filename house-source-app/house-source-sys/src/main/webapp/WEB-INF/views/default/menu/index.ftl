<#include "/frame/_layout.ftl"/>
<@layout page_tab="menu">


<div id="right-sidebar">
	<form id="searchForm">
	<div class="sidebar-container">
		<div class="ibox-content">
			<a class="pull-right right-sidebar-toggle" aria-expanded="false"><i class="close fa fa-times-circle-o" style="font-size: 25px"></i></a>
			<div class="">&nbsp;</div>
			<div class="common-search">
				<div class="form-group">
					<label class="control-label">菜单名称：</label>
					<div class="">
						<input type="text" class="form-control" name="menuName" value="${search.menuName}" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">关键字：</label>
					<div class="">
						<input type="text" class="form-control" name="tagName" value="${search.tagName}" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">菜单类型：</label>
					<div class="">
						<select name="menuType" class="form-control">
							<option value="">请选择</option>
							<option value="INTERNAL" <#if search.menuType=='INTERNAL'> selected="selected"</#if>>内部调用</option>
							<option value="EXTERNAL" <#if search.menuType=='EXTERNAL'> selected="selected"</#if>>外部调用</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">所属菜单：</label>
					<div class="">
						${common.getSelectByMenuUpId(search.upId)}
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">排序字符：</label>
					<div class="">
						<input type="text" class="form-control" name="sort" value="${search.sort}" />
					</div>
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
					<label class="control-label">记录状态：</label>
					<div class="">
						<select name="status" class="form-control required">
							<option value="">请选择</option>
							<option value="AVAILABLE" <#if search.status=='AVAILABLE'> selected="selected"</#if>>可用</option>
							<option value="FORBID" <#if search.status=='FORBID'> selected="selected"</#if>>禁止</option>
							<option value="DELETE" <#if search.status=='DELETE'> selected="selected"</#if>>删除</option>
						</select>
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
	</div>
	</form>
</div>


<div class="ibox">
    <div class="ibox-title">
    	<div class="page-toolbar form-inline">
    		<div class="btn-group">
    			<a option="modalAdd" href="${basePath}/admin/menu/add.do?navTabId=saveMenu" class="btn btn-outline btn-default" type="button"><i class="fa fa-plus"></i> 新建</a>
				<a option="selectDelete" href="${basePath}/admin/menu/batchDelete.do?navTabId=${navTabId}" class="btn btn-outline btn-default" type="button" ><i class="fa fa-trash"></i> 删除</a>
				
				<div class="form-group" style="margin-left:10px;">
					<form id="search-bar">
						<input type="text" class="form-control" name="menuName" value="" placeholder="菜单名" />
						<input type="text" class="form-control" name="tagName" value="" placeholder="关键字" />
						<button class="btn btn-primary btn-sm " type="button" onclick="search('search-bar')"> 搜索</button>
					</form>
				</div>
				<a option="selectModalEdit" href="${basePath}/admin/menu/edit.do?navTabId=editMenu&id={sid_obj}" class="btn btn-outline btn-default" type="button"><i class="fa fa-paste"></i> 编辑</a>
			
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
	</div>
</div>

<script>
//搜索
	function search(formId) {
		var formData = $("#" + formId).serializeObject();
		var params = common_jqgrid.createQueryParams(formData);
		common_jqgrid.reloadTable(params);
	}
	
	var options = {
        url:"${basePath}/admin/menu/list.do",
        tableId:"table",
        addurl:"${basePath}/admin/menu/add.do",//添加界面url,实现添加不可少
        editurl:"${basePath}/admin/menu/edit.do",//编辑界面url，实现编辑不可少
        updateurl:"${basePath}/admin/menu/update.do",//更新url，实现更新不可少
        deleteurl:"${basePath}/admin/menu/batchDelete.do",//删除url，实现删除不可少
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
				name: 'menuName',
				index: 'menuName',
				label: '菜单名称',
				width: 200
			},
			{
				name: 'tagName',
				index: 'tagName',
				label: '关键字',
				width: 200
			},
			{
				name: 'menuPath',
				index: 'menuPath',
				label: '跳转路径',
				width: 300
			},
			{
				name: 'level',
				index: 'level',
				label: '菜单等级',
				width: 150
			},
			{
				name: 'upMenuName',
				index: 'upMenuName',
				label: '所属菜单',
				width: 200
			},
			{
				name: 'sort',
				index: 'sort',
				label: '排序',
				width: 150
			},
			{
				name: 'menuType',
				index: 'menuType',
				label: '菜单类型',
				width: 120
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
					var editBtn = "<a option='modalEdit' href='${basePath}/admin/menu/edit.do?navTabId=editMemberInfo&id=" + rows.id +"' class='btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 编辑</a>";
					return editBtn;
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

