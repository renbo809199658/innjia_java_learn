
/**
 * 通过remoteurl加载模态框添加界面
 * @param href
 */
function modalView(href) {
	common_modals.showRemoteModal(href);
}

/**
 * 选择一项数据后 通过remoteurl加载模态框添加界面
 * @param href
 */
function modalViewAfterSelect(href) {
	if (ids==null || ids.length==0) {
		common_modals.swalWarning("请选择需要操作的数据！","");
	} else if (ids.length > 1) {
		common_modals.swalWarning("请最多选择一项操作的数据！","");
	} else {
		href = utils.changeURLArg(href,'id',ids[0]);
		modalView(href);
	}
}

/**
 * ajax 删除表格数据
 * @param href
 */
function ajaxGridDelete(href,confirmButtonCallback) {
	if (ids==null || ids.length==0) {
		common_modals.swalWarning("请选择需要操作的数据！","");
	} else {
		var param = {
				ids:ids
			};
		common_ajax.ajaxFuncConfirm("", href,param,"json",
			function(result){
				common_modals.swalAlertByStatusCode(result,function(){
					if (confirmButtonCallback != null) {
						confirmButtonCallback();
					}
		    });
		});
		
	}
}

/**
 * ajax 表单提交
 * @param url
 */
function ajaxFormSubmit(url,confirmButtonCallback){
	if (!$("#ajaxForm").valid()) {
		return;
	}
	var result = common_ajax.ajaxFunc(url,$("#ajaxForm").serialize(),"json");
	common_modals.swalAlertByStatusCode(result,function(){
		if (confirmButtonCallback != null) {
			confirmButtonCallback();
		}
    });
	
}

/**
 * ajax 提交
 * @param url
 */
function ajaxSubmit(url,confirmButtonCallback){
	var result = common_ajax.ajaxFunc(url,"","json");
	common_modals.swalAlertByStatusCode(result,function(){
		if (confirmButtonCallback != null) {
			confirmButtonCallback();
		}
    });
	
}

/**
 * 用户点击确认后ajax提交
 * @param href
 * @param params
 * @param confirmButtonCallback
 */
function ajaxDo(href,params,confirmButtonCallback) {
	common_ajax.ajaxFunc(href,params,"json",function(result){
		common_modals.swalAlertByStatusCode(result,function(){
			if (confirmButtonCallback != null) {
				confirmButtonCallback();
			}
        });
	});
}

/**
 * 用户点击确认后ajax提交
 * @param href
 * @param params
 * @param confirmButtonCallback
 */
function ajaxDoTang(href,params,confirmButtonCallback) {
	var result = common_ajax.ajaxFunc(href,params,"json",function(data){
		var result = data;
		if(data instanceof Object) {
    	} else {
    		//将字符串返回值转换为json类型
    		result = eval("("+ data +")");
    	}
		common_modals.swalShowConfirm("发送结果",result.message,function(){
			window.location.reload();//刷新当前页面.
        });
	});
}

/**
 * 用户点击确认后ajax提交
 * @param href
 * @param params
 * @param confirmButtonCallback
 */
function ajaxDialogCheck(href,params,confirmButtonCallback) {
	common_ajax.ajaxFuncConfirm("", href,params,"json",function(result){
		common_modals.swalAlertByStatusCode(result,function(){
			if (confirmButtonCallback != null) {
				confirmButtonCallback();
			}
        });
	});
}

/**
 * 用户点击确认后ajax提交
 * @param href
 * @param params
 * @param confirmButtonCallback
 */
function ajaxConfirm(message, href,params,confirmButtonCallback) {
	common_ajax.ajaxFuncConfirm(message, href,params,"json",function(result){
		common_modals.swalAlertByStatusCode(result,function(){
			if (confirmButtonCallback != null) {
				confirmButtonCallback();
			}
        });
	});
}

function ajaxOrderSave(url,params,confirmButtonCallback) {
	var result = common_ajax.ajaxFunc(url,params,"json");
	common_modals.swalAlertByStatusCode(result,function(){
		if (confirmButtonCallback != null) {
			confirmButtonCallback();
		}
    });
}

/**
 * 
 */
function ajaxCallback(url,json,confirmButtonCallback){
	common_ajax.ajaxFunc(url,json,"json",function(result){
		common_modals.swalAlertByStatusCode(result,function(){
			if (confirmButtonCallback != null) {
				confirmButtonCallback();
			}
        });
	});

}
