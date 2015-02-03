<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="index-title">
	<ul>
		<c:choose>
			<c:when test="${!empty user_name }">
				<li class="ft12">${user_name}欢迎您</li>
			</c:when>
			<c:otherwise>
				<li><a href="./frontPage/login.jsp" class="ft12">登陆</a></li>
			</c:otherwise>
		</c:choose>
		<%-- <c:if test="${1==1}">
        		<li class="ft14">${user_name}欢迎您</li>
        	</c:if> 
        	<c:if test="${1=1}">
           	 	<li><a href="./frontPage/login.jsp" class="ft12">登陆</a></li>
            </c:if> --%>
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

				<c:if test="${status.index==0}">
					<li class="on"><a
						href="${catalogList.url}?urlId=${catalogList.id}" class="ft14"
						title="${catalogList.name }">${catalogList.name }</a></li>
				</c:if>

				<c:if test="${status.index!=0}">
					<li><a href="${catalogList.url}?urlId=${catalogList.id}"
						class="ft14" title="${catalogList.name }">${catalogList.name }</a>
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
</div>