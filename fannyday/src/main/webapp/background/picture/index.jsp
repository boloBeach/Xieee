<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>background/">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<title>图片后台审核管理页面</title>
<link href="Css/pictureManager.css" rel="stylesheet"
	type="text/css" />
<link href="Css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="Js/pictureIndex.js"></script>
</head>
<body>
	<form action="submitPicture.action" method="post">
	<div class="content-title ft18">
		请选择菜单: 
		<select id="menuOne" name="parentOneId">
			<option value="0">请选择一级菜单</option>
			<c:forEach items="${catalogList }" var="catalog">
				<option value="${catalog.id }">${catalog.name }</option>
			</c:forEach>
		</select> 
		请选择标题: 
		<select id="menuTwo" name="parentTwoId">
			<option>第XXX期 搞笑图片</option>
			<option>第XXX期 搞笑图片</option>
		</select>
		
		<a href="javascript:;" id="all">全部选择</a>
		<a href="javascript:;" id="delAll">取消选择</a>
		<a href="javascript:;" id="antiAll">反向选择</a>    
	</div>

	<!-- this is img content and pagesize is 10 -->
	<div class="show-content">
		<ul>
		
		<c:forEach var="list" items="${pager.list }">
			<li>
				<div class="show-content-img-title">
					${list.detail }</div>
				<div class="show-content-img">
					<img alt="${list.detail }"
						title="${list.detail }"
						src="${list.local_url }">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18">
					 <input type="checkbox" id="inlineCheckbox1" name="pictureIds" value="${list.id }">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li>
		</c:forEach>
		
			<!-- <li>
				<div class="show-content-img-title">
					俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！</div>
				<div class="show-content-img">
					<img alt="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						title="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						src="http://ww3.sinaimg.cn/mw690/7f232787gw1emn623467sg208c069x6p.gif">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18"> <input type="checkbox"
						id="inlineCheckbox1" value="option1">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li>

			<li>
				<div class="show-content-img-title">
					俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！</div>
				<div class="show-content-img">
					<img alt="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						title="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						src="http://ww3.sinaimg.cn/mw690/7f232787gw1emn623467sg208c069x6p.gif">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18"> <input type="checkbox"
						id="inlineCheckbox1" value="option1">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li>

			<li>
				<div class="show-content-img-title">
					俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！</div>
				<div class="show-content-img">
					<img alt="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						title="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						src="http://ww3.sinaimg.cn/mw690/7f232787gw1emn623467sg208c069x6p.gif">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18"> <input type="checkbox"
						id="inlineCheckbox1" value="option1">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li>

			<li>
				<div class="show-content-img-title">
					俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！</div>
				<div class="show-content-img">
					<img alt="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						title="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						src="http://ww3.sinaimg.cn/mw690/7f232787gw1emn623467sg208c069x6p.gif">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18"> <input type="checkbox"
						id="inlineCheckbox1" value="option1">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li>

			<li>
				<div class="show-content-img-title">
					俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！</div>
				<div class="show-content-img">
					<img alt="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						title="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						src="http://ww3.sinaimg.cn/mw690/7f232787gw1emn623467sg208c069x6p.gif">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18"> <input type="checkbox"
						id="inlineCheckbox1" value="option1">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li>

			<li>
				<div class="show-content-img-title">
					俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！</div>
				<div class="show-content-img">
					<img alt="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						title="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						src="http://ww3.sinaimg.cn/mw690/7f232787gw1emn623467sg208c069x6p.gif">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18"> <input type="checkbox"
						id="inlineCheckbox1" value="option1">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li>

			<li>
				<div class="show-content-img-title">
					俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！</div>
				<div class="show-content-img">
					<img alt="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						title="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						src="http://ww3.sinaimg.cn/mw690/7f232787gw1emn623467sg208c069x6p.gif">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18"> <input type="checkbox"
						id="inlineCheckbox1" value="option1">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li>

			<li>
				<div class="show-content-img-title">
					俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！</div>
				<div class="show-content-img">
					<img alt="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						title="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						src="http://ww3.sinaimg.cn/mw690/7f232787gw1emn623467sg208c069x6p.gif">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18"> <input type="checkbox"
						id="inlineCheckbox1" value="option1">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li>

			<li>
				<div class="show-content-img-title">
					俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！</div>
				<div class="show-content-img">
					<img alt="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						title="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						src="http://ww3.sinaimg.cn/mw690/7f232787gw1emn623467sg208c069x6p.gif">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18"> <input type="checkbox"
						id="inlineCheckbox1" value="option1">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li>

			<li>
				<div class="show-content-img-title">
					俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！</div>
				<div class="show-content-img">
					<img alt="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						title="俩妹子恶搞xxoo姿势gif动图：你这个疯子，放开那个妹纸，让我来！"
						src="http://ww3.sinaimg.cn/mw690/7f232787gw1emn623467sg208c069x6p.gif">
				</div>
				<div class="content-img-control">
					<label class="checkbox-inline ft18"> <input type="checkbox"
						id="inlineCheckbox1" value="option1">
					</label> <a href="#" title="编辑"> <img src="Images/Edit.png">
					</a> <a href="#" title="删除"> <img src="Images/Garbage.png">
					</a>
				</div>
			</li> -->

		</ul>
	</div>
	<!-- this end show content  -->
		<div class="content-control ft18">
			总页数:${pager.pageCount }
			<c:if test="${pager.haveNextPage==true}">
				<a href="showPictureIndex.action?currentPage=${pager.pageNumber+1 }" title="下一页">下一页</a>
			</c:if>
			<c:if test="${pager.havePrePage==true }">
				<a href="showPictureIndex.action?currentPage=${pager.pageNumber-1 }" title="上一页">上一页</a> 
			</c:if>
			当前页:${pager.pageNumber}
			<input type="radio" value="1" name="types" checked="checked"/>发布&nbsp;&nbsp;
			<input type="radio" value="0" name="types"/>删除&nbsp;&nbsp;
			<button type="submit">提交</button>
		</div>
	</form>
</body>
</html>