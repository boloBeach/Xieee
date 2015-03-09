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
    <link href="./styles/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="styles/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./scripts/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="./scripts/index.js"></script>
 </head>
 <body>
 	<div class="index-container">
 	<#include "header.ftl"/>

        <!--content start-->
        <div class="index-content">
            <div class="index-content-left">
                <div class="index-content-left-title">
                    <span class="ft18 gray">
                        最新内容
                    </span>
                    <ul id="sort">
                        <li data-sort="time"><a href="javascript:;" class="ft12 black-light">时间</a></li>
                        <li data-sort="heat" class="on"><a href="javascript:;" class="ft12 black-light">热度</a></li>
                    </ul>
                </div>
                <!-- 内容部分-->
               <div class="index-content-item">
              		<div class="index-content-item-title">
              			随机资源<span><a href="#" title="更多" target="_blank">更多</a></span>
              		</div>
              		<div class="index-content-item-content">
              			<ul class="content-list">
              				<#if randPicture?size!=0>
              					<#list randPicture as randPicture>
              						<li>
		              					<a href="detailpicture.html?parentId=${randPicture.id }" target="_blank">
		              						<img src="${randPicture.picture_url }" data-bd-imgshare-binded="1">
		              					</a><p>
			              				<a href="detailpicture.html?parentId=${randPicture.id }" target="_blank" title="${randPicture.detail }">
			              					<div>${randPicture.detail}</div>
			              				</a></p>
	              					</li>
              					</#list>
              				</#if>
              			</ul>
              		</div>
               </div>
            </div>

            <div class="index-content-right">
               <#include "right.ftl"/>
            </div>
            	<#include "footer.ftl"/>
           </div>
		</div>
 </body>
</html>