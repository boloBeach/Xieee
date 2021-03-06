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
<base href="<%=basePath%>">
<title>图片标题管理</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="background/Css/common.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="background/Css/bootstrap.css" />
<script type="text/javascript" src="background/Js/jquery.js"></script>
<script type="text/javascript" src="background/Js/pricturement.js"></script>
<style type="text/css">
.pagers {
	width: 950px;
	height: 50px;
	margin-top:20px;
	margin: 0 auto;
}

.pagers button{
	margin-left: 15px;
}
.pagers span{
	font-size: 15px;
	font-weight: bolder;
	margin-left: 15px;
}

</style>
</head>
<body>
	<div class="menu-title ft18">
		请选择一级菜单: <select id="menuone">
			<option value="0">请选择一级菜单</option>
			<c:forEach items="${catalogList}" var="catalog">
				<option value="${catalog.id }">${catalog.name }</option>
			</c:forEach>
		</select>
		<button type="button" class="btn btn-success" id="addnew">添加图片标题</button>
	</div>
	<div>
		<table class="table table-bordered table-hover definewidth m10">
			<thead>
				<tr>
					<th>菜单标题</th>
					<th>上级菜单</th>
					<th>URL</th>
					<th>状态</th>
					<th>管理操作</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${catalogList }" var="catalog">
					<tr>
						<td>${catalog.name }</td>
						<td>${catalog.parent_catalog_id }</td>
						<td>${catalog.url }</td>
						<td>${catalog.is_delete }</td>
						<td><a href="background/editPicture.action?id=${catalog.id }">编辑</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagers">
			
		</div>
	</div>
</body>
</html>
<script>
	$(function() {
		$('#addnew').click(function() {
			window.location.href = "background/addParentPicture.action";
		});

	});
</script>