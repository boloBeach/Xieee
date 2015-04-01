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
<title>嘻哈大全-神回复吐槽第${gadrelayList.pageNumber}期</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="神回复,神问答,搞怪回答,爆笑回复,吐槽,神回复吐槽">
<meta http-equiv="description" content="嘻哈大全提供全球神回复第${gadrelayList.pageNumber}期">
<link href="styles/reset.css" rel="stylesheet" type="text/css">
<link href="styles/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="styles/style.css" rel="stylesheet" type="text/css">
<link href="styles/gadReplay.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function refresh(obj) {
		obj.src = "imageServlet?" + Math.random();
	}
</script>
<script type="text/javascript" src="scripts/plugins/jquery/jquery.min.js"></script>
</head>
<body>
	<div class="index-container">
		<%@include file="header.jsp"%>
		<!--header end-->

		<!--content start-->
		<div class="index-content">
			<input type="hidden" id="catalogId" value="${id }"/>
			<div class="index-content-left">
				<div class="index-content-left-title">
					<span class="ft14 gray"> <i
						class="icon icon-map-marker float-left"></i>&nbsp; 当前位置：<a href=""
						class="ft12">首页</a>&nbsp;»&nbsp;<a href="" class="ft12">今日囧图</a>
					</span>
				</div>
				<div class="index-content-left-item">
					<c:forEach var="gadReplayList" items="${gadrelayList.list}">
						<div class="index-content-items">
						<div class="item-content ft14" style="text-align: center;">
							<div class="item-content-title ft20">
								${gadReplayList.title}
							</div>
							<div class="item-info ft12">
								<i class="gray">by</i>&nbsp;&nbsp;admin&nbsp; <i class="gray">on
									${fn:substring(gadReplayList.modify_time, 0, 19)}  </i>
							</div>
							<div class="item-content-img ft16">
								<c:choose>
									<c:when test="${empty gadReplayList.picture_name }">
										${gadReplayList.detail}
									</c:when>
									<c:otherwise>
										<div>
											<img alt="${gadReplayList.detail }" src="${gadReplayList.local_url }">
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="items-assess">
							<a class="goodVirgin" title="顶一个"> <i class="icon icon-hand-up"></i><span>${gadReplayList.top_count }</span></a>
							<a class="badVirgin" title="且..."> <i class="icon icon-thumbs-down"></i><span>${gadReplayList.down_count }</span></a>
							<a class="oldVirgin" title="老神回复"> <i class="icon icon-hand-down"></i>老神回复(<span>${gadReplayList.old_picture }</span>)</a>
							<input type="hidden" value="${gadReplayList.id }"/>
							<dd>
								<input id="txtCommentContent_145099" type="text" class="text01"
									value="不用登录也能评论哦！限200字" onclick="javascript:cleartext(this);">
									<input type="button" class="btn01" value="我要评论" >
							</dd>
							<dt class="upDown">
								<a href="javascript:void(0)" title="查看评论" id="c-145092" class="comments">查看评论</a>
								<span style="display:none;display:none; color: red;" class="ft12" >操作成功</span>
							</dt>
							
						</div>
						<div class="comentlist">
							<h2>最新评论</h2>
							<div>
								<ul class="common ft12">
									
								</ul>
							</div>
							<div>
								<p class="allp">点击更多评论</p>
								<input type="hidden" alt="${gadReplayList.id }"/>
								<p class="bobtn">收起</p>
							</div>
						</div>
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
					<div class="item-next ft12">
						<c:if test="${gadrelayList.havePrePage }">
							<a href="gadreplay/5_${gadrelayList.pageNumber-1}">上一页</a>
						</c:if>
						<c:if test="${gadrelayList.pageNumber > 4 }">
							<a href="gadreplay/5_${gadrelayList.pageNumber-4 }.html">${gadrelayList.pageNumber-4 }</a>
							<a href="gadreplay/5_${gadrelayList.pageNumber-3 }.html">${gadrelayList.pageNumber-3 }</a>
							<a href="gadreplay/5_${gadrelayList.pageNumber-2 }.html">${gadrelayList.pageNumber-2 }</a>
							<a href="gadreplay/5_${gadrelayList.pageNumber-1 }.html">${gadrelayList.pageNumber-1 }</a>
						</c:if>
						<a href="gadreplay/5_${gadrelayList.pageNumber}.html" style="color: red">${gadrelayList.pageNumber}</a>
						<c:if test="${gadrelayList.pageCount-gadrelayList.pageNumber>4 }">
							<a href="gadreplay/5_${gadrelayList.pageNumber+1 }.html">${gadrelayList.pageNumber+1 }</a>
							<a href="gadreplay/5_${gadrelayList.pageNumber+2 }.html">${gadrelayList.pageNumber+2 }</a>
							<a href="gadreplay/5_${gadrelayList.pageNumber+3 }.html">${gadrelayList.pageNumber+3 }</a>
							<a href="gadreplay/5_${gadrelayList.pageNumber+4}.html">${gadrelayList.pageNumber+4 }</a>
						</c:if>
						<c:if test="${gadrelayList.pageCount-gadrelayList.pageNumber<4 }">
							<c:set var="number" value="${gadrelayList.pageCount-gadrelayList.pageNumber}"/>
							<c:if test="${number>0 }">
								<c:forEach begin="1" end="${number }" step="1" varStatus="status">
									<a href="gadreplay/5_${gadrelayList.pageNumber+status.index}.html">${gadrelayList.pageNumber+status.index}</a>
								</c:forEach>
							</c:if>
						</c:if>
						<c:if test="${gadrelayList.haveNextPage }">
							<a href="gadreplay/5_${gadrelayList.pageNumber+1}.html">下一页</a>
						</c:if>
							<a href="gadreplay/5_${gadrelayList.pageCount}.html">最后一页</a>
					</div>
				</div>
			</div>
			<div class="index-content-right">
				<%@include file="right.jsp"%>
			</div>
			<%@include file="footer.jsp"%>
		</div>
	</div>
	<input type="hidden" id="ipaddress" value="" />
	<input type="hidden" id="ip" value="" />
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
	<script type="text/javascript">
		function cleartext(e) {
			var v = e.value;
			if (v == '不用登录也能评论哦！限200字') {
				e.value = '';
				e.style.color = '#000';
			}
		}
		document.getElementById("ipaddress").value = returnCitySN["cname"];
		document.getElementById("ip").value = returnCitySN["cip"];
	</script>
</body>
</html>
<script type="text/javascript" src="scripts/likeResource.js"></script>
<script type="text/javascript" src="scripts/gadReplay.js"></script>