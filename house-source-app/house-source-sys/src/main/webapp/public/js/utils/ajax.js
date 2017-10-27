/**
 * Ajax请求方法二次封装
 */
var common_ajax = function() {
	
	/**
	 * ajax请求并返回结果
	 * @param url
	 * @param data
	 * @param callback
	 * @returns {String}
	 */
	var ajaxFunc = function(url, data, dataType, callback){
		if(dataType == undefined || dataType == null){
			dataType = "html";
		}
		
		var result = "";
		$.ajax({
			type : "post",
			url : encodeURI(encodeURI(url)),
			data : data,
			dataType : dataType,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			async: false,
			cache: false,
			beforeSend: function(XMLHttpRequest){
				common_modals.startBounceLoading();
    		},
    		success: function(data, textStatus){
    			
    			result = data;
				//扩展回调函数
				if( callback != null ){
					callback(result);
				}
    		},
    		complete: function(XMLHttpRequest, textStatus){
    			common_modals.stopBounceLoading();
    		},
    		error: function(XMLHttpRequest, textStatus, errorThrown){
    			common_modals.swalError("加载错误!","");
    		}
		});
		return result;
	}

	
	/**
	 * ajax请求，执行前进行确认
	 */
	var ajaxFuncConfirm = function(message, url, data, dataType, callback) {
		if (message==null){
			message = "确定要这样操作吗？";
		}
		swal({
			title: "",
			text: message,
			type: "info",
			showCancelButton: true,
			cancelButtonText: "取消",
			closeOnCancel: true,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "确定",
			closeOnConfirm: false,
			showLoaderOnConfirm: true
		}, function(){
			ajaxFunc(url, data, dataType, callback);
		});
	};
	
	/**
	 * ajax请求url替换指定div
	 * @param divId 返回替换div
	 * @param url 请求地址
	 * @param data 参数
	 * @param callback 回调
	 */
	var ajaxDiv = function(divId, url, data, callback){
		var result = ajaxFunc(url, data, callback);
		$("#" + divId).html(result);
	}
	
	/**
	 * ajaxForm请求，执行前进行确认
	 */
	var ajaxDivConfirm = function(divId, url, data, callback) {
		swal({
			title: "",
			text: "确定要这样操作吗？",
			type: "info",
			showCancelButton: true,
			cancelButtonText: "取消",
			closeOnCancel: true,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "确定",
			closeOnConfirm: false,
			showLoaderOnConfirm: true
		}, function(){
			ajaxDiv(divId, url, data, callback);
		});
	};
	
	/**
	 * ajax请求url替换主面板内容
	 * @param url 请求地址
	 * @param data 参数
	 * @param callback 回调
	 */
	var ajaxMainPanel = function(url, data, callback){
		var result = ajaxFunc(url, data, callback);
		$("#main-content").html(result);
	}
	
	/**
	 * ajaxForm请求，执行前进行确认
	 */
	var ajaxMainPanelConfirm = function(url, data, callback) {
		swal({
			title: "",
			text: "确定要这样操作吗？",
			type: "info",
			showCancelButton: true,
			cancelButtonText: "取消",
			closeOnCancel: true,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "确定",
			closeOnConfirm: false,
			showLoaderOnConfirm: true
		}, function(){
			ajaxMainPanel(url, data, callback);
		});
	};
	
	/**
	 * ajax请求url替换modal内容
	 * @param modalId modal对话框id
	 * @param url 请求地址
	 * @param data 参数
	 * @param callback 回调
	 */
	var ajaxModal = function(modalId, url, data, callback){
		var result = ajaxFunc(url, data, callback);
		var modal = $("#" + modalId);
		modal.html(result);
    	modal.modal({backdrop: 'static', keyboard: false});
    	modal.modal('show');
	}
	
	/**
	 * ajax请求，执行前进行确认
	 */
	var ajaxModalConfirm = function(modalId, url, data, callback) {
		swal({
			title: "",
			text: "确定要这样操作吗？",
			type: "info",
			showCancelButton: true,
			cancelButtonText: "取消",
			closeOnCancel: true,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "确定",
			closeOnConfirm: false,
			showLoaderOnConfirm: true
		}, function(){
			ajaxModal(modalId, url, data, callback);
		});
	};
	
	/**
	 * ajax提交form求并返回结果
	 * @param divId 返回替换div
	 * @param formId 提交formid
	 * @param callback 回调
	 */
	var ajaxForm = function(formId, dataType, callback){
		if(dataType == undefined || dataType == null){
			dataType = "html";
		}
		
		var result = "";
		$("#" + formId).ajaxSubmit({
			dataType : dataType,
			async: false,
			cache: false,
		    success:  function (data) {
		    	result = data;
		    	
				//扩展回调函数
				if( callback != null ){
					callback();
				}
		    }
		});
		return result;
	}
	
	/**
	 * ajaxForm请求，执行前进行确认
	 */
	var ajaxFormConfirm = function(formId, dataType, callback) {
		swal({
			title: "",
			text: "确定要这样操作吗？",
			type: "info",
			showCancelButton: true,
			cancelButtonText: "取消",
			closeOnCancel: true,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "确定",
			closeOnConfirm: false,
			showLoaderOnConfirm: true
		}, function(){
			ajaxForm(formId, dataType, callback);
		});
	};
	
	/**
	 * ajax提交form替换指定div
	 * @param divId 返回替换div
	 * @param formId 提交formid
	 * @param callback 回调
	 */
	var ajaxFormDiv = function(divId, formId, callback){
		var result = ajaxForm(formId, callback);
		$("#" + divId).html(result);
	}
	
	/**
	 * ajaxFormDiv请求，执行前进行确认
	 */
	var ajaxFormDivConfirm = function(divId, formId, callback) {
		swal({
			title: "",
			text: "确定要这样操作吗？",
			type: "info",
			showCancelButton: true,
			cancelButtonText: "取消",
			closeOnCancel: true,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "确定",
			closeOnConfirm: false,
			showLoaderOnConfirm: true
		}, function(){
			ajaxFormDiv(divId, formId, callback);
		});
	};
	
	/**
	 * ajax提交form替换指定主面板
	 * @param formId 提交formid
	 * @param callback 回调
	 */
	var ajaxFormMainPanel = function(formId, callback){
		var result = ajaxForm(formId, callback);
		$("#main-content").html(result);
	}

	/**
	 * ajaxFormMainPanel请求，执行前进行确认
	 */
	var ajaxFormMainPanelConfirm = function(formId, callback) {
		swal({
			title: "",
			text: "确定要这样操作吗？",
			type: "info",
			showCancelButton: true,
			cancelButtonText: "取消",
			closeOnCancel: true,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "确定",
			closeOnConfirm: false,
			showLoaderOnConfirm: true
		}, function(){
			ajaxFormMainPanel(formId, callback);
		});
	};
	
	/**
	 * ajax请求返回成功
	 * 200:success
	 * 300:failure
	 * 301:timeout
	 * 500:exception
	 * 10000:return error
	 */
	var ajaxDone = function(data,callback) {
		var result = data;
		if(data instanceof Object) {
    	} else {
    		//将字符串返回值转换为json类型
    		result = eval("("+ data +")");
    	}
    	if (result.statusCode == "200"){
    		//成功
    		callback(result.statusCode,result.message,"success",result.data);
    	} else if (result.statusCode == "300") {
    		//失败
    		callback(result.statusCode,result.message,"failure");
    	} else if (result.statusCode == "301") {
    		//超时
    		callback(result.statusCode,result.message,"timeout");
    	}  else if (result.statusCode == "303") {
    		//重新登入
    		callback(result.statusCode,result.message,"relogin");
    	} else if (result.statusCode == "500") {
    		//出错
    		callback(result.statusCode,result.message,"exception");
    	} else {
    		console.log("ajaxDone.result-------->" + result);
    		callback("10000","解析出错","return error");
    	}
	}
	
	/**
	 * ajax请求返回成功
	 * 200:success
	 * 300:failure
	 * 301:timeout
	 * 303:relogin
	 * 500:exception
	 * 10000:return error
	 */
	var ajaxSuccess = function(data,callback) {
		ajaxDone(data,function(statusCode,message,desc,data){
			if (statusCode == "200"){
	    		//成功
	    		callback(message,data);
	    	} else if (statusCode == "300") {
	    		//失败
	    		common_modals.swalError("","处理失败！");
	    	} else if (statusCode == "301") {
	    		//超时
	    		common_modals.swalInfo("","超时！");
	    	}  else if (statusCode == "303") {
	    		//重新登入
	    		common_modals.swalInfoConfirm("","重新登入！",function(){
	    			window.location.reload();//刷新当前页面.
	    		});
	    	} else if (statusCode == "500") {
	    		//出错
	    		common_modals.swalError("","处理出错！");
	    	} else {
	    		common_modals.swalError("","解析出错！");
	    	}
		});
		
	}
	
	return {
		ajaxFunc : ajaxFunc,
		ajaxFuncConfirm : ajaxFuncConfirm,
		
		ajaxDiv : ajaxDiv,
		ajaxDivConfirm : ajaxDivConfirm,
		
		ajaxMainPanel : ajaxMainPanel,
		ajaxMainPanelConfirm : ajaxMainPanelConfirm,
		
		ajaxModal : ajaxModal,
		ajaxModalConfirm : ajaxModalConfirm,
		
		ajaxForm : ajaxForm,
		ajaxFormConfirm : ajaxFormConfirm,
		
		ajaxFormDiv : ajaxFormDiv,
		ajaxFormDivConfirm : ajaxFormDivConfirm,
		
		ajaxFormMainPanel : ajaxFormMainPanel,
		ajaxFormMainPanelConfirm : ajaxFormMainPanelConfirm,
		
		ajaxDone : ajaxDone,
		ajaxSuccess : ajaxSuccess
	};
	
}();

$(function () {
	
});

