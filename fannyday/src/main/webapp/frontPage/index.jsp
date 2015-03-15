<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <link href="./styles/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="styles/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./scripts/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="./scripts/index.js"></script>
 </head>
 <body>
 	<div class="index-container">
 	<%@ include file="./header.jsp" %>
  		<%-- <div class="index-title">
        <ul>
        <c:choose>
        	<c:when test="${!empty user_name }">
        		<li class="ft12">${user_name}欢迎您</li>
        	</c:when>
        	<c:otherwise>
        		<li><a href="./frontPage/login.jsp" class="ft12">登陆</a></li>
        	</c:otherwise>
        </c:choose>
        	<c:if test="${1==1}">
        		<li class="ft14">${user_name}欢迎您</li>
        	</c:if> 
        	<c:if test="${1=1}">
           	 	<li><a href="./frontPage/login.jsp" class="ft12">登陆</a></li>
            </c:if>
            <li><a href="./frontPage/register.jsp" class="ft12">注册</a></li>
            <li><a href="" class="ft12">投诉</a></li>
        </ul>
    </div>
    
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
                	<c:forEach items="${catalogList}" var="catalogList" varStatus="status">
                		
                			<c:if test="${status.index==0}">
	                			<li class="on">
	                				<a href="${catalogList.url}?urlId=${catalogList.id}" class="ft14" title="${catalogList.name }">${catalogList.name }</a>
	                			</li>
                			</c:if>
                			
                			<c:if test="${status.index!=0}">
	                			<li>
	                				<a href="${catalogList.url}?urlId=${catalogList.id}" class="ft14" title="${catalogList.name }">${catalogList.name }</a>
	                			</li>
                			</c:if>
                		
                	</c:forEach>
                   <!--  <li class="on"><a href="./frontPage/index.jsp" class="ft14">首页</a></li>
                    <li>
                        <a href="" class="ft14">今日囧图</a>
                        <ul class="index-child-nav">
                            <li><a href="" class="">二级菜单1</a></li>
                            <li><a href="" class="">二级菜单2</a></li>
                            <li><a href="" class="">二级菜单3</a></li>
                        </ul>
                    </li>
                    <li><a href="" class="ft14">搞笑gif</a></li>
                    <li><a href="" class="ft14">专业吐槽</a></li>
                    <li><a href="" class="ft14">恶搞ps</a></li>
                    <li><a href="" class="ft14">搞笑漫画</a></li> -->
                    <!--<li><a href="" class="ft14">MOVIES</a></li>-->
                    <!--<li><a href="" class="ft14">MUSIC</a></li>-->
                </ul>
            </div>
        </div> --%>
        <!--header end-->

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
              				<c:if test="${!empty randPicture }">
	              				<c:forEach var="randPicture" items="${randPicture}">
	              					<li>
		              					<a href="detail/${id}/${randPicture.id }/picture_0.html" target="_blank">
		              						<img src="${randPicture.picture_url }" data-bd-imgshare-binded="1">
		              					</a><p>
			              				<a href="detail/${id}/${randPicture.id }/picture_0.html" target="_blank" title="${randPicture.detail }">
			              					<div>${randPicture.detail}</div>
			              				</a></p>
	              					</li>
	              				</c:forEach>
              				</c:if>
              				
              				<!-- <li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				 -->
              			</ul>
              		</div>
              		
              		
              		<!-- <div class="index-content-item-title">
              			搞笑GIF<span><a href="#" title="更多" target="_blank">更多</a></span>
              		</div>
              		<div class="index-content-item-content">
              			<ul class="content-list">
              			
              			
              				
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				<li>
              					<a href="#" target="_blank">
              						<img src="http://image.qqsky.cc/uploads/allimg/150126/1-150126234532R5-lp.gif" data-bd-imgshare-binded="1">
              					</a><p>
              				<a href="#" target="_blank" title="老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了">
              					<div>老妈给儿子讲故事，突然深情并茂地喊了一声……熊妈妈太坏了</div>
              				</a></p>
              				</li>
              				
              				
              			</ul>
              		</div> -->
               </div>
            </div>

            <div class="index-content-right">
               <%@ include file="right.jsp" %>
            </div>
           <jsp:include page="footer.jsp"></jsp:include>
           </div>
		</div>
		<div class="index-footer">
			<p class="ft12 gray">
				&copy;2014 Made By <i>Lihuabest</i>.All rights Reserved.
			</p>
		</div>
 </body>
</html>