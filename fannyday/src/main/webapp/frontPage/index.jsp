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
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?032a33f7d77bc10397258a7e663d754a";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
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
	<meta http-equiv="keywords"
		content="嘻哈大全,gif,搞笑,搞笑gif,今日囧途,漂亮MM,神回复,吐槽,神回复吐槽,恶搞,恶搞PS,节操笑话,笑话">
	<meta http-equiv="description"
		content="嘻哈大全收录了网民都爱看的内涵图,同时也是国内最全的爆笑gif图片库,为大家提供各类最搞笑的gif图片,看图片就上嘻哈大全">
</c:if>
<c:if test="${id eq '2' }">
	<meta http-equiv="keywords"
		content="嘻哈大全,gif,GIF,搞笑gif,动态图片,gif图片,gif动画,邪恶动态图">
	<meta http-equiv="description"
		content="嘻哈大全GIF库为大家提供互联网最新最搞笑的gif动画图片,享受瞬间高潮,就上嘻哈大全GIF库。这是一个看了就不想关的网站">
</c:if>
<c:if test="${id eq '3' }">
	<meta http-equiv="keywords"
		content="嘻哈大全,今日囧图,蛊惑图,每日囧途,搞笑,搞笑八卦,爆笑囧图,搞笑图片">
	<meta http-equiv="description"
		content="嘻哈大全今日囧图库为大家提供各类好看的每日囧图图片,让大家笑喷.看囧图就上嘻哈大全今日囧图">
</c:if>
<c:if test="${id eq '4' }">
	<meta http-equiv="keywords" content="MM,漂亮,美女,美眉,时尚,高清美女">
	<meta http-equiv="description"
		content="嘻哈大全美女图库为大家提供全球各类漂亮的MM,让大家在闲暇之余看看MM,陶怡情操。看漂亮美眉就上嘻哈大全漂亮MM">
</c:if>
<!-- <link href="./styles/reset.css" rel="stylesheet" type="text/css">
<link href="./styles/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
<link href="styles/style.css" rel="stylesheet" type="text/css">
<link href="styles/pbl.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./scripts/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="./scripts/jquery.infinitescroll.js"></script>
<script type="text/javascript">
	function item_masonry() {
		$('.item img').load(function() {
			$('.infinite_scroll').masonry({
				itemSelector : '.masonry_brick',
				columnWidth : 231,
				gutterWidth : 15
			});
		});
		//columnWidth 函数递增控制div左边距
		$('.infinite_scroll').masonry({
			itemSelector : '.masonry_brick',
			columnWidth : 231,
			gutterWidth : 15
		});
	}
	$(function() {
		//滚动条下拉事件
		function item_callback() {
			$('.item').mouseover(function() {
				$(this).css('border', '2px solid red');
				//alert(1);
				$('.btns', this).show();
			}).mouseout(function() {
				$(this).css('border', '1px solid #D9D4D4');
				$('.btns', this).hide();
			});
			item_masonry();
		}
		item_callback();
		$('.item').fadeIn();
		var sp = 1
		$(".infinite_scroll").infinitescroll({
			navSelector : "#more",
			nextSelector : "#more a",
			itemSelector : ".item",
			loading : {
				img : "images/masonry_loading_1.gif",
				msgText : '正在加载中....',
				finishedMsg : '木有了,看看下一页',
				finished : function() {

					sp++;
					if (sp >= 10) { //到第10页结束事件
						$("#more").remove();
						$("#infscr-loading").hide();
						$("#pagebox").show();
						$(window).unbind('.infscr');
					}
				}
			},
			errorCallback : function() {
				$("#pagebox").show();
			}
		}, function(newElements) {
			var $newElems = $(newElements);
			$('.infinite_scroll').masonry('appended', $newElems, false);
			$newElems.fadeIn();
			item_callback();
			return;
		});
	});
</script>
</head>
<body>
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
					<div class="demo clearfix">
						<div class="item_list infinite_scroll">
							<c:if test="${!empty randPicture }">
								<c:forEach var="randPicture" items="${randPicture}">
									<div class="item masonry_brick">
									<div class="item_t">
										<div class="img">
											<a href="detail/${randPicture.catalog_id}/${randPicture.id }/picture_0.html" target="_blank"><img width="210" alt="${randPicture.detail}"
												src="${randPicture.picture_url }" /></a>
											<div class="btns">
	
												<a href="detail/${randPicture.catalog_id}/${randPicture.id }/picture_0.html" data-id="1092"
													class="Button2 Button11 WhiteButton ContrastButton  repin_link  notlogin"><em></em>浏览<span
													class="num">(102)</span></a>
	
												<div class="f-r">
													<a href="detail/${randPicture.catalog_id}/${randPicture.id }/picture_0.html" data-id="1092"
														class="Button2 Button11 WhiteButton ContrastButton likebuttonnotlogin">
														<em></em><span class="text">收藏</span><span class="num">(0)</span>
													</a>
												</div>
												<!-- 收藏 攒一个  结束-->
											</div>
										</div>
										<div class="title">
											<span><a href="detail/${randPicture.catalog_id}/${randPicture.id }/picture_0.html" target="_blank" title="${randPicture.detail }">${randPicture.detail}</a></span>
										</div>
									</div>
									<div class="item_b clearfix">
										<div class="items_likes fl">
											<span>标签: 
												<a href="#">搞笑gif</a>
												<a href="#">恶搞图片</a>
											</span>
										</div>
									</div>
								</div>
								</c:forEach>
							</c:if>
							
						</div>
					</div>
					<button id="ScrollToTop" class="btnimg Button2 WhiteButton" type="button">返回<br>顶部</button>
					<%-- <div class="main  tab_kc1" style="display: block;">
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
						
					</div> --%>
				</div>
			</div>

			<div class="index-content-right">
				<%@ include file="right.jsp"%>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript" src="./scripts/index.js"></script>
	<script type="text/javascript" src="./scripts/jquery.masonry.min.js"></script>
	<script type="text/javascript">
//回话顶部JS，最下面还有一段代码
var ScrollToTop=ScrollToTop||{
	setup:function(){
		
		var a=$(window).height()/2;
		$(window).scroll(function(){
			(window.innerWidth?window.pageYOffset:document.documentElement.scrollTop)>=a?$("#ScrollToTop").removeClass("Offscreen"):$("#ScrollToTop").addClass("Offscreen")
		});
		$("#ScrollToTop").click(function(){
			$("html, body").animate({scrollTop:"0px"},400);
			return false
		})
	}
};
$(document).ready(function(){
	ScrollToTop.setup();
});
</script>
</body>
</html>