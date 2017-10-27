<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>盈家租金分期管理系统</title>
<link href="${basePath }/public/css/login.css" rel="stylesheet" type="text/css" />
<script src="${basePath }/public/plu/jquery/jquery-1.6.4/jquery.min.js" type="text/javascript"></script>
<script src="${basePath }/public/js/login.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
	var basePath = "${basePath}";
	if (self != top) {
		window.open(self.location, '_top');
	}
	$(document).bind("keydown", function(event) {
		if (event.keyCode == 13) {
			submitLoginForm();
		}
	});
</script>
<body>
	<div id="login">
		<div id="top">
			<div id="top_left">
				<img src="${basePath }/public/images/login_03.gif" />
			</div>
			<div id="top_center"></div>
		</div>
		<div id="center">
			<div id="center_left"></div>
			<div id="center_middle">
				<div id="msg" style="color:red; margin-left:40px;height:25px">&nbsp;</div>
				<div id="user">
					帐&nbsp;&nbsp;&nbsp;号: <input type="text" id="loginName" />
				</div>
				<div id="password">
					密&nbsp;&nbsp;&nbsp;码: <input type="password" id="loginPwd" />
				</div>
				<div id="password">
					验证码: <input type="text" id="imgCode" style="width: 65px;margin-left:0px;" /> <img title="点击更换" onclick="javascript:refresh(this);" src="${basePath}/admin/index/imgCode.do" align="top"
						style="width:50px; height: 21px;"/>
				</div>
				<div id="btn">
					<a href="javascript:void(0);" onclick="submitLoginForm();">登录</a><a href="javascript:void(0);" onclick="resetLoginForm();">清空</a>
				</div>
			</div>
			<div id="center_right"></div>
		</div>
		<div id="down">
			<div id="down_left">
				<div id="inf">
					<span class="inf_text">版本信息</span> <span class="copyright">Copyright © 2015 上海研耀信息科技有限公司 <a href="http://www.innjia.com" target="_blank">www.innjia.com</a></span>
				</div>
			</div>
			<div id="down_center"></div>
		</div>
	</div>
</body>
</html>