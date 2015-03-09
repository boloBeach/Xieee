<div class="index-title">
	<ul>
		<#if user_name??>
			<li class="ft12">${user_name}欢迎您</li>
		<#else>
			<li><a href="login.html" class="ft12">登陆</a></li>
		</#if>
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
			<#list catalogList as catalogList>
				<#if (catalogList.id==1)>
					<li class="on">
					<input type="hidden" value="${catalogList.id}" class="showUrlId"/>
					<a href="${catalogList.url}?urlId=${catalogList.id}" class="ft14"
						title="${catalogList.name }">${catalogList.name }</a></li>
				<#else>
					<li><a href="${catalogList.url}?urlId=${catalogList.id}"
						class="ft14" title="${catalogList.name }">${catalogList.name }</a>
					</li>
				</#if>
			</#list>
		</ul>
	</div>
</div>