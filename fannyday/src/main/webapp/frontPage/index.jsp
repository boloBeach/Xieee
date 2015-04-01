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
<c:if test="${id eq '1' }">
	<title>嘻哈大全-快乐每一天</title>
</c:if>

<c:if test="${id eq '2' }">
	<title>嘻哈大全-搞笑Gif</title>
</c:if>

<c:if test="${id eq '3' }">
	<title>嘻哈大全-今日囧图</title>
</c:if>

<c:if test="${id eq '4' }">
	<title>嘻哈大全-漂亮MM</title>
</c:if>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<c:if test="${id eq '1' }">
	<meta http-equiv="keywords" content="嘻哈大全,gif,搞笑,搞笑gif,今日囧途,漂亮MM,神回复,吐槽,神回复吐槽,恶搞,恶搞PS,节操笑话,笑话">
	<meta http-equiv="description" content="嘻哈大全收录了网民都爱看的内涵图,同时也是国内最全的爆笑gif图片库,为大家提供各类最搞笑的gif图片,看图片就上嘻哈大全">
</c:if>
<c:if test="${id eq '2' }">
	<meta http-equiv="keywords" content="嘻哈大全,gif,GIF,搞笑gif,动态图片,gif图片,gif动画,邪恶动态图">
	<meta http-equiv="description" content="嘻哈大全GIF库为大家提供互联网最新最搞笑的gif动画图片,享受瞬间高潮,就上嘻哈大全GIF库。这是一个看了就不想关的网站">
</c:if>
<c:if test="${id eq '3' }">
	<meta http-equiv="keywords" content="嘻哈大全,今日囧图,蛊惑图,每日囧途,搞笑,搞笑八卦,爆笑囧图,搞笑图片">
	<meta http-equiv="description" content="嘻哈大全今日囧图库为大家提供各类好看的每日囧图图片,让大家笑喷.看囧图就上嘻哈大全今日囧图">
</c:if>
<c:if test="${id eq '4' }">
	<meta http-equiv="keywords" content="MM,漂亮,美女,美眉,时尚,高清美女">
	<meta http-equiv="description" content="嘻哈大全美女图库为大家提供全球各类漂亮的MM,让大家在闲暇之余看看MM,陶怡情操。看漂亮美眉就上嘻哈大全漂亮MM">
</c:if>
<link href="./styles/reset.css" rel="stylesheet" type="text/css">
<link href="./styles/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="styles/style.css" rel="stylesheet" type="text/css">
<link href="styles/lightbox.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./scripts/jquery-1.7.2.min.js"></script>
<script language="javascript">
	$(document).ready(function() {
		$(".tab_left a").each(function(j) {
			var num = j + 1;
			$(this).click(function() {
				$(".tab_left a").attr("class", "");
				$(this).attr("class", "hovera");
				for (var i = 1; i <= 5; i++) {
					$(".tab_kc" + i).css("display", "none");
				}
				$(".tab_kc" + num).css("display", "block");
				//每次选项时都触发瀑布流
				var $waterfall = $('.waterfall');
				$waterfall.masonry({
					columnWidth : 245
				});
				//每次选项时都触发瀑布流end

			});
		});
	});
</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function() {
		$(".zoom,.ilike").hide();

		$(".zoom").each(function() { //遍历所有对象
			var src = $(this).prev("a").find("img").attr("src");
			$(this).attr({
				href : src
			});
		});

		$("#nav li").click(function() {
			$("#nav a").removeClass("hover");
			$(this).find("a").addClass("hover");
		});

		$(".waterfall li").mouseover(function() {
			$(this).addClass("hover");
			$(this).find(".zoom,.ilike").show();
		});

		$(".waterfall li").mouseout(function() {
			$(this).removeClass("hover");
			$(this).find(".zoom,.ilike").hide();
		});
	});
</script>
	<div class="index-container">
		<%@ include file="./header.jsp"%>

		<!--content start-->
		<div class="index-content">
			<div class="index-content-left">
				<div class="index-content-left-title">
					<span class="ft18 gray"> 最新内容 </span>
					<ul id="sort">
						<li data-sort="time"><a href="javascript:;"
							class="ft12 black-light">时间</a></li>
						<li data-sort="heat" class="on"><a href="javascript:;"
							class="ft12 black-light">热度</a></li>
					</ul>
				</div>
				<!-- 内容部分-->
				<div class="index-content-item">
					<div class="index-content-item-title">
						随机资源<span><a href="#" title="更多" target="_blank">更多</a></span>
					</div>
					<!-- main -->
					<div class="main  tab_kc1" style="display: block;">
						<ul class="waterfall">
					 <c:if test="${!empty randPicture }">
              				<c:forEach var="randPicture" items="${randPicture}">
              					<li>
              						<div class="img_block">
										<a href="detail/${randPicture.catalog_id}/${randPicture.id }/picture_0.html" target="_blank">
	              							<img src="${randPicture.picture_url }" data-bd-imgshare-binded="1">
	              						</a>
										<a href="#" rel="lightbox[plants]" title="${randPicture.detail}" class="zoom">放大</a>
										<a href="#" class="ilike">YYM</a>
									</div>
									<h3>${randPicture.detail}</h3>
									<div class="iNum">
										<span>1</span><a href="#">4</a>
									</div>
									<p><a href="detail/${randPicture.catalog_id}/${randPicture.id }/picture_0.html" target="_blank" title="${randPicture.detail }">${randPicture.detail}</a></p>
		              				
              					</li>
              				</c:forEach>
              			</c:if> 
							
						</ul>
						
					</div>
				</div>
			</div>

			<div class="index-content-right">
				<%@ include file="right.jsp"%>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	<div class="index-footer">
		<p class="ft12 gray">
			&copy;2014 Made By <i>Lihuabest</i>.All rights Reserved.
		</p>
	</div>
	<script type="text/javascript" src="./scripts/index.js"></script>
	<script type="text/javascript" src="./scripts/jquery.masonry.min.js"></script>
	<script type="text/javascript" src="./scripts/lightbox.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var $waterfall = $('.waterfall');
			$waterfall.masonry({
				columnWidth : 245
			});
		});
	</script>
</body>
</html>