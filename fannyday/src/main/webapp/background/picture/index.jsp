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
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<div class="content-title ft18">
		请选择菜单: 
		<select>
			<option value="0">请选择一级菜单</option>
			<c:forEach items="${catalogList }" var="catalog">
				<option value="${catalog.id }">${catalog.name }</option>
			</c:forEach>
		</select> 
		请选择标题: 
		<select>
			<option>第XXX期 搞笑图片</option>
			<option>第XXX期 搞笑图片</option>
			<option>第XXX期 搞笑图片</option>
			<option>第XXX期 搞笑图片</option>
			<option>第XXX期 搞笑图片</option>
			<option>第XXX期 搞笑图片</option>
		</select>
	</div>

	<!-- this is img content and pagesize is 10 -->
	<div class="show-content">
		<ul>
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
					</label> <a href="#" title="编辑"> <img src="images/Edit.png">
					</a> <a href="#" title="删除"> <img src="images/Garbage.png">
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
					</label> <a href="#" title="编辑"> <img src="images/Edit.png">
					</a> <a href="#" title="删除"> <img src="images/Garbage.png">
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
					</label> <a href="#" title="编辑"> <img src="images/Edit.png">
					</a> <a href="#" title="删除"> <img src="images/Garbage.png">
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
					</label> <a href="#" title="编辑"> <img src="images/Edit.png">
					</a> <a href="#" title="删除"> <img src="images/Garbage.png">
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
					</label> <a href="#" title="编辑"> <img src="images/Edit.png">
					</a> <a href="#" title="删除"> <img src="images/Garbage.png">
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
					</label> <a href="#" title="编辑"> <img src="images/Edit.png">
					</a> <a href="#" title="删除"> <img src="images/Garbage.png">
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
					</label> <a href="#" title="编辑"> <img src="images/Edit.png">
					</a> <a href="#" title="删除"> <img src="images/Garbage.png">
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
					</label> <a href="#" title="编辑"> <img src="images/Edit.png">
					</a> <a href="#" title="删除"> <img src="images/Garbage.png">
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
					</label> <a href="#" title="编辑"> <img src="images/Edit.png">
					</a> <a href="#" title="删除"> <img src="images/Garbage.png">
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
					</label> <a href="#" title="编辑"> <img src="images/Edit.png">
					</a> <a href="#" title="删除"> <img src="images/Garbage.png">
					</a>
				</div>
			</li>

		</ul>
	</div>
	<!-- this end show content  -->
	<div class="content-control ft18">
		总页数:11
		<a href="#" title="下一页">下一页</a>
		<a href="#" title="上一页">上一页</a> 
		请输入页数:<input type="text" name="pageIndex" />
		<input type="submit" value="go" />
		<button>发布</button>
		<button>删除</button>
	</div>
</body>
</html>