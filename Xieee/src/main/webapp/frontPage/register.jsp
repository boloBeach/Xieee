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
            <form>
                <ul class="login-form ft12">
                    <li>
                        <label for="email">邮　　箱：</label>
                        <input type="text" id="email">
                    </li>
                    <li>
                        <label for="username">昵　　称：</label>
                        <input type="text" id="username">
                    </li>
                    <li>
                        <label for="password">密　　码：</label>
                        <input type="password" id="password">
                    </li>
                    <li>
                        <label for="chk_password">确认密码：</label>
                        <input type="password" id="chk_password">
                    </li>
                    
                    <li>
                    	<label for="randomImage">验&nbsp;&nbsp;证&nbsp;&nbsp;码：</label>
                    	<input type="text" id="randomImage"/>
                    	<img title="点击更换" class="random-image" onclick="javascript:refresh(this);" src="imageServlet"> 
                    </li>
                    <li>
                        <input type="submit" class="ft16" id="submit" value="提交">
                    </li>
                    <li>
                        <span>
                            <a href="./frontPage/login.jsp">已有账号?</a>&nbsp;&nbsp;
                            <a href="./frontPage/index.jsp">返回首页</a>
                        </span>
                    </li>
                </ul>
            </form>
        </div>
    </div>
 </body>
</html>