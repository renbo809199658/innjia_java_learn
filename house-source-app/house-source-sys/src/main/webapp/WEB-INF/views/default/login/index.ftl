<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>通用平台管理后台</title>
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
    
    <!--jquery validate-->
	<script src="${basePath }/public/hplus-4.1.0/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${basePath }/public/hplus-4.1.0/js/plugins/validate/messages_zh.min.js"></script>
    
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
		
		$(function () {
			initLoginPosition();
			  
		  });

		  $(window).resize(function(){ 
				initLoginPosition();
		  });  

		  function initLoginPosition() {
			$(".middle-box").css({ 
					position: "absolute", 
					left: ($(window).width() - $(".middle-box").outerWidth())/2, 
					top: ($(window).height() - $(".middle-box").outerHeight())/3 
				});   
		  }
		
    </script>
    
    <style>
    	.logo-name{
    		color:#e6e6e6;
    		font-size:40px;
    		font-weight:100;
    		letter-spacing:-10px;
    		margin-bottom:0
    	}
    </style>
    
</head>

<body style="background-repeat: repeat-y;background-size:100%;">
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>
                <h2 style="bold:weight;">通&nbsp;用&nbsp;平&nbsp;台&nbsp;管&nbsp;理&nbsp;后&nbsp;台</h2>
            </div>

            <form id="loginForm" class="m-t" role="form" action="">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="用户名" id="loginName" required>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="密码" id="loginPwd" required>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
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
