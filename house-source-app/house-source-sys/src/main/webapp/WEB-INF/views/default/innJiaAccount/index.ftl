<#include "/frame/_layout.ftl"/>
<@layout page_tab="innJiaAccount">


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
					<label class="control-label">身份证号码：</label>
					<div>
						<input type="text" class="form-control" name="idCard" value="${search.idCard}" size="25" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label">手机号码：</label>
					<input type="text" class="form-control" name="mobile" value="${search.mobile}" size="25" />
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
					<label class="control-label">会员状态：</label>
					<select name="status" class="form-control">
						<option value="AVAILABLE" <#if search.status=='AVAILABLE'> selected="selected"</#if>>可用</option>
						<option value="FORBID" <#if search.status=='FORBID'> selected="selected"</#if>>禁止</option>
						<option value="DELETE" <#if search.status=='DELETE'> selected="selected"</#if>>删除</option>
					</select>	
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
    			<div class="form-group" style="margin-left:10px;">
					<form id="search-bar">
						<input type="text" class="form-control" name="accountOpenId" value="" placeholder="通行证账号"/>	
						<input type="text" class="form-control" name="idCard" value="" placeholder="身份证号码"/>
						<input type="text" class="form-control" name="mobile" value="" placeholder="手机号码"/>
						<input type="text" class="form-control" name="email" value="" placeholder="电子邮箱"/>																		
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
        url:"${basePath}/admin/innJiaAccount/list.do",        
        tableId:"table",
        //addurl:"${basePath}/admin/innJiaAccount/projectInfo.do",//添加界面url,实现添加不可少        
        updateurl:"${basePath}/admin/innJiaAccount/update.do",//更新url，实现更新不可少
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
				name: 'loginName',
				index: 'loginName',
				label: '会员名称',
				width: 150
			},
			{
				name: 'bindingMobile',
				index: 'bindingMobile',
				label: '手机号码',
				width: 150				
			},
			{
				name: 'nickName',
				index: 'nickName',
				label: '昵称',
				width: 150
			},
			{
				name: 'idCard',
				index: 'idCard',
				label: '身份证',
				width: 200
			},
			{
				name: 'sex',
				index: 'sex',
				label: '性别',
				width: 50
			},
			{
				name: 'createTime',
				index: 'createTime',
				label: '注册时间',
				width: 200				
			},
			{
				name: 'roleTitle',
				index: 'roleTitle',
				label: '会员角色',
				width: 200,
				date:true
			},
			{
				name: 'lastLoginIp',
				index: 'lastLoginIp',
				label: '最后登录IP地址',
				width: 200				
			},			
			{
				name: 'thirdPartyInnJiaAccountType',
				index: 'thirdPartyInnJiaAccountType',
				label: '已绑定第三方',
				width: 200				
			},
			
			
			{
				name: 'edit_btn',
				index: '',
				label: '操作',
				width:400,
				formatter: function (value, grid, rows, state) {
					var editBtn = "<a option='modalEdit' href='${basePath}/admin/innJiaAccount/detail.do?navTabId=editMemberInfo&id=" + rows.id +"' class='btn btn-default btn-xs'><i class='glyphicon glyphicon-edit'></i> 详情 </a>";					
					var unbindMobileBtn = "<a option='dialogCheck' href='${basePath}/admin/innJiaAccount/unbindMobile.do?navTabId=editMemberInfo&accountOpenId=" + rows.accountOpenId +"&bindingMobile=" + rows.bindingMobile+"' class='btn btn-primary btn-xs'><i class='glyphicon glyphicon-log-out'></i>手机解绑</a>";					
					var changeMobileBtn = "<a option='modalEdit' href='${basePath}/admin/innJiaAccount/changeMobile.do?navTabId=editMemberInfo&id=" + rows.id +"&accountOpenId=" + rows.accountOpenId +"&mobileNumber=" + rows.bindingMobile+"' class='btn btn-primary btn-xs'><i class='glyphicon glyphicon-random'></i>手机改绑</a>";					
					var smsPwdMobileBtn = "<a option='dialogCheck' href='${basePath}/admin/innJiaAccount/smsNewPassword.do?navTabId=editMemberInfo&id=" + rows.id +"' class='btn btn-primary btn-xs'><i class='glyphicon glyphicon-envelope'></i>发送新密码到手机</a>";					

					var mobile= rows.bindingMobile;
					if(mobile.length>0)	
						return editBtn + " " + unbindMobileBtn+ " " + changeMobileBtn+ " " + smsPwdMobileBtn;
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