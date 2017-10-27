<#include "/frame/_layout.ftl"/>
<@layout page_tab="innJiaAccountLoginHistory">


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
						<input type="text" class="form-control" name="innJiaAccount.accountOpenId" value="${search.innJiaAccount.accountOpenId}" size="25" />
					</div>
				</div>		
				<div class="form-group">
					<label class="control-label">会员昵称：</label>
					<div class="">
						<div class="input-append form-group" >
							<input type="text" class="form-control" name="innJiaAccount.nickName" value="${search.innJiaAccount.nickName}" size="25" />							
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">身份证号码：</label>
					<div>
						<input type="text" class="form-control" name="innJiaAccount.idCard" value="${search.innJiaAccount.idCard}" size="25" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">项目：</label>
					<div class="">
						${common.getProjectInfo("projectInfo.projectName","")}
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">登录日期：</label>
					<div class="">
						<div class="input-append form-group" >
							<input class="laydate-icon form-control layer-date" id="dateStart" value='${common.toDate((search.dateStart!""),"yyyy-MM-dd HH:mm:ss")}' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" name="dateStart" readOnly style="cursor: pointer; " />
							<span class="limit">-</span>
							<input class="laydate-icon form-control layer-date" id="dateStart" value='${common.toDate((search.dateEnd!""),"yyyy-MM-dd HH:mm:ss")}' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" name="dateEnd" readOnly style="cursor: pointer; " />
						</div>
					</div>
				</div>						
				<div class="form-group">					
					<label class="control-label">排序条件：</label>
					<select name="orderField" class="form-control">
						<option value="createTime" <#if search.orderField=='createTime'> selected="selected"</#if>>登录日期</option>						
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
						<input type="text" class="form-control" name="innJiaAccount.accountOpenId" value="" placeholder="通行证账号"/>
						&nbsp;&nbsp;						
						<input type="text" class="form-control" name="innJiaAccount.nickName" value="" placeholder="会员昵称"/>
						&nbsp;&nbsp;
						${common.getProjectInfo("projectInfo.projectName","")}
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
        url:"${basePath}/admin/innJiaAccountLoginHistory/list.do",        
        tableId:"table",        
        updateurl:"${basePath}/admin/innJiaAccountLoginHistory/update.do",//更新url，实现更新不可少  
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
				name: 'idCard',
				index: 'idCard',
				label: '身份证',
				width: 250
			},
			{
				name: 'number',
				index: 'number',
				label: '手机号',
				width: 150
			},			
			{
				name: 'loginIp',
				index: 'loginIp',
				label: '登录IP',
				width: 150
			},
			{
				name: 'createTime_history',
				index: 'createTime_history',
				label: '登陆时间',
				width: 200,
				date:true
			},
			{
				name: 'projectTitle',
				index: 'projectTitle',
				label: '项目名',
				width: 200				
			},
			{
				name: 'edit_btn',
				index: '',
				label: '操作',
				width: 200,
				formatter: function (value, grid, rows, state) {
					var editBtn = "<a option='modalEdit' href='${basePath}/admin/innJiaAccountLoginHistory/detail.do?navTabId=editMemberInfo&id=" + rows.id +"' class='btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 详情 </a>";										
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