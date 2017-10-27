<#include "/frame/_layout.ftl"/>
<@layout page_tab="thirdPartyCompanyInfo">


<div id="right-sidebar">
	<div class="sidebar-container">
	<form id="searchForm">
		<div class="ibox-content">
			<a class="pull-right right-sidebar-toggle" aria-expanded="false"><i class="close fa fa-times-circle-o" style="font-size: 25px"></i></a>
			<div class="">&nbsp;</div>
			<div class="common-search">
				<div class="form-group">
					<label class="control-label">项目编号：</label>
					<div class="">
						<input type="text" class="form-control" name="projectNo" value="" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">项目订单号：</label>
					<div class="">
						<input type="text" class="form-control" name="projectOrderId" value="" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">结算账户ID：</label>
					<div class="">
						<input type="text" id="tallyAccountId" class="form-control" name="tallyAccountId" value="" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">订单ID：</label>
					<div class="">
						<input type="text" id="tallyRequestId" class="form-control" name="tallyRequestId" value="" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">一级科目：</label>
					<div class="">
						<input type="text" id="subject1" class="form-control" name="subject1" value="" />
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
    				<a option="modalAdd" href="${basePath}/admin/thirdCompanyInfo/add.do?navTabId=saveCompanyInfo" class="btn btn-outline btn-default" type="button"><i class="fa fa-plus"></i> 新建</a>
					<a option="selectDelete" href="${basePath}/admin/thirdCompanyInfo/batchDelete.do?navTabId=${navTabId}" class="btn btn-outline btn-default" type="button" ><i class="fa fa-trash"></i> 删除</a>
    				<a option="selectModalEdit" href="${basePath}/admin/thirdCompanyInfo/edit.do?navTabId=editCompanyInfo" class="btn btn-outline btn-default" type="button"><i class="fa fa-paste"></i> 编辑</a>
    				<div class="form-group" style="margin-left:10px;">
						<form id="search-bar">
							<input type="text" class="form-control" name="id" value="" placeholder="流水号"/>
							<input type="text" class="form-control" name="companyNumber" value="" placeholder="公司编号"/>
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
        url:"${basePath}/admin/thirdCompanyInfo/list.do",
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
				name:'companyName',
				index:'companyName',
				label:'公司名称',
				sortable: false,
				align: 'center',
				width:'200'
			},
			{
				name:'companyNumber',
				index:'companyNumber',
				label:'公司编码',
				sortable: false,
				align: 'center',
				width:'200'
			},
			{
				name: 'companyAddress',
				index: 'companyAddress',
				label: '公司地址',
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
				width: 150
			},
			{
				name: 'edit_btn',
				index: '',
				width: 200,
				label: '操作',
				formatter: function (value, grid, rows, state) {
					var editBtn = "<a option='modalEdit' href='${basePath}/admin/thirdCompanyInfo/edit.do?navTabId=editMemberInfo&id=" + rows.id +"' class='btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 编辑</a>";
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