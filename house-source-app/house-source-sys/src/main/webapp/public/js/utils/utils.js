/**
 * 函数方法
 */
var utils = {
	goTop : function() {
		document.documentElement.scrollTop = document.body.scrollTop = 0;
	},

	top_userselect_ul_on : function() {
		var node = $("#top_userselect_ul");
		if (node.css("display") == "none") {
			node.css("display", "block");
		} else {
			node.css("display", "none");
		}
	},

	emojifySelect : function() {
		var node = $(".emojifySelect");
		if (node.css("display") == "none") {
			node.css("display", "block");
		} else {
			node.css("display", "none");
		}
	},

	/**
	 * 获取浏览器类型
	 */
	getBrowserInfo : function() {
		var agent = navigator.userAgent.toLowerCase();
		
		var regStr_ie = /msie [\d.]+;/gi;
		var regStr_ff = /firefox\/[\d.]+/gi
		var regStr_chrome = /chrome\/[\d.]+/gi;
		var regStr_saf = /safari\/[\d.]+/gi;
		
		// IE
		if (agent.indexOf("msie") > 0) {
			return agent.match(regStr_ie);
		}

		// firefox
		if (agent.indexOf("firefox") > 0) {
			return agent.match(regStr_ff);
		}

		// Safari
		if (agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0) {
			return agent.match(regStr_saf);
		}

		// Chrome
		if (agent.indexOf("chrome") > 0) {
			return agent.match(regStr_chrome);
		}
	}, 
	
	/**
	 * 获取浏览器版本
	 */
	getBrowserVersion : function() {
		var bi = getBrowserInfo();
		var version = (bi + "").replace(/[^0-9.]/ig,""); 
		return version;
	},

	/**
	 * 验证email
	 */
	email : function(str){
		var partten = /^[\w.+-]+@(?:[-a-z0-9]+\.)+[a-z]{2,4}$/i;//正则/\b[^\s\@]+\@(?:[a-z\d-]+\.)+(?:com|net|org|info|cn|jp|gov|aero)\b/;
		if(partten.test(str)){
			return true;
		}else {
			return false;
		}
	},
	
	/**
	 * 验证手机号码
	 */
	mobile : function(str){
		var partten = /^0?(13[0-9]|15[012356789]|18[01236789]|14[57])[0-9]{8}$/; ///^1[3,5]\d{9}$/;
		if(partten.test(str)){
			return true;
		}else{
			return false;
		}
	},

	/**
	 * 验证字母数字
	 */
	letterNumber : function(str){
		var partten = /^[A-Za-z0-9]+$/;
		if(partten.test(str)){
			return true;
		}else {
			return false;
		}
	},
	
	/**
	 * 中文_字母_数字
	 */
	chinaLetterNumber : function(str){
		var pattern = /^[0-9a-zA-Z\u4e00-\u9fa5]+$/i; 
		if (pattern.test(str)){ 
			return true;
		}else{ 
			return false;
		} 
	},
	
	/**
	 * 验证URL
	 */
	url : function(str){
		var strRegex = "(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]";
		var re=new RegExp(strRegex);
		//re.test()
		if (re.test(str)){
			return (true);
		}else{
			return (false);
		}
	},
		
	/**
	 * 验证URL
	 */
	isUrl : function(str){
		var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
					+ "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@
					+ "(([0-9]{1,3}.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
					+ "|" // 允许IP和DOMAIN（域名）
					+ "([0-9a-z_!~*'()-]+.)*" // 域名- www.
					+ "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]." // 二级域名
					+ "[a-z]{2,6})" // first level domain- .com or .museum
					+ "(:[0-9]{1,4})?" // 端口- :80
					+ "((/?)|" // a slash isn't required if there is no file name
					+ "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
		var re=new RegExp(strRegex);
		//re.test()
		if (re.test(str)){
			return (true);
		}else{
			return (false);
		}
	},
	
	/**
	 * 正则表达式修改参数
	 * @param url 目标url 
	 * @param arg 需要替换的参数名称 
	 * @param arg_val 替换后的参数的值 
	 * @return url 参数替换后的url 
	 */ 
	changeURLArg : function (url,arg,arg_val){ 
    	var pattern=arg+'=([^&]*)'; 
    	var replaceText=arg+'='+arg_val; 
    	if(url.match(pattern)){ 
    		var tmp='/('+ arg+'=)([^&]*)/gi'; 
    		tmp=url.replace(eval(tmp),replaceText); 
    		return tmp; 
    	}else{ 
    		if(url.match('[\?]')){ 
    			return url+'&'+replaceText; 
    		}else{ 
    			return url+'?'+replaceText; 
    		} 
    	} 
    	return url+'\n'+arg+'\n'+arg_val; 
	},
	
	/**
	 * ajax提交form求并返回结果
	 * @param divId 返回替换div
	 * @param formId 提交formid
	 * @param callback 回调
	 */
	ajaxForm : function(formId, dataType, callback){
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
	},
	
	/**
	 * ajax请求并返回结果
	 * @param url
	 * @param data
	 * @param callback
	 * @returns {String}
	 */
	ajaxFunc : function(url, data, dataType, callback){
		if(dataType == undefined || dataType == null){
			dataType = "html";
		}
		
		var result = "";
		$.ajax({
			type : "post",
			url : encodeURI(encodeURI(cxt + url)),
			data : data,
			dataType : dataType,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			async: false,
			cache: false,
			success:function(response){
				result = response;
				//扩展回调函数
				if( callback != null ){
					callback();
				}
			}
		});
		return result;
	}
	
};

/**
 * 序列化对象格式为键值对对象,可用于form表单序列化
 */
$.fn.serializeObject = function()
{
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name] !== undefined) {
			if (!o[this.name].push) {
				o[this.name] = [o[this.name]];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};

/*
 * 数组移除
 */
//Array.prototype.remove=function(dx){
//	if(isNaN(dx)||dx>this.length) {
//		return false;
//	}
//	for(var i=0,n=0 ; i<this.length ; i++) {
//		if(this[i] != this[dx]) {
//			this[n++] = this[i];
//		}
//	}
//	this.length-=1;
//}

/**
 * 初始化加载
 */
jQuery(document).ready(function() {

	$(document).scroll(function() {
			var top = document.documentElement.scrollTop != 0 || document.body.scrollTop != 0;
			if (top) {
				$("#goTop").css("display", "block");
			} else {
				$("#goTop").css("display", "none");
			}
	});

	$(document).click(function(e) {

	});

});


