/**
 * 弹框插件
 * @author fanjunjian
 */
var common_modals = function() {
	

	//圆形滚动条配置
	var opts = {
		  lines: 12, // The number of lines to draw
		  length: 5, // The length of each line
		  width: 3, // The line thickness
		  radius: 5, // The radius of the inner circle
		  color: '#000', // #rbg or #rrggbb
		  speed: 1, // Rounds per second
		  trail: 100, // Afterglow percentage
		  shadow: false, // Whether to render a shadow
		  position: 'relative'
	};
	//打开圆形进度条对话框
	function startLoading() {
		$("#common-modal-with-body .modal-body").append("<div class='text-center' id='my_loading'></div>");
		var target = document.getElementById('my_loading');
    	var spinner = new Spinner(opts).spin(target);
    	$("#common-modal-with-body").modal({backdrop: 'static', keyboard: false});
    	$("#common-modal-with-body").modal('show');
	}
	//取消圆形进度条
	function stopLoading() {
		$("#common-modal-with-body").modal('hide');
		$("#common-modal-with-body .modal-body").empty();
	}
	
	//打开bounce进度条对话框
	function startBounceLoading() {
		$("#common-modal").append('<div class="sk-spinner sk-spinner-three-bounce"><div class="sk-bounce1"></div><div class="sk-bounce2"></div><div class="sk-bounce3"></div></div>');
    	$("#common-modal").modal({backdrop: 'static', keyboard: false});
//    	$("#common-modal").modal('toggle');
	}
	//取消进度条
	function stopBounceLoading() {
		$("#common-modal").modal('hide');
	}
	
	var showModal = function(html) {
		var modal = $("#my-modal-without-body");
		var area = $('#my-modal-without-body div .modal-content');
		area.empty();
		area.html(html);
		modal.modal({
			backdrop:'static',//true:指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
			keyboard: true //true:当按下 escape 键时关闭模态框，设置为 false 时则按键无效。
		});
		//modal.modal('toggle');
	}
	
	var showRemoteModal = function(remoteUrl) {
		var modal = $("#my-modal-without-body");
		modal.modal({
			remote:remoteUrl,//从链接获取远程数据
			backdrop:true,//true:指定一个静态的背景，当用户点击模态框外部时不会关闭模态框。
			keyboard: true //true:当按下 escape 键时关闭模态框，设置为 false 时则按键无效。
		});
		//modal.modal('toggle');
	}
	
	//===========================SweetAlert===============================
	
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
    		callback(result.statusCode,result.message,"success");
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
	
	/*
	 * 根据返回结果显示信息
	 * @param
	 * 	data:服务器返回的json对象数据
	 * 	reloadView:是否刷新页面
	 */
	var swalAlertByStatusCode = function (data,confirmButtonCallback) {
		ajaxDone(data,
			function(status,message,descrip){
				swalAlertByStatus(status,message,descrip,confirmButtonCallback);
			}
		);
	}
	
	/**
	 * 
	 * @param
	 * 	status:服务器返回正确的结果code：200,300,301,500
	 * 	message:正确结果信息
	 * 	descrip：正确结果描述
	 * 	confirmButtonCallback:确定按钮回调
	 */
	var swalAlertByStatus = function(status,message,descrip,confirmButtonCallback) {
		if (status == "200"){
			//成功
			swalSuccessConfirm("成功", message, confirmButtonCallback);
		} else if (status == "300") {
			//失败
			swal("失败", message, "error");
		} else if (status == "301") {
			//超时
			swal("超时", message, "warning");
		}  else if (status == "303") {
			//重新登入
			swalWarningConfirm("重新登入", message, function(){
				location.replace(location.href);
			});
		} else if (status == "500") {
			//出错
			swal("出错", message, "warning");
		} else {
			swal("失败", "操作失败", "warning");
		}
	}
	
	var swalSuccess = function(title,message) {
		swal(title, message, "success");
	}
	
	var swalSuccessConfirm = function(title,message,confirmCallback) {
		swal({
			title: title,
			text: message,
			type: "success",
			showCancelButton: false,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "OK",
			closeOnConfirm: true 
		}, function(){
			if (confirmCallback != null) {
				confirmCallback();
			}
		});
	}
	
	function swalShow(title,message) {
		swal(title, message);
	}
	
	var swalShowConfirm = function(title,message,confirmCallback) {
		swal({
			title: title,
			text: message,
			showCancelButton: false,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "OK",
			closeOnConfirm: true 
		}, function(){
			if (confirmCallback != null) {
				confirmCallback();
			}
		});
	}
	
	var swalInfo = function(title,message) {
		swal(title, message, "info");
	}
	
	var swalInfoConfirm = function(title,message,confirmCallback) {
		swal({
			title: title,
			text: message,
			type: "info",
			showCancelButton: true,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "OK",
			closeOnConfirm: true 
		}, function(){
			if (confirmCallback != null) {
				confirmCallback();
			}
		});
	}
	
	var swalError = function(title,message) {
		swal(title, message, "error");
	}
	
	var swalErrorConfirm = function(title,message,confirmCallback) {
		swal({
			title: title,
			text: message,
			type: "error",
			showCancelButton: true,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "OK",
			closeOnConfirm: true 
		}, function(){
			if (confirmCallback != null) {
				confirmCallback();
			}
		});
	}
	
	var swalWarning = function(title,message) {
		swal(title, message, "warning");
	}
	
	var swalWarningConfirm = function(title,message,confirmCallback) {
		swal({
			title: title,
			text: message,
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#1ab394",
			confirmButtonText: "OK",
			closeOnConfirm: true 
		}, function(){
			if (confirmCallback != null) {
				confirmCallback();
			}
		});
	}
	
	//============================================================================
	
	return {
		swalAlertByStatusCode : swalAlertByStatusCode,
		swalAlertByStatus : swalAlertByStatus,
		
		swalShow : swalShow,
		swalSuccess : swalSuccess,
		swalError : swalError,
		swalWarning : swalWarning,
		swalInfo : swalInfo,
		swalInfoConfirm : swalInfoConfirm,
		swalShowConfirm : swalShowConfirm,
		swalWarningConfirm : swalWarningConfirm,
		swalErrorConfirm : swalErrorConfirm,
		swalSuccessConfirm : swalSuccessConfirm,
		
		showModal : showModal,
		showRemoteModal : showRemoteModal,
		
		startBounceLoading : startBounceLoading,
		stopBounceLoading : stopBounceLoading
	};
	
}(); 

$(function () {
	$('#common-modal').on('show.bs.modal', function () {
		console.log("common-modal show");
	})
	$('#common-modal').on('hide.bs.modal', function () {
		$(this).removeData("bs.modal");
		console.log("common-modal hide");
		$(this).empty();
	})
	
	$('#my-modal-without-body').on('show.bs.modal', function () {
		console.log("my-modal-without-body show");
	})
	$('#my-modal-without-body').on('shown.bs.modal', function () {
		console.log("my-modal-without-body shown");
		//$('#my-modal-without-body div .modal-content').height($('#my-modal-without-body').height());
	})
	$('#my-modal-without-body').on('hide.bs.modal', function () {
		$(this).removeData("bs.modal");
		console.log("my-modal-without-body hide");
		$(this).find(".modal-content").empty();
	})
	
	$('#common-modal-with-body').on('show.bs.modal', function () {
		console.log("common-modal-with-body show");
	})
	$('#common-modal-with-body').on('hide.bs.modal', function () {
		$(this).removeData("bs.modal");
		console.log("common-modal-with-body hide");
		$(this).find(".modal-content").find(".modal-body").empty();
	})
});