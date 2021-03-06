<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>Happy Day -- register</title>        
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

    <script type="text/javascript" src="scripts/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/regist.js"></script>
    <script type="text/javascript">
	    function refresh(obj) {
	        obj.src = "imageServlet?"+Math.random();
	    }
    </script>
 </head>
 <body>
 	<div class="login-container">
        <div class="login-content">
            <ul class="login-type">
                <li data-type="own" class="ft14 on" style="width: 100%">新用户注册</li>
            </ul>
            <form action="regist.html" method="post">
                <ul class="login-form ft12">
                    <li>
                        <label for="login_email">邮　　箱:</label>
                        <input type="text" id="regist_email" name="email">
                    </li>
                    <li>
                        <label for="username">昵　　称:</label>
                        <input type="text" id="username" name="user_name">
                    </li>
                    <li>
                        <label for="login_password">密　　码:</label>
                        <input type="password" id="login_password" name="user_password">
                    </li>
                    <li>
                        <label for="chk_password">确认密码:</label>
                        <input type="password" id="chk_password">
                    </li>
                    
                    <li>
                    	<label for="randomCode">验 证 码:</label>
                    	<input type="text" id="randomCode" name="checkCode"/>
                    	<img title="点击更换" class="random-image" onclick="javascript:refresh(this);" src="imageServlet"> 
                    </li>
                    
                    <li style="color: red;text-align: center;" id="error_message">
                		
                	</li>
                	
                    <li>
                        <input type="submit" class="ft16" id="regist_submit" value="提交">
                    </li>
                    <li>
                        <span>
                            <a href="login.html">已有账号?</a>&nbsp;&nbsp;
                            <a href="index.html">返回首页</a>
                        </span>
                    </li>
                </ul>
            </form>
        </div>
    </div>
 </body>
</html>