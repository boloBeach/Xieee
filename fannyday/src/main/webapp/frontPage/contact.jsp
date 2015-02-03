<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Happy Day -- contact</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="styles/reset.css" rel="stylesheet" type="text/css">
<link href="styles/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="scripts/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="scripts/index.js"></script>
</head>
<body>
	<div class="index-container">
		<%@include file="header.jsp"%>
		<!--header end-->

		<!--content start-->
		<div class="index-content">
			<div class="index-content-left">
				<div class="index-content-left-title">
					<span class="ft14 gray"> <i
						class="icon icon-map-marker float-left"></i>&nbsp; 当前位置：<a href=""
						class="ft12">首页</a>&nbsp;»&nbsp;<a href="" class="ft12">联系我们</a>
					</span>
				</div>
				<div class="index-content-left-item">
					<div class="item-contact ft14">
						<ul>
							<li>联系人：${contact.constact_name }</li>
							<li>联系电话：${contact.telphone }</li>
							<li>联系邮箱：${contact.email }</li>
							<li>联系地址：${contact.address }</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="index-content-right"><%@include file="right.jsp" %></div>
			<%@include file="footer.jsp" %>
			</div>
		</div>
	</div>

	<div class="index-footer">
		<p class="ft12 gray">
			&copy;2014 Made By <i>Lihuabest</i>.All rights Reserved.
		</p>
	</div>

</body>
</html>