<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>Happy Day -- 搞笑漫画</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="styles/reset.css" rel="stylesheet" type="text/css">
<link href="styles/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="styles/style.css" rel="stylesheet" type="text/css">
 <script type="text/javascript">
	  function refresh(obj) {
	      obj.src = "imageServlet?"+Math.random();
	   }
    </script>
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
						class="ft12">首页</a>&nbsp;»&nbsp;<a href="" class="ft12">今日囧图</a>
					</span>
				</div>
				<div class="index-content-left-item">
					<h1 class="ft20">${cartoon[0].cartoon_title }</h1>
					<div class="item-info ft12">
						<i class="gray">by</i>&nbsp;&nbsp;${cartoon[0].cartoon_user_name }&nbsp; <i class="gray">on
							2014/12/29</i>&nbsp; 0 comments <span class="item-type item-type-4"></span>
					</div>
					<input type="hidden" value="${id }" id="catalogId"/>
					<input type="hidden" value="${cartoon[0].id}" id="cartoonId"/>
					<div class="item-content ft14" style="text-align: center;">
						<c:choose>
							<c:when test="${cartoon[0].cartoon_width>600}">
								<img alt="${cartoon[0].cartoon_title }" src="${cartoon[0].cartoon_local_url }" style="width:600px ;height: auto;">
							</c:when>
							<c:when test="${cartoon[0].cartoon_width==0 }">
								<img alt="${cartoon[0].cartoon_title }" src="${cartoon[0].cartoon_local_url }" style="width:600px ;height: 2500px;">
							</c:when>
							<c:otherwise>
								<img alt="${cartoon[0].cartoon_title }" src="${cartoon[0].cartoon_local_url }" style="width:auto ;height: auto;">
							</c:otherwise>
						</c:choose>
						<br>
						<br>
						${cartoon[0].cartoon_detial }<br>
					</div>
					<div class="item-assess">
						<input type="hidden" class="cartoon_id" value="${cartoon[0].id }"/>
						<a class="good" title="顶一个"> <i class="icon icon-hand-up"></i><span>${cartoon[0].top_count}</span></a> 
						<a class="bad" title="且..."> <i class="icon icon-thumbs-down"></i><span>${cartoon[0].down_count}</span> </a> 
						<a class="old" title="老漫画"> <i class="icon icon-hand-down"></i>老漫画(<span>${cartoon[0].old_cartoon}</span>)</a>
						<a class="collect" title="我要收藏"> <i class="icon icon-heart"></i>收藏
						</a>
					</div>
					<div>
						<div class="bdsharebuttonbox float-right">
							<a href="#" class="bds_more" data-cmd="more"></a><a href="#"
								class="bds_qzone" data-cmd="qzone"></a><a href="#"
								class="bds_tsina" data-cmd="tsina"></a><a href="#"
								class="bds_tqq" data-cmd="tqq"></a><a href="#"
								class="bds_renren" data-cmd="renren"></a><a href="#"
								class="bds_weixin" data-cmd="weixin"></a>
						</div>
						<script>
							window._bd_share_config = {
								"common" : {
									"bdSnsKey" : {},
									"bdText" : "",
									"bdMini" : "2",
									"bdPic" : "",
									"bdStyle" : "0",
									"bdSize" : "16"
								},
								"share" : {},
								"image" : {
									"viewList" : [ "qzone", "tsina", "tqq",
											"renren", "weixin" ],
									"viewText" : "分享到：",
									"viewSize" : "16"
								},
								"selectShare" : {
									"bdContainerClass" : null,
									"bdSelectMiniList" : [ "qzone", "tsina",
											"tqq", "renren", "weixin" ]
								}
							};
							with (document)
								0[(getElementsByTagName('head')[0] || body)
										.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
										+ ~(-new Date() / 36e5)];
						</script>
					</div>
					<div class="clear"></div>
					<div class="item-next">
						<span class="float-left ft12"> 上一篇：
						<c:choose>
							<c:when test="${!empty cartoon[1]}">
								<a href="cartoon/${id}-${cartoon[1].id}.html">${cartoon[1].cartoon_title }</a>
							</c:when>
							<c:otherwise>
								<a href="cartoon.html">没有上一页了。。</a>
							</c:otherwise>
						</c:choose>
						
						</span> 
						
						<span class="float-right ft12"> 
						下一篇：
						<c:choose>
							<c:when test="${!empty cartoon[2]}">
								<a href="cartoon/${id}-${cartoon[2].id}.html">${cartoon[2].cartoon_title }</a>
							</c:when>
							<c:otherwise>
								<a href="#">没有下一页了。。</a>
							</c:otherwise>
						</c:choose>
						</span>
					</div>
					<div class="clear"></div>
					<div class="item-comment-write">
						<form action="#" method="post" id="commont">
							<textarea id="comment" class="ft14"></textarea>
							<label for="checkCode">请输入验证码:</label>
							<input id="checkCode" type="text" name="checkCode" id="checkCode"/>&nbsp;&nbsp;
							<img title="点击更换" class="random-image" onclick="javascript:refresh(this);" src="imageServlet">
							<span  style="color: red" id="error-message"></span>
							<input type="button" id="submitCommont" value="发表评论">
						</form>
					</div>
					<div class="clear"></div>
					<div class="item-comment ft12">
						<h2>评论：</h2>
						<ul class="common">
						<!-- this is common -->
							<c:forEach var="common" items="${commonList.list}" >
								<li><img src="images/user.png">
									<div>
										<span class="name gray">${common.address}的网友:</span> <span class="says black">${common.content }</span>
										<span class="time gray">${fn:substring(common.modify_time, 0, 19)} <em> <i class="tread"></i>(${common.down_count })
										</em> <em> <i class="favour"></i>(${common.top_count })
										</em>
										</span>
									</div>
								</li>
							</c:forEach>
							<!-- <li><img src="images/user.png">
								<div>
									<span class="name gray">XX</span> <span class="says black">搞笑</span>
									<span class="time gray">1天前 <em> <i class="tread"></i>(21)
									</em> <em> <i class="favour"></i>(23)
									</em>
									</span>
								</div></li>
							<li><img src="images/user.png">
								<div>
									<span class="name gray">XX</span> <span class="says black">搞笑</span>
									<span class="time gray">1天前 <em> <i class="tread"></i>(21)
									</em> <em> <i class="favour"></i>(23)
									</em>
									</span>
								</div></li>
							<li><img src="images/user.png">
								<div>
									<span class="name gray">XX</span> <span class="says black">搞笑</span>
									<span class="time gray">1天前 <em> <i class="tread"></i>(21)
									</em> <em> <i class="favour"></i>(23)
									</em>
									</span>
								</div></li> -->
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="index-content-right">
				<%@include file="right.jsp"%>
			</div>
			<%@include file="footer.jsp"%>
		</div>
	</div>
	<input type="hidden" id="ipaddress" value=""/>
	<input type="hidden" id="ip" value=""/>
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
	<script type="text/javascript">
		document.getElementById("ipaddress").value=returnCitySN["cname"];
		document.getElementById("ip").value=returnCitySN["cip"];
	</script>
</body>
</html>
<script type="text/javascript" src="scripts/likeResource.js"></script>