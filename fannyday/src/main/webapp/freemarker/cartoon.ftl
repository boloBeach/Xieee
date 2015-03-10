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

<script type="text/javascript"
	src="scripts/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="scripts/index.js"></script>
</head>
<body>
	<div class="index-container">
		<#include "header.ftl"/>
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
				<#list cartoon as cartoon>
					<#if cartoon_index=0>
				<div class="index-content-left-item">
					<h1 class="ft20">${cartoon.cartoon_title }</h1>
					<div class="item-info ft12">
						<i class="gray">by</i>&nbsp;&nbsp;${cartoon.cartoon_user_name }&nbsp; <i class="gray">on
							2014/12/29</i>&nbsp; 0 comments <span class="item-type item-type-4"></span>
					</div>
					<div class="item-content ft14" style="text-align: center;">
						<#--
						<img alt="${cartoon.cartoon_title }" src="${cartoon.cartoon_local_url }" style="width:600px ;height: ${cartoon.image_heigth}px;">
						<#elseif cartoon.image_width==0 >
							<img alt="${cartoon.cartoon_title }" src="${cartoon.cartoon_local_url }" style="width:600px ;height: 2500px;">
						<#else>
						-->
						<#if cartoon.image_width??>
							<img alt="${cartoon.cartoon_title }" src="${cartoon.cartoon_local_url }" style="width:${cartoon.image_width}px ;height: ${cartoon.image_height}px;">
						</#if>
						<br>
						<br>
						${cartoon.cartoon_detail }<br>
					</div>
					<div class="item-assess">
						<input type="hidden" class="cartoon_id" value="${cartoon.id }"/>
						<a class="good" title="顶一个"> <i class="icon icon-hand-up"></i><span>${cartoon.top_count}</span></a> 
						<a class="bad" title="且..."> <i class="icon icon-thumbs-down"></i><span>${cartoon.down_count}</span> </a> 
						<a class="old" title="老漫画"> <i class="icon icon-hand-down"></i>老漫画(<span>${cartoon.old_cartoon}</span>)</a>
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
					</#if>
					<#if cartoon_index=0>
						<div class="clear"></div>
						<div class="item-next">
					</#if>
					<#if cartoon_index=1>
						<span class="float-left ft12"> 上一篇：
							<#if cartoon??>
								<a href="cartoon.html?urlId=${id }&currentPage=${cartoon.id}">${cartoon.cartoon_title }</a>
							<#else>
								<a href="cartoon.html">没有上一页了。。</a>
							</#if>
						</span> 
					</#if>
					<#if cartoon_index=2>
						<span class="float-right ft12"> 
						下一篇：
							<#if cartoon??>
								<a href="cartoon.html?urlId=${id }&currentPage=${cartoon.id}">${cartoon.cartoon_title }</a>
							<#else>
								<a href="#">没有下一页了。。</a>
							</#if>
						</span>
					</#if>
					<#if cartoon_index=0>
						</div>
					</#if>
					</#list>
					<div class="clear"></div>
					<div class="item-comment-write">
						<form>
							<textarea id="comment" class="ft14"></textarea>
							<input type="button" value="发表评论">
						</form>
					</div>
					<div class="clear"></div>
					<div class="item-comment ft12">
						<h2>评论：</h2>
						<ul>
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
								</div></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="index-content-right">
				<#include "right.ftl"/>
			</div>
			<#include "footer.ftl"/>
		</div>
	</div>
	<script type="text/javascript" src="http://tool.keleyi.com/ip/visitoriphost/"></script>
	<span id="keleyivisitorip" style="visibility: hidden;"></span>
</body>
</html>
<script type="text/javascript" src="scripts/likeResource.js"></script>