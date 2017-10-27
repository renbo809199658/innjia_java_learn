<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>结算中心管理后台 - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${basePath }/public/hplus-4.1.0/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/css/animate.min.css" rel="stylesheet">
    <link href="${basePath }/public/hplus-4.1.0/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script src="${basePath }/public/hplus-4.1.0/js/jquery.min.js?v=2.1.4"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${basePath }/public/js/login.js" type="text/javascript"></script>
    <script>
    	var basePath = "${basePath}";
    	if(window.top !== window.self) { 
    		window.top.location = window.location;
    	}
    	$(document).bind("keydown", function(event) {
			if (event.keyCode == 13) {
				submitLoginForm();
			}
		});
    </script>
</head>

<body class="gray-bg">
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>
                <h3 class="logo-name">结算平台</h3>
            </div>
            <h3>结算中心管理后台-登入</h3>

            <form class="m-t" role="form" action="">
                <div class="form-group has-feedback">
                    <input type="email" class="form-control" placeholder="用户名" id="loginName" required>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="密码" id="loginPwd" required>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="form-group">
					<input type="text" class="form-control" placeholder="验证码" id="imgCode" required="true" />
					<img class="form-control" title="点击更换" onclick="javascript:refresh(this);" src="${basePath}/admin/index/imgCode.do" align="top" style="width:40%; height: 6%;"/>
				</div>
				<div id="msg" style="color:red; height:25px">&nbsp;</div>
                <button type="button" class="btn btn-primary block full-width m-b" onclick="submitLoginForm();">登 录</button>
	
                <p class="text-muted text-center"> <a href="#"><small>忘记密码了？</small></a> | <a href="#">注册一个新账号</a>
                </p>

            </form>
        </div>
    </div>
</body>

</html>
