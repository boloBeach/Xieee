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
<c:if test="${id eq '2' }">
	<title>嘻哈大全-
		<c:if test="${not empty parentBean && fn:length(parentBean)>1}">
			${parentBean[0].parent_picture_name }
		</c:if>
	 </title>
</c:if>

<c:if test="${id eq '3' }">
	<title>嘻哈大全-
		<c:if test="${not empty parentBean && fn:length(parentBean)>1}">
			${parentBean[0].parent_picture_name }
		</c:if>
	 </title>
</c:if>

<c:if test="${id eq '4' }">
	<title>嘻哈大全-
		<c:if test="${not empty parentBean && fn:length(parentBean)>1}">
			${parentBean[0].parent_picture_name }
		</c:if>
	 </title>
</c:if>
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
				<input type="hidden" value="${id }" id="catalogId"/>
				<input type="hidden" value="${resourceId}" class="cartoon_id"/>
				<c:forEach var="listItem" items="${pictureList.list }">
				<div class="index-content-left-item">
					<h1 class="ft20 center">
					<c:if test="${not empty parentBean && fn:length(parentBean)>1}">
						${parentBean[0].parent_picture_name }
					</c:if>
					</h1>
					<div class="item-info ft12 center">
						<i class="gray">by</i>&nbsp;&nbsp;${listItem.author }&nbsp; <i class="gray">on
							${fn:substring(listItem.modify_time, 0, 19)}</i>&nbsp; ${commontRows } comments <span class="item-type item-type-4"></span>
					</div>
					<div class="item-content ft14">
						<div class="item-content-img">
							
							
							<c:if test="${pictureList.havePrePage }">
								<a href="detail/${id }/${parentId}/picture_${pictureList.pageNumber-1 }.html" title="点击看上一张" class="goLf"  hidefocus="true" ></a>
							</c:if>
							
							<c:if test="${pictureList.haveNextPage }">
								<a href="detail/${id }/${parentId}/picture_${pictureList.pageNumber+1 }.html" title="点击看下一张" class="goRi" hidefocus="true" ></a>
							</c:if>
							<img title="${listItem.title}" alt="${listItem.title}" src="${listItem.local_url}"/>
							<div>
								<c:choose>
									<c:when test="${empty listItem.detail }">
										${listItem.title }
									</c:when>
									<c:otherwise>
										${listItem.detail }
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						
						<br>
					</div>
					<div class="item-assess">
						<input type="hidden" class="cartoon_id" value="${listItem.id }"/>
						<a class="goodVirgin" title="顶一个"> <i class="icon icon-hand-up"></i><span>${listItem.top_count}</span></a> 
						<a class="badVirgin" title="且..."> <i class="icon icon-thumbs-down"></i><span>${listItem.down_count}</span> </a> 
						<a class="oldVirgin" title="老图"> <i class="icon icon-hand-down"></i>老图(<span>${listItem.old_picture}</span>)</a>
						<span class="ft12" style="color: red;display:none;line-height: 30px;">操作成功</span>
					</div>
					</c:forEach>
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
						<c:choose>
							<c:when test="${not empty parentBean && fn:length(parentBean)>=2}">
								<span class="float-left ft12">
									上一篇: <a href="detail/${id }/${parentBean[1].id}/picture_0.html" title="${parentBean[1].parent_picture_name }">${parentBean[1].parent_picture_name }</a>
								</span>
							</c:when>
							<c:otherwise>
								<span class="float-left ft12">
									上一篇: <a href="#" title="暂无上一篇" >暂无上一篇</a>
								</span>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${not empty parentBean && fn:length(parentBean)>=3}">
								<span class="float-right ft12">
									 下一篇： <a href="detail/${id }/${parentBean[2].id}/picture_0.html" title="${parentBean[2].parent_picture_name }">${parentBean[2].parent_picture_name }</a>
								</span>
							</c:when>
							<c:otherwise>
								<span class="float-right ft12">
									下一篇: <a href="#" title="暂无下一篇" >暂无下一篇</a>
								</span>
							</c:otherwise>
						</c:choose>
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
		<input type="hidden" id="ipaddress" value=""/>
		<input type="hidden" id="ip" value=""/>
		<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
		<script type="text/javascript">
			document.getElementById("ipaddress").value=returnCitySN["cname"];
			document.getElementById("ip").value=returnCitySN["cip"];
		</script>
		<script type="text/javascript" src="scripts/likeResource.js"></script>
		
</body>
</html>