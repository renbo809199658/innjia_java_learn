<#include "/frame/_layout.ftl"/>
<@layout page_tab="innJiaAccountRole">


<div id="right-sidebar">
	<form id="searchForm" >
	<div class="sidebar-container">
		<div class="ibox-content">
			<a class="pull-right right-sidebar-toggle" aria-expanded="false"><i class="close fa fa-times-circle-o" style="font-size: 25px"></i></a>
			<div class="">&nbsp;</div>
			<div class="common-search">							
				<div class="form-group">
					<label class="control-label">通行证账号：</label>
					<div>
						<input type="text" class="form-control" name="accountOpenId" value="${search.accountOpenId}" size="25" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label">会员昵称：</label>
					<input type="text" class="form-control" name="nickName" value="${search.nickName}" size="25" />
				</div>				
				<div class="form-group">
					<label class="control-label">手机号码：</label>
					<div class="">
						<div class="input-append form-group" >
							<input type="text" class="form-control" name="mobile" value="${search.mobile}" size="25" />							
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">会员权限：</label>
					<div class="">
						<div class="input-append form-group" >
							${common.getAccountRole("innjiaAccountRole","")}							
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">电子邮箱：</label>
					<div class="">
						<div class="input-append form-group" >
							<input type="text" class="form-control" name="email" value="${search.email}" size="25" />							
						</div>
					</div>
				</div>						
				<div class="form-group">					
					<label class="control-label">排序条件：</label>
					<select name="orderField" class="form-control">
						<option value="createTime" <#if search.orderField=='createTime'> selected="selected"</#if>>创建日期</option>						
					</select>
					<p></p>
					<label class="radioButton"><input name="ord" type="radio" value="desc"  checked/>降序</label>
					<label class="radioButton"><input name="ord" type="radio" value="asc" />升序</label>					
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
    			<div class="form-group" style="margin-left:10px;">
					<form id="search-bar">
						<input type="text" class="form-control" name="accountOpenId" value="" placeholder="通行证账号"/>
						&nbsp;&nbsp;	
						<input type="text" class="form-control" name="nickName" value="" placeholder="会员昵称"/>
						&nbsp;&nbsp;
						<input type="text" class="form-control" name="mobile" value="" placeholder="手机号码"/>
						&nbsp;&nbsp;
						<input type="text" class="form-control" name="email" value="" placeholder="电子邮箱"/>
						&nbsp;&nbsp;	
						${common.getAccountRole("innjiaAccountRole","")}
						&nbsp;&nbsp;																	
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
        url:"${basePath}/admin/innJiaAccountRole/list.do",        
        tableId:"table",          
        updateurl:"${basePath}/admin/innJiaAccountRole/update.do",//更新url，实现更新不可少
       	multiselect: false,//复选框
        multiboxonly: false,//单选
        pager:"#pager",
        prmNames: {
             		sort: "sort",
             		ord: "order",
             		search: "search"	
             	},
        colModel: [
			{
				name: 'accountOpenId',
				index: 'accountOpenId',
				label: '通行证账号',
				width: 300,				
				search:true, 				 
				searchoptions:{sopt:['eq','cn'],attr:{title:'Select Name'}}
			},			
			{
				name: 'nickName',
				index: 'nickName',
				label: '会员昵称',
				width: 150
			},
			{
				name: 'sex',
				index: 'sex',
				label: '性别',
				width: 50
			},
			{
				name: 'number',
				index: 'number',
				label: '手机号码',
				width: 200
			},
			{
				name: 'address',
				index: 'address',
				label: '住址',
				width: 150
			},
			{
				name: 'email',
				index: 'email',
				label: '电子邮箱',
				width: 200				
			},
			{
				name: 'createTime',
				index: 'createTime',
				label: '权限创建时间',
				width: 200				
			},			
			{
				name: 'roleTitle',
				index: 'roleTitle',
				label: '会员权限',
				width: 200				
			},
			{
				name: 'edit_btn',
				index: '',
				label: '操作',
				width: 200,
				formatter: function (value, grid, rows, state) {
					var editBtn = "<a option='modalEdit' href='${basePath}/admin/innJiaAccountRole/edit.do?navTabId=editMemberInfo&id=" + rows.id +"' class='btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 编辑</a>";					
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