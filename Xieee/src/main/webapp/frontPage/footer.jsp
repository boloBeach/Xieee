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
<link href="styles/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="clear"></div>
	<div class="index-content-contact ft14">
		<ul>
			<li><i class="g"></i>Happy Day</li>
			<li><a href="aboutAs">关于我们</a></li>
			<li><a href="contact">联系我们</a></li>
			<li><a href="backIndex">后台管理</a></li>
		</ul>
		<ul>
			<li><i class="r"></i>友情链接</li>
			<li><a>百度贴吧</a></li>
		</ul>
		<ul>
			<li><i class="b"></i>商务合作</li>
			<li><a>合作伙伴</a></li>
		</ul>
		<ul>
			<li><i class="a"></i>关注我们</li>
			<li><a>微信</a></li>
			<li><a>微博</a></li>
		</ul>
		<div class="clear"></div>
	</div>
	
</body>
</html>