
$(function () {
	/**
	 * 注：click事件被绑定前应先.unbind("click")解绑，否则会被多次执行
	 */
	
	//模态框加载新建界面
    $("a[option='modalView']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalView(href);
    });
    
    //模态框加载新建界面
    $("a[option='selectModalView']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalView(href);
    });
	
	//模态框加载新建界面
    $("a[option='modalAdd']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalView(href);
    });
    
    //模态框加载新建界面
    $("a[option='selectModalAdd']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalView(href);
    });
	
	$("a[option='save']").unbind("click").click(function(e){
		e.preventDefault();
		var href = $(this).attr("href");
		common_modals.swalShowConfirm("Save click","路径："+href,function(){
        	
        });
    });
	
	//表格数据添加
	$("a[option='gridAjaxFormSave']").unbind("click").click(function(e){
		e.preventDefault();
    	var url = $("#ajaxForm").attr("action");
    	ajaxFormSubmit(url,function(){
        	window.location.reload();//刷新当前页面.
        });
    });
	
	$("a[option='delete']").unbind("click").click(function(e){
		e.preventDefault();
		var href = $(this).attr("href");
		ajaxGridDelete(href,function(){
        	window.location.reload();//刷新当前页面.
        });
    });
	
	//选择一项或多项后 确认删除数据
	$("a[option='selectDelete']").unbind("click").click(function(e){
		e.preventDefault();
		var href = $(this).attr("href");
		ajaxGridDelete(href,function(){
        	window.location.reload();//刷新当前页面.
        });
    });
    
	//发送短信
	$("a[option='reSend']").unbind("click").click(function(e){
		e.preventDefault();
		var href = $(this).attr("href");
		ajaxDoTang(href,{},function(){
			window.location.reload();//刷新当前页面.
        });
    });
	//根据设定的a标签href跳转到编辑界面
    $("a[option='edit']").unbind("click").click(function(e){
    	var href = $(this).attr("href");
		if (utils.url(href)) {
			$(this).attr("href",href);
		} else {
			e.preventDefault();
			common_modals.swalWarning("非法跳转路径",href);
		}
    	
    });
    
    //选择一项数据后根据设定的a标签href跳转到编辑界面
    $("a[option='selectEdit']").unbind("click").click(function(e){
    	if (ids==null || ids.length==0) {
    		e.preventDefault();
    		swal("请选择", "请选择项目!", "warning");
    	} else if (ids.length > 1) {
    		e.preventDefault();
    		swal("最多一项", "请最多选择一项!", "warning");
    	} else {
    		var href = $(this).attr("href");
			href = utils.changeURLArg(href,'id',ids[0]);
			if (utils.url(href)) {
				$(this).attr("href",href);
			} else {
				e.preventDefault();
				common_modals.swalWarning("非法跳转路径",href);
			}
    	}
    });
    
    //根据设定的a标签href模态框加载编辑界面
    $("a[option='modalEdit']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalView(href);
    });
    
    //选择一项数据后根据设定的a标签href模态框加载编辑界面
    $("a[option='selectModalEdit']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalViewAfterSelect(href);
    });
    
    $("a[option='viewDetail']").unbind("click").click(function(e){
    	if (ids==null || ids.length==0) {
    		e.preventDefault();
    		swal("请选择", "请选择项目!", "warning");
    	} else if (ids.length > 1) {
    		e.preventDefault();
    		swal("最多一项", "请最多选择一项!", "warning");
    	} else {
    		var href = $(this).attr("href");
    		if (utils.url(href)) {
    			href = utils.changeURLArg(href,'id',ids[0]);
    			$(this).attr("href",href);
			} else {
				e.preventDefault();
				common_modals.swalWarning("非法跳转路径",href);
			}
    	}
    });
    
    //模态框加载详情界面
    $("a[option='modalDetail']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalView(href);
    });
    
    //选择一项数据后模态框加载详情界面
    $("a[option='selectModalDetail']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalViewAfterSelect(href);
    });
    
    $("a[option='dialogCheck']").unbind("click").click(function(e){
    	e.preventDefault();
    	var href = $(this).attr("href");
    	ajaxDialogCheck(href,"",function(){
        	window.location.reload();//刷新当前页面.
        });
    });
    
    //模态框加载新建界面
    $("button[option='modalAdd']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalView(href);
    });
    
    //模态框加载新建界面
    $("button[option='selectModalAdd']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalView(href);
    });
    
    $("button[option='save']").unbind("click").click(function(e){
		e.preventDefault();
		var href = $(this).attr("href");
		common_modals.swalShow("save button click",href);
    });
    
    //表格数据添加
	$("button[option='gridAjaxFormSave']").unbind("click").click(function(e){
		e.preventDefault();
    	var url = $("#ajaxForm").attr("action");
    	ajaxFormSubmit(url,function(){
        	window.location.reload();//刷新当前页面.
        });
    });
	
    $("button[option='delete']").unbind("click").click(function(e){
		e.preventDefault();
		var href = $(this).attr("href");
		ajaxGridDelete(href,function(){
        	window.location.reload();//刷新当前页面.
        });
    });
	
	//选择一项或多项后 确认删除数据
	$("button[option='selectDelete']").unbind("click").click(function(e){
		e.preventDefault();
		var href = $(this).attr("href");
		ajaxGridDelete(href,function(){
        	window.location.reload();//刷新当前页面.
        });
    });
    
	//根据设定的a标签href跳转到编辑界面
    $("button[option='edit']").unbind("click").click(function(e){
    	var href = $(this).attr("href");
		if (utils.url(href)) {
			$(this).attr("href",href);
		} else {
			e.preventDefault();
			common_modals.swalWarning("非法跳转路径",href);
		}
    	
    });
    
    //选择一项数据后根据设定的a标签href跳转到编辑界面
    $("button[option='selectEdit']").unbind("click").click(function(e){
    	if (ids==null || ids.length==0) {
    		e.preventDefault();
    		swal("请选择", "请选择项目!", "warning");
    	} else if (ids.length > 1) {
    		e.preventDefault();
    		swal("最多一项", "请最多选择一项!", "warning");
    	} else {
    		var href = $(this).attr("href");
			href = utils.changeURLArg(href,'id',ids[0]);
			if (utils.url(href)) {
				$(this).attr("href",href);
			} else {
				e.preventDefault();
				common_modals.swalWarning("非法跳转路径",href);
			}
    	}
    });
    
    //根据设定的a标签href模态框加载编辑界面
    $("button[option='modalEdit']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
		modalView(href);
    });
    
    //选择一项数据后根据设定的a标签href模态框加载编辑界面
    $("button[option='selectModalEdit']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalViewAfterSelect(href);
    });
    
    $("button[option='viewDetail']").unbind("click").click(function(e){
    	if (ids==null || ids.length==0) {
    		e.preventDefault();
    		swal("请选择", "请选择项目!", "warning");
    	} else if (ids.length > 1) {
    		e.preventDefault();
    		swal("最多一项", "请最多选择一项!", "warning");
    	} else {
    		var href = $(this).attr("href");
    		if (utils.url(href)) {
    			href = utils.changeURLArg(href,'id',ids[0]);
    			$(this).attr("href",href); 
			}else {
				common_modals.swalWarning("非法跳转路径",href);
			}
    	}
    });
    
  //模态框加载详情界面
    $("button[option='modalDetail']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
		modalView(href);
    });
    
    //选择一项数据后模态框加载详情界面
    $("button[option='selectModalDetail']").unbind("click").click(function(e){
    	e.preventDefault();//a标签不默认跳转
    	var href = $(this).attr("href");
    	modalViewAfterSelect(href);
    });
    
    $("button[option='dialogCheck']").unbind("click").click(function(e){
    	e.preventDefault();
    	var href = $(this).attr("href");
    	ajaxDialogCheck(href, "", function(){
        	window.location.reload();//刷新当前页面.
        });
    });
    
    $("button[option='ajaxForm']").unbind("click").click(function(e){
    	e.preventDefault();
    	$(this).attr("type","");
    	var url = $("#ajaxForm").attr("action");
    	ajaxFormSubmit(url, function(){
    		window.location.reload();//刷新当前页面.
	    });
    });
    
    $("button[option='reCallback']").unbind("click").click(function(e){
    	e.preventDefault();
    	$(this).attr("type","");
    	var params = $("input[name='params']").val();
    	var targetUrl = $("input[name='url']").val();
    	var url = "/gateway-sys/admin/scheduleTasks/reCallback.do";
		var json = {params:params,url:targetUrl};
		var jsonStr = JSON.stringify(json);
    	ajaxCallback(url,jsonStr, function(){
    		window.location.reload();//刷新当前页面.
	    });
    });
    
    $("a[option='ajaxForm']").unbind("click").click(function(e){
    	e.preventDefault();
    	var url = $("#ajaxForm").attr("action");
    	ajaxFormSubmit(url, function(){
    		window.location.reload();//刷新当前页面.
	    });
    });
    
    
    //排序
    $("th").click(function(e){
    	if(typeof($(this).attr("orderField"))=="undefined" || $(this).attr("orderField") == "") {
    		e.preventDefault();
    	} else {
    		$("input[name='orderField']").val($(this).attr("orderField"));
    		var orderDirection = $(this).attr("class");
    		if (orderDirection!="undefined" && typeof(orderDirection)!="undefined" && orderDirection != "") {
    			if (orderDirection == "asc") {
    				orderDirection = "desc";
    			} else if (orderDirection == "desc") {
    				orderDirection = "asc";
    			}
    			$("input[name='orderDirection']").val(orderDirection);
    		}
    		$("#pagerForm").submit();
    	}
    });
    
    //fancybox图片预览
    $("a[option='imageView']").click(function(e){
    	e.preventDefault();
    	var href = $(this).attr("ihref");
    	//href="http://pic.baike.soso.com/p/20131213/20131213115637-1062134399.jpg";
    	$("#dialogImageView img").attr("src",href);
    	$("a[option='imageView']").fancybox({'centerOnScroll':true});
    });
    
});
