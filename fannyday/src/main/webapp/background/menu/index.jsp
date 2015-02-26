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
<base href="<%=basePath%>background/">
<title>this is title</title>
<link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="Css/style.css" />
<script type="text/javascript" src="Js/jquery.js"></script>
<script type="text/javascript" src="Js/bootstrap.js"></script>
<script type="text/javascript" src="Js/ckform.js"></script>
<script type="text/javascript" src="Js/common.js"></script>

<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
</head>
<body>
	<form class="form-inline definewidth m20" action="index.html"
		method="get">
		菜单名称：
			 <select id="menu">
			 	<option value="0">请选择一级菜单</option>
			 	<c:forEach items="${catalog }" var="catalog">
			 		<option value="${catalog.id }">${catalog.name }</option>
			 	</c:forEach>
			</select>
	<button type="submit" class="btn btn-primary">查询</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-success" id="addnew">新增菜单</button>
	</form>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>菜单标题</th>
				<th>上级菜单</th>
				<th>MODEL</th>
				<th>ACTION</th>
				<th>状态</th>
				<th>管理操作</th>
			</tr>
		</thead>
		<c:forEach var="catalog" items="${catalog }">
			<tr>
				<td>${catalog.name }</td>
				<c:if test="${catalog.parent_catalog_id==0 }">
					<td>一级菜单</td>
				</c:if>
				<td>Merchant</td>
				<td>${catalog.url }</td>
				<c:if test="${catalog.is_delete==1 }">
					<td>可用</td>
				</c:if>
				
				<c:if test="${catalog.is_delete==0 }">
					<td>不可用</td>
				</c:if>
				<td><a href="menuEditShow.action?id=${catalog.id }">编辑</a></td>
			</tr>
		</c:forEach>
		
		<!-- <tr>
			<td>今日囧图</td>
			<td>一级菜单</td>
			<td>Node</td>
			<td>index</td>
			<td>0</td>
			<td><a href="edit.html">编辑</a></td>
		</tr>
		<tr>
			<td>搞笑gif</td>
			<td>一级菜单</td>
			<td>Role</td>
			<td>index</td>
			<td>0</td>
			<td><a href="edit.html">编辑</a></td>
		</tr>
		<tr>
			<td>专业吐槽</td>
			<td>一级菜单</td>
			<td>User</td>
			<td>index</td>
			<td>0</td>
			<td><a href="edit.html">编辑</a></td>
		</tr>
		<tr>
			<td>搞笑漫画</td>
			<td>一级菜单</td>
			<td>Menu</td>
			<td>index</td>
			<td>0</td>
			<td><a href="edit.html">编辑</a></td>
		</tr> -->
	</table>

</body>
</html>
<script>
	$(function() {

		$('#addnew').click(function() {
			window.location.href = "addshow.action";
		});

	});
</script>