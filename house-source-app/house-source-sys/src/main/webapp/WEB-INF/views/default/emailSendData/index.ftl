<#include "/frame/_layout.ftl"/>
<@layout page_tab="emailSendData">


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
							<input class="laydate-icon form-control layer-date" id="dateEnd" value='' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" name="dateEnd" readOnly style="cursor: pointer; " />
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
							<input type="text" class="form-control" name="sendSubject" value="" placeholder="邮件主题"/>
							<input type="text" class="form-control" name="sendToMail" value="" placeholder="接收地址"/>
							<div class="input-group">
								<select name="sendResult" class="form-control">
									<option value="">-- 选择状态   --</option> 
									<option value="SUCCESS">发送成功</option> 
									<option value="FAILURE">发送失败</option>
									<option value="SENDING">正在发送</option>
									<option value="NOTSEND">未发送</option>
									<option value="EXCEPTION">发送异常</option>
								</select>
							</div>
							<div class="input-group">
								<select id="time" class="form-control" onchange="setStartAndEndTime()"> 
									<option value="">-- 选择时间   --</option> 
									<option value="month">本月</option>
									<option value="quarter">本季度</option>
									<option value="half">半年</option>
									<option value="year">一年</option>
								</select>
								<input id="dateStart2" name="dateStart" type="hidden" value=""/>
								<input id="dateEnd2" name="dateEnd" type="hidden" value=""/>
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
	var now = new Date(); //当前日期 
	var nowYear = now.getYear(); //当前年 
	nowYear += (nowYear < 2000) ? 1900 : 0;
	var nowMonth = now.getMonth(); //当前月 
	
	function setStartAndEndTime(){
		var time = $("#time").val(); 
		if(time == "month"){
			$("#dateStart2").val(getMonthStartDate());
			$("#dateEnd2").val(getMonthEndDate());
		}else if(time == "quarter"){
			$("#dateStart2").val(getQuarterStartDate());
			$("#dateEnd2").val(getQuarterEndDate());
		}else if(time == "half"){
			if((nowMonth + 1) > 6){
				$("#dateStart2").val(nowYear + "-07-01 00:00:00");
				$("#dateEnd2").val(nowYear + "-12-31 23:59:59");
			}else{
				$("#dateStart2").val(nowYear + "-01-01 00:00:00");
				$("#dateEnd2").val(nowYear + "-06-30 23:59:59");
			};
		}else if(time == "year"){
			$("#dateStart2").val(getYear("s",0)+" 00:00:00");
			$("#dateEnd2").val(getYear("e",0)+" 23:59:59");
		}
	}
	//获取本年的开始日期
	function getYear(type, dates) {
	    var dd = new Date();
	    var n = dates || 0;
	    var year = dd.getFullYear() + Number(n);
	    if (type == "s") {
	        var day = year + "-01-01";
	    };
	    if (type == "e") {
	        var day = year + "-12-31";
	    };
	    if (!type) {
	        var day = year + "-01-01/" + year + "-12-31";
	    };
	    return day;
	}
	//获得本月的开始日期 
	function getMonthStartDate(){ 
		var monthStartDate = new Date(nowYear, nowMonth, 1); 
		return monthStartDate.Format("yyyy-MM-dd HH:mm:ss");
	} 
	
	//获得本月的结束日期 
	function getMonthEndDate(){ 
		var monthEndDate = new Date(nowYear, nowMonth, getMonthDays(nowMonth)+1); 
		return monthEndDate.Format("yyyy-MM-dd HH:mm:ss");
	}
	//获得本季度的开始日期 
	function getQuarterStartDate(){ 
		var quarterStartDate = new Date(nowYear, getQuarterStartMonth(), 1); 
		return quarterStartDate.Format("yyyy-MM-dd HH:mm:ss"); 
	} 
	
	//或的本季度的结束日期 
	function getQuarterEndDate(){ 
		var quarterEndMonth = getQuarterStartMonth() + 2; 
		var quarterStartDate = new Date(nowYear, quarterEndMonth, getMonthDays(quarterEndMonth)+1); 
		return quarterStartDate.Format("yyyy-MM-dd HH:mm:ss"); 
	}
	//获得本季度的开始月份 
	function getQuarterStartMonth(){ 
		var quarterStartMonth = 0; 
		if(nowMonth<3){ 
			quarterStartMonth = 0; 
		} 
		if(2<nowMonth && nowMonth<6){ 
			quarterStartMonth = 3; 
		} 
		if(5<nowMonth && nowMonth<9){ 
			quarterStartMonth = 6; 
		} 
		if(nowMonth>8){ 
			quarterStartMonth = 9; 
		} 
		return quarterStartMonth; 
	} 
	//获得某月的天数 
	function getMonthDays(myMonth){ 
		var monthStartDate = new Date(nowYear, myMonth, 1); 
		var monthEndDate = new Date(nowYear, myMonth + 1, 1); 
		var days = (monthEndDate - monthStartDate)/(1000 * 60 * 60 * 24); 
		return days; 
	}
	// 对Date的扩展，将 Date 转化为指定格式的String
	// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
	// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
	// 例子： 
	// (new Date()).Format("yyyy-MM-dd HH:mm:ss.S") ==> 2006-07-02 08:09:04.423 
	// (new Date()).Format("yyyy-M-d H:m:s.S")      ==> 2006-7-2 8:9:4.18 
	Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "H+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
    	if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    	for (var k in o)
    	if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
	
	var options = {
        url:"${basePath}/admin/emailSendData/list.do",
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
				name:'sendSubject',
				index:'sendSubject',
				label:'邮件主题',
				sortable: false,
				align: 'center',
				width:'300'
			},			
			{
				name: 'sendFromMail',
				index: 'sendFromMail',
				label: '发送地址',
				width: 300
			},
			{
				name: 'sendToMail',
				index: 'sendToMail',
				label: '接收地址',
				width: 300
			},
			{
				name: 'sendType',
				index: 'sendType',
				label: '邮件类型',
				width: 100
			},
			{
				name: 'sendResult',
				index: 'sendResult',
				label: '发送结果',
				width: 100
			},
			{
				name: 'projectName',
				index: 'projectName',
				label: '项目名称',
				width: 180
			},
			{
				name:'createTime',
				index:'createTime',
				label:'发送时间',
				sortable: false,
				width:'200'
			},
			{
				name: 'edit_btn',
				index: '',
				width: 200,
				label: '操作',
				formatter: function (value, grid, rows, state) {
					var editBtn = "<a option='modalDetail' href='${basePath}/admin/emailSendData/detail.do?navTabId=detail&id=" + rows.id +"' class='btn btn-primary btn-sm'><i class='glyphicon glyphicon-info-sign'></i> 详细</a>";
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