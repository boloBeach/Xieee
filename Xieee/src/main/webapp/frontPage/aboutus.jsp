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
<title>Happy Day -- aboutus</title>
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
	<div class="index-title">
        <ul>
            <li><a href="./frontPage/login.jsp" class="ft12">登陆</a></li>
            <li><a href="./frontPage/register.jsp" class="ft12">注册</a></li>
            <li><a href="" class="ft12">投诉</a></li>
        </ul>
    </div>
    <div class="index-container">
        <!--header start-->
        <div class="index-header">
            <div class="index-head">
                <div class="index-logo ft20">Happy Day</div>
                <div class="index-rss">
                    <ul>
                        <li>
                            <a class="qq">
                                <i></i>
                                <span class="gray">
                                    <em class="black">订阅</em><br>
                                    QQ邮箱
                                </span>
                            </a>
                        </li>
                    </ul>
                    <div class="clear"></div>
                    <br>
                    <div class="index-search">
                        <input type="text" class="ft12" id="search">
                        <i></i>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="index-nav">
                <ul>
                    <li class="on"><a href="" class="ft14">首页</a></li>
                    <li><a href="" class="ft14">今日囧图</a></li>
                    <li><a href="" class="ft14">搞笑gif</a></li>
                    <li><a href="" class="ft14">专业吐槽</a></li>
                    <li><a href="" class="ft14">恶搞ps</a></li>
                    <li><a href="" class="ft14">搞笑漫画</a></li>
                    <!--<li><a href="" class="ft14">MOVIES</a></li>-->
                    <!--<li><a href="" class="ft14">MUSIC</a></li>-->
                </ul>
            </div>
        </div>
        <!--header end-->

        <!--content start-->
        <div class="index-content">
            <div class="index-content-left">
                <div class="index-content-left-title">
                    <span class="ft14 gray">
                        <i class="icon icon-map-marker float-left"></i>&nbsp;
                        当前位置：<a href="" class="ft12">首页</a>&nbsp;»&nbsp;<a href="" class="ft12">关于我们</a>
                    </span>
                </div>
                <div class="index-content-left-item">
                    <div class="item-aboutus ft14">
                        <p>我们是制造快乐的一群人...</p>
                    </div>
                </div>
            </div>
            <div class="index-content-right">
                Right Content
            </div>
            <div class="clear"></div>
            <div class="index-content-contact ft14">
                <ul>
                    <li><i class="g"></i>Happy Day</li>
                    <li><a href="./frontPage/aboutus.jsp">关于我们</a></li>
                    <li><a href="./frontPage/contact.jsp">联系我们</a></li>
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
        </div>
    </div>
    <div class="index-footer">
        <p class="ft12 gray">&copy;2014 Made By <i>Lihuabest</i>.All rights Reserved.</p>
    </div>
</body>
</html>