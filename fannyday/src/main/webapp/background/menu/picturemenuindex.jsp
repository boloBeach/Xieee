<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>图片标题管理</title>        
  <link href="background/Css/common.css" rel="stylesheet" type="text/css" />
  <link href="background/Css/picturemenuindex.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="background/Css/bootstrap.css" />
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">    
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
 </head>
 <body>
 	<div class="menu-title ft18">
 		请选择一级菜单:
 		<select>
 			<option>菜单一</option>
 			<option>菜单一</option>
 			<option>菜单一</option>
 			<option>菜单一</option>
 		</select>
 	</div>
 	<div>
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
		<tr>
			<td>首&nbsp;&nbsp;页</td>
			<td>一级菜单</td>
			<td>Merchant</td>
			<td>index</td>
			<td>0</td>
			<td><a href="background/menu/pictureEdit.jsp">编辑</a></td>
		</tr>
		<tr>
			<td>今日囧图</td>
			<td>一级菜单</td>
			<td>Node</td>
			<td>index</td>
			<td>0</td>
			<td><a href="background/menu/pictureEdit.jsp">编辑</a></td>
		</tr>
		<tr>
			<td>搞笑gif</td>
			<td>一级菜单</td>
			<td>Role</td>
			<td>index</td>
			<td>0</td>
			<td><a href="background/menu/pictureEdit.jsp">编辑</a></td>
		</tr>
		<tr>
			<td>专业吐槽</td>
			<td>一级菜单</td>
			<td>User</td>
			<td>index</td>
			<td>0</td>
			<td><a href="background/menu/pictureEdit.jsp">编辑</a></td>
		</tr>
		<tr>
			<td>搞笑漫画</td>
			<td>一级菜单</td>
			<td>Menu</td>
			<td>index</td>
			<td>0</td>
			<td><a href="background/menu/pictureEdit.jsp">编辑</a></td>
		</tr>
		<tr>
		</tr>
	</table>
 	</div>
 </body>
</html>