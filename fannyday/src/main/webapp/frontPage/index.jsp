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
<title>邪恶搞笑gif</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="搞笑,gif,内涵图">
<meta http-equiv="description" content="This is my page">
<link href="./styles/reset.css" rel="stylesheet" type="text/css">
<link href="./styles/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="styles/style.css" rel="stylesheet" type="text/css">
<link href="styles/lightbox.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="./scripts/jquery-1.7.2.min.js"></script>
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