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
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?8b32aeb6a52cfe406c86afa3c9b7cafa";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<title>嘻哈大全-恶搞PS${virgin[0].title }</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="恶搞、PS、PS图片,PS大神,各种恶搞,各种雷人">
<meta http-equiv="description" content="最搞怪的PS,让你无法想象的PS,技术崇拜把骚年--嘻哈大全提供恶搞PS">
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
					<h1 class="ft20 center">${virgin[0].title }</h1>
					<input type="hidden" value="${id }" id="catalogId"/>
					<input type="hidden" value="${virgin[0].id}" class="cartoon_id"/>
					<div class="item-info ft12 center">
						<i class="gray">by</i>&nbsp;&nbsp;${virgin[0].author }&nbsp; <i class="gray">on
							${fn:substring(virgin[0].modify_time, 0, 19)} </i>&nbsp; ${commontRows } comments <span class="item-type item-type-4"></span>
					</div>
					
					<div class="item-content ft14" style="text-align: center;">
						<img alt="${virgin[0].title }" src="${virgin[0].local_url }">
						<c:choose>
							<c:when test="${!empty virgin[1]}">
								<a href="ps/${id}-${virgin[1].id}.html" title="点击看上一张" class="goLf"  hidefocus="true" ></a>
							</c:when>
							<c:otherwise>
								<a href="#" title="点击看上一张" class="goLf"  hidefocus="true" ></a>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${!empty virgin[2]}">
								<a href="ps/${id}-${virgin[2].id}.html" title="点击看下一张" class="goRi" hidefocus="true"></a>
							</c:when>
							<c:otherwise>
								<a href="#" title="点击看下一张" class="goRi" hidefocus="true"></a>
							</c:otherwise>
						</c:choose>
						<br>
						<br>
						${virgin[0].detail }<br>
					</div>
					<div class="item-assess">
						<input type="hidden" class="virgin_id" value="${virgin[0].id }"/>
						<a class="goodVirgin" title="顶一个"> <i class="icon icon-hand-up"></i><span>${virgin[0].top_count}</span></a> 
						<a class="badVirgin" title="且..."> <i class="icon icon-thumbs-down"></i><span>${virgin[0].down_count}</span> </a> 
						<a class="oldVirgin" title="PS很老了"> <i class="icon icon-hand-down"></i>PS很老了(<span>${virgin[0].old_picture}</span>)</a>
						<span class="ft12" style="color: red;display:none;line-height: 30px;">操作成功</span>
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
							<c:when test="${!empty virgin[1]}">
								<a href="ps/${id }-${virgin[1].id}.html">${virgin[1].title }</a>
							</c:when>
							<c:otherwise>
								<a href="virgin.html">没有上一页了。。</a>
							</c:otherwise>
						</c:choose>
						
						</span> 
						
						<span class="float-right ft12"> 
						下一篇：
						<c:choose>
							<c:when test="${!empty virgin[2]}">
								<a href="ps/${id }-${virgin[2].id}.html">${virgin[2].title }</a>
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
							<c:forEach var="common" items="${commonList.list}" >
								<li><img src="images/user.png">
									<div class="commonGray">
										<span class="name gray">${common.address}的网友:</span> <span class="says black">${common.content }</span>
										<span class="time gray">${fn:substring(common.modify_time, 0, 19)} 
										<em class="treadDown"> <i class="tread"></i>(${common.down_count })</em>
										<em class="favourTop"> <i class="favour"></i>(${common.top_count })</em>
										<input type="hidden" value="${common.id }"/>
										</span>
									</div>
								</li>
							</c:forEach>
						<!-- 
						 
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
								</div></li>
							<li><img src="images/user.png">
								<div>
									<span class="name gray">XX</span> <span class="says black">搞笑</span>
									<span class="time gray">1天前 <em> <i class="tread"></i>(21)
									</em> <em> <i class="favour"></i>(23)
									</em>
									</span>
								</div></li>-->
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