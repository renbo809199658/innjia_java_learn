<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no" />
    <!--  新 Bootstrap 核心 CSS 文件  -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
    @charset "UTF-8";
    body {
        background: #F9F9F9;
        color: #333;
        font-family: "Helvetica Neue", Helvetica, Arial, "微软雅黑", sans-serif;
        font-size: 14px;
    }
    
    ul,
    ol {
        padding: 0;
        list-style: none;
    }
    
    input,
    button,
    select,
    textarea,
    button {
        outline: none;
    }
    
    .textarea {
        resize: none;
    }
    
    a:link,
    a:visited,
    a:hover,
    a:active {
        text-decoration: none;
    }
    
    .hide {
        display: none;
    }
    
    .mod-header-container .inner {
        background: #fff;
        border-bottom: 1px solid #F3F3F3;
    }
    
    .mod-header-container .site-top {
        min-height: 44px;
    }
    
    .mod-header-container .site-top h1 {
        font-size: 17px;
        text-align: center;
        line-height: 44px;
        margin: 0;
    }

    .mod-header-container .site-top .link {
        display: block;
        line-height: 44px;
        color: #333;
    }
    
    .c999 {
        color: #999;
    }
    
    .c333 {
        color: #333 !important;
    }
    
    .c417505 {
        color: #417505;
    }
    
    .cE94C5D {
        color: #E94C5D;
    }
    
    .f12 {
        font-size: 12px;
    }
    
    .mt5 {
        margin-top: 5px;
    }
    
    .h10 {
        height: 10px;
    }
    
    .btn-xs {
        padding-left: 20px;
        padding-right: 20px;
    }
    
    .btn-disabled {
        color: #fff;
        background: #DADADA;
    }
    
    .btn-disabled:active {
        color: #fff !important;
    }
    
    .test {
        padding: 10px;
    }
    
    #cnzz_stat_icon_1260227139 {
        display: none;
    }
    
    .result-overlay {
        position: absolute;
        top: 130px;
        left: 119px;
        max-height: 220px;
        overflow-y: scroll;
        width: 241px;
        border: 1px solid #888;
        background: #fff;
        box-shadow: 2px 2px 10px gray;
        display: none;
    }
    
    .result-overlay li {
        height: 43px;
        line-height: 43px;
        padding: 0 15px;
        border-bottom: 1px solid #ccc;
    }
    
    .result-overlay li:last-child {
        border-bottom: 0;
    }
    
    #weui_agreement_sheet {
        height: 100%;
    }
    
    .agreement_content {
        height: 0;
        width: 100%;
        position: absolute;
        top: -1000px;
        left: 0;
        background: #FFCCEE;
    }
    
    .agreement_content iframe {
        width: 100%;
        *width: 100%;
        height: 100%;
        background: #fff;
        border: 0;
    }
    
    .agreement_close {
        height: 54px;
        width: 100%;
        position: absolute;
        bottom: 0;
        left: 0;
        background: #FFFFFF;
        border-top: 5px solid #efeff4;
        text-align: center;
        line-height: 54px;
        font-size: 18px;
        color: #999;
    }
    /*# sourceMappingURL=common.css.map */
    
    body {
        background-color: #fff;
    }
    
    .login {
        width: 100%;
        padding: 20px 20px 0;
        box-sizing: border-box;
    }
    
    .login .user,
    .login .password {
        width: 100%;
        border: 1px solid #e9e9e9;
        border-radius: 51px;
        height: 42px;
        padding-left: 30px;
        box-sizing: border-box;
        background: #fff;
    }
    
    .login .password {
        margin-top: 20px;
    }
    
    .login .log {
        width: 100%;
        background: #ffae32;
        border-radius: 100px;
        height: 40px;
        line-height: 40px;
        border: none;
        color: #fff;
        letter-spacing: 5px;
        outline: none;
        margin-top: 70px;
    }
    
    .error-info {
        color: #f00;
        font-size: 14px;
        padding-left: 30px;
        box-sizing: border-box;
    }
    .login p{
        margin-bottom: 5px;
    }
    .login p.password-info{
        margin:5px 0px -15px;
    }
    </style>
</head>

<body>
    <!-- 头部 -->
    <section class="mod-header-container">
        <div class="inner">
            <div class="container-fluid">
                <header class="site-top">
                    <div class="pull-left"><i class="back"></i></div>
                    <!-- 头部如有右边元素请添加在h1标签上面 -->
                    <h1>登录</h1> </header>
            </div>
        </div>
    </section>
    <div class="mod-login-flow">
        <form method="post" id="form" action="${basePath}/service/authorize.do">
            <div class="login">
            	<input type="hidden"  name="clientId"  value="${clientId}">
                <input type="hidden"  name="state"  value="${state}">
                <input type="hidden"  name="redirectUri"  value="${redirectUri}">
              <#if error??>      <p class="error-info">${error}</p>        </#if>  
                <input class="user" name="loginName" type="text" maxlength="50" placeholder="账号" value="" />
             <!--   <p class="error-info password-info">*请输入正确的密码</p> -->
                <input class="password" name="loginPwd" type="password" placeholder="密码" value="" />                               
                <button class="log">登录</button>
            </div>
        </form>
    </div>
</body>

</html>
