<#include "/frame/_layout.ftl"/>
<@layout page_tab="moduleFunctionInfo">


<div id="right-sidebar">
	<div class="sidebar-container">
	<form id="searchForm">
		<div class="ibox-content">
			<a class="pull-right right-sidebar-toggle" aria-expanded="false"><i class="close fa fa-times-circle-o" style="font-size: 25px"></i></a>
			<div class="">&nbsp;</div>
			<div class="common-search">
				<div class="form-group">
					<label class="control-label">请求方式：</label>
						<div class="">
						<select name="requestWay" class="form-control" required>
							<option value="">请选择</option>
							<option value="POST">POST</option>
							<option value="GET">GET</option>
							<option value="HEAD">HEAD</option>
							<option value="OPTIONS">OPTIONS</option>
							<option value="PUT">PUT</option>
							<option value="DELETE">DELETE</option>
							<option value="TRACE">TRACE</option>
							<option value="CONNECT">CONNECT</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">请求参数类型：</label>
					<div class="">
						<select name="requestParameterWay" class="form-control" required>
							<option value="">请选择</option>
							<option value="PARAM">PARAM</option>
							<option value="JSON">JSON</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">响应参数类型：</label>
					<div class="">
						<select name="responseParameterWay" class="form-control" required>
							<option value="">请选择</option>
							<option value="JSON">JSON</option>
							<option value="HTML">HTML</option>
						</select>
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
    	<div id="toolbar" class="">
    		<div class="page-toolbar form-inline">
    			<div class="btn-group">
    				<a option="modalAdd" href="${basePath}/admin/moduleFunctionInfo/add.do?navTabId=saveCompanyInfo" class="btn btn-outline btn-default" type="button"><i class="fa fa-plus"></i> 新建</a>
					<a option="selectDelete" href="${basePath}/admin/moduleFunctionInfo/batchDelete.do?navTabId=${navTabId}" class="btn btn-outline btn-default" type="button" ><i class="fa fa-trash"></i> 删除</a>
    				<a option="selectModalEdit" href="${basePath}/admin/moduleFunctionInfo/edit.do?navTabId=editCompanyInfo" class="btn btn-outline btn-default" type="button"><i class="fa fa-paste"></i> 编辑</a>
    				<div class="form-group" style="margin-left:10px;">
						<form id="search-bar">
							<input type="text" class="form-control" name="interfaceName" value="" placeholder="接口名称"/>
							<input type="text" class="form-control" name="applicationName" value="" placeholder="应用名"/>
							<input type="text" class="form-control" name="controllerName" value="" placeholder="请求模块名"/>
							<input type="text" class="form-control" name="methodName" value="" placeholder="调用方法名"/>
							<button class="btn btn-primary btn-sm " type="button" onclick="search('search-bar')"> 搜索</button>
						</form>
					</div>
				</div>
				<div class="pull-right">
					<a class="right-sidebar-toggle btn btn-outline btn-default" aria-expanded="false"><i class="fa fa-search"></i> 更多搜索</a>
				</div>
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
	
	var options = {
        url:"${basePath}/admin/moduleFunctionInfo/list.do",
        tableId:"table",
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
				label: '流水号',
				width: 100,
				sorttype: "int",
				search:true, 
				stype:'text',
			},
			{
				name: 'interfaceName',
				index: 'interfaceName',
				label: '接口名称',
				width: 300
			},
			{
				name: 'applicationName',
				index: 'applicationName',
				label: '应用名',
				width: 150
			},
			{
				name: 'controllerName',
				index: 'controllerName',
				label: '请求模块名',
				width: 250
			},
			{
				name:'methodName',
				index:'methodName',
				label:'调用方法名',
				sortable: false,
				width:'250'
			},
			{
				name: 'requestWay',
				index: 'requestWay',
				label: '请求方式',
				width: 100
			},
			{
				name: 'requestParameterWay',
				index: 'requestParameterWay',
				label: '请求参数类型',
				width: 120
			},
			{
				name: 'responseParameterWay',
				index: 'responseParameterWay',
				label: '响应参数类型',
				width: 120
			},
			{
				name: 'targetUrl',
				index: 'targetUrl',
				label: '目标url',
				width: 500
			},
			{
				name:'createTime',
				index:'createTime',
				label:'创建时间',
				sortable: false,
				width:'200'
			},
			{
				name:'updateTime',
				index:'updateTime',
				label:'更新时间',
				sortable: false,
				width:'200'
			},
			{
				name: 'status',
				index: 'status',
				label: '状态',
				width: 100
			},
			{
				name: 'edit_btn',
				index: '',
				width: 200,
				label: '操作',
				formatter: function (value, grid, rows, state) {
					var editBtn = "<a option='modalEdit' href='${basePath}/admin/moduleFunctionInfo/edit.do?navTabId=editMemberInfo&id=" + rows.id +"' class='btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 编辑</a>";
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