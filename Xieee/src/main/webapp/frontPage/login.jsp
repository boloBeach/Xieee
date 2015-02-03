<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Happy Day -- login</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="styles/reset.css" rel="stylesheet" type="text/css">
<link href="styles/style.css" rel="stylesheet" type="text/css">

<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	position: relative;
}
</style>

<script type="text/javascript"
	src="scripts/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="scripts/login.js"></script>
<script type="text/javascript" src="scripts/regist.js"></script>
<script type="text/javascript">
	function refresh(obj) {
		obj.src = "imageServlet?" + Math.random();
	}
</script>
</head>
<body>
	 <div class="login-container">
        <div class="login-content">
            <ul class="login-type">
                <li data-type="own" class="on ft14">账号密码登录</li>
                <li data-type="other" class="ft14">快速登录</li>
            </ul>
            <form action="login" method="post">
                <ul class="login-form own ft12">
                	
                    <li>
                        <label for="login_email">邮　　箱：</label>
                        <input type="text" id="login_email" name="email">
                    </li>
                    <li>
                        <label for="login_password">密　　码：</label>
                        <input type="password" id="login_password" name="user_password">
                    </li>
                    <li>
                    	<label for="randomCode">验&nbsp;&nbsp;证&nbsp;&nbsp;码：</label>
                    	<input type="text" id="randomCode" name="checkCode"/>
                    	<img title="点击更换" class="random-image" onclick="javascript:refresh(this);" src="imageServlet">
                    </li>
                    <li style="color: red;text-align: center;" id="error_message">
                		${login}
                	</li>
                    <li style="line-height: 25px;">
                        <label for="remember"></label>
                        <input type="checkbox" id="remember">
                        <span>下次自动登录</span>
                    </li>
                    <li>
                        <input type="submit" class="ft16" id="login_submit" value="登录">
                    </li>
                    <li>
                    <span>
                        <a href="./frontPage/register.jsp">没有账号?</a>&nbsp;&nbsp;
                        <a href="">忘记密码?</a>&nbsp;&nbsp;
                        <a href="./">返回首页</a>
                    </span>
                    </li>
                </ul>
                <ul class="login-form other ft12">
                    <li>
                        <a href="">QQ账号登录</a>
                    </li>
                    <li>
                        <a href="">微博账号登录</a>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</body>
</html>