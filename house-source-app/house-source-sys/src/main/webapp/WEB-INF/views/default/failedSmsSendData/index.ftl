<#include "/frame/_layout.ftl"/>
<@layout page_tab="failedSmsSendData">
<div id="right-sidebar">
	<div class="sidebar-container">
	<form id="searchForm">
		<div class="ibox-content">
			<a class="pull-right right-sidebar-toggle" aria-expanded="false"><i class="close fa fa-times-circle-o" style="font-size: 25px"></i></a>
			<div class="">&nbsp;</div>
			<div class="common-search">
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
    				<div class="form-group" style="margin-left:10px;">
						<form id="search-bar">
							<input type="text" class="form-control" name="smsSendTo" value="" placeholder="接收号码"/>
							<div class="input-group">
								<select name="sendResult" class="form-control"> 
									<option value="">-- 选择状态  --</option> 
									<option value="SUCCESS">发送成功</option> 
									<option value="FAILURE">发送失败</option>
									<option value="SENDING">正在发送</option>
									<option value="NOTSEND">未发送</option>
									<option value="EXCEPTION">发送异常</option>
								</select>
							</div>
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
        url:"${basePath}/admin/failedSmsSendData/list.do",
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
				hidden:true,
				search:true, 
				stype:'text',
			},
			{
				name:'smsSendsubject',
				index:'smsSendsubject',
				label:'短信表题',
				sortable: false,
				hidden:true,
				align: 'center',
				width:'300'
			},			
			{
				name: 'smsAccountNo',
				index: 'smsAccountNo',
				label: '关联账户ID',
				width: 300
			},
			{
				name: 'projectNo',
				index: 'projectNo',
				label: '项目编码',
				width: 100
			},
			{
				name: 'smsSendTo',
				index: 'smsSendTo',
				label: '接收号码',
				width: 150
			},
			{
				name: 'sendType',
				index: 'sendType',
				label: '短信类型',
				width: 100
			},
			{
				name: 'sendResult',
				index: 'sendResult',
				label: '发送结果',
				width: 100
			},
			{
				name: 'failureReason',
				index: 'failureReason',
				label: '响应结果',
				width: 400
			},
			{
				name: 'resultCode',
				index: 'resultCode',
				label: '状态码',
				width: 100
			},
			{
				name:'sendTime',
				index:'sendTime',
				label:'发送时间',
				sortable: false,
				width:'200'
			},
			{
				name: 'isReSend',
				index: 'isReSend',
				label: '已重发',
				width: 100
			},
			{
				name: 'edit_btn',
				index: '',
				width: 200,
				label: '操作',
				formatter: function (value, grid, rows, state) {
					var editBtn = "<a option='modalDetail' href='${basePath}/admin/failedSmsSendData/detail.do?navTabId=detail&id=" + rows.id +"' class='btn btn-primary btn-sm'><i class='glyphicon glyphicon-info-sign'></i> 详细</a>";
					if(rows.sendResult != "SUCCESS" ){
						editBtn = editBtn + "&nbsp;&nbsp;<a option='reSend' href='${basePath}/admin/failedSmsSendData/sendMsg.do?id=" + rows.id +"' class='btn btn-warning btn-sm'><i class='glyphicon glyphicon-edit'></i> 发送</a>";
					}
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