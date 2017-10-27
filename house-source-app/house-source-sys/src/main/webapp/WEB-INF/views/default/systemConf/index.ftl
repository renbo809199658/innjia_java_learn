<#include "/frame/_layout.ftl"/>
<@layout page_tab="systemConf">


<div id="right-sidebar">
	<form id="searchForm" >
	<div class="sidebar-container">
		<div class="ibox-content">
			<a class="pull-right right-sidebar-toggle" aria-expanded="false"><i class="close fa fa-times-circle-o" style="font-size: 25px"></i></a>
			<div class="">&nbsp;</div>
			<div class="common-search">
			
				<div class="form-group">
					<label class="control-label">参数名称：</label>
					<div>
						<input type="text" class="form-control" name="accountOpenId" value="${search.paramKey}" size="25" />
					</div>
				</div>	
										
				<div class="form-group">
					<label class="control-label">参数内容：</label>
					<div>
						<input type="text" class="form-control" name="idCard" value="${search.paramValue}" size="25" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label">参数备注说明：</label>
					<div>
						<input type="text" class="form-control" name="idCard" value="${search.remark}" size="25" />
					</div>
				</div>
				
				<div class="form-group">					
					<label class="control-label">排序条件：</label>
					<select name="orderField" class="form-control">
						<option value="createTime" <#if search.orderField=='createTime'> selected="selected"</#if>>创建日期</option>
						<option value="lastLoginTime" <#if search.orderField=='lastLoginTime'> selected="selected"</#if>>最后登陆时间</option>
					</select>
					<p></p>
					<label class="radioButton"><input name="ord" type="radio" value="asc"  checked/>降序</label>
					<label class="radioButton"><input name="ord" type="radio" value="desc" />升序</label>					
				</div>				
				<div class="form-group">
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
    		    <a option="modalAdd" href="${basePath}/admin/systemConf/add.do?navTabId=saveSystemConf" class="btn btn-outline btn-default" type="button"><i class="fa fa-plus"></i> 新建</a>
				<a option="selectDelete" href="${basePath}/admin/systemConf/batchDelete.do?navTabId=${navTabId}" class="btn btn-outline btn-default" type="button" ><i class="fa fa-trash"></i> 删除</a>
				<a option="selectModalEdit" href="${basePath}/admin/systemConf/edit.do?navTabId=editSystemConf&id={sid_obj}" class="btn btn-outline btn-default" type="button"><i class="fa fa-paste"></i> 编辑</a>
				
    		
    			<div class="form-group" style="margin-left:10px;">
					<form id="search-bar">
						<input type="text" class="form-control" name="paramKey" value="" placeholder="参数名称"/>	
						<input type="text" class="form-control" name="paramValue" value="" placeholder="参数内容"/>
						<input type="text" class="form-control" name="remark" value="" placeholder="参数备注说明"/>
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

function search(formId) {
	var formData = $("#" + formId).serializeObject();
	var params = common_jqgrid.createQueryParams(formData);
	common_jqgrid.reloadTable(params);
}
	var options = {
		url:"${basePath}/admin/systemConf/list.do",
        tableId:"table",
        addurl:"${basePath}/admin/systemConf/add.do",//添加界面url,实现添加不可少
        editurl:"${basePath}/admin/systemConf/edit.do",//编辑界面url，实现编辑不可少
        updateurl:"${basePath}/admin/systemConf/update.do",//更新url，实现更新不可少
        deleteurl:"${basePath}/admin/systemConf/batchDelete.do",//删除url，实现删除不可少
        pager:"#pager",	

        prmNames: {
             		sort: "sort",
             		ord: "order",
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
				name: 'paramKey',
				index: 'paramKey',
				label: '参数名称',
				width: 300
			},
			{
				name: 'paramValue',
				index: 'paramValue',
				label: '参数内容',
				width: 550
			},
			{
				name: 'remark',
				index: 'remark',
				label: '参数备注说明',
				width: 570
			},
			{
				name: 'edit_btn',
				index: '',
				label: '操作',
				width: 200,
				formatter: function (value, grid, rows, state) {
					var editBtn = "<a option='modalEdit' href='${basePath}/admin/systemConf/detail.do?navTabId=editMemberInfo&id=" + rows.id +"' class='btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 详情 </a>";					
					
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