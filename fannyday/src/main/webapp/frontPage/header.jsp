<%@page import="net.xieee.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="index-title">
	<ul>
		<c:choose>
			<c:when test="${!empty user_name }">
				<li class="ft12">${user_name}欢迎您</li>
			</c:when>
			<c:otherwise>
				<li><a href="login.html" class="ft12">登陆</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="register.html" class="ft12">注册</a></li>
		<li><a href="" class="ft12">投诉</a></li>
	</ul>
</div>

<!--header start-->
<div class="index-header">
	<div class="index-head">
		<div class="index-logo ft20">Happy Day</div>
		<div class="index-rss">
			<ul>
				<li><a class="qq"> <i></i> <span class="gray"> <em
							class="black">订阅</em><br> QQ邮箱
					</span>
				</a></li>
			</ul>
			<div class="clear"></div>
			<br>
			<div class="index-search">
				<input type="text" class="ft12" id="search"> <i></i>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="index-nav">
		<ul>
			<c:forEach items="${catalogList}" var="catalogList"
				varStatus="status">
				
				<c:if test="${catalogList.id eq id}">
					<li class="on">
					<input type="hidden" value="${catalogList.id}" class="showUrlId"/>
					<a href="${catalogList.url}" class="ft14"
						title="${catalogList.name }">${catalogList.name }</a></li>
				</c:if>

				<c:if test="${catalogList.id != id}">
					<li><a href="${catalogList.url}"
						class="ft14" title="${catalogList.name }">${catalogList.name }</a>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>