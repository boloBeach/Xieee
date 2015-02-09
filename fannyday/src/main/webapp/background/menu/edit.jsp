<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>background/">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<link rel="stylesheet" type="text/css" href="./Css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="./Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="./Css/style.css" />
<script type="text/javascript" src="./Js/jquery.js"></script>
<script type="text/javascript" src="./Js/bootstrap.js"></script>
<script type="text/javascript" src="./Js/ckform.js"></script>
<script type="text/javascript" src="./Js/common.js"></script>
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
<form action="updateMenu.action" method="post" class="definewidth m20">
	<table class="table table-bordered table-hover m10">
		<tr>
			<td width="10%" class="tableleft">上级</td>
			<td><select name="parentid">
					<option value="${catalog.parent_catalog_id }">
						<c:if test="${catalog.parent_catalog_id==0 }">
							一级菜单
						</c:if>
					</option>
			</select></td>
		</tr>
		
		<tr>
			<td class="tableleft">菜单Id</td>
			<td><input type="text" name="id" readonly="readonly" value="${catalog.id }"/></td>
		</tr>
		
		<tr>
			<td class="tableleft">名称</td>
			<td><input type="text" name="name" value="${catalog.name }"/></td>
		</tr>
		<tr>
			<td class="tableleft">Action</td>
			<td><input type="text" name="url" value="${catalog.url }"/></td>
		</tr>
		<tr>
			<td class="tableleft">状态</td>
			<td>
				<c:if test="${catalog.is_delete==1 }">
					<input type="radio" name="is_delete" value="1" checked="checked" /> 启用 
					<input type="radio" name="is_delete" value="0" /> 禁用
				</c:if>
				
				<c:if test="${catalog.is_delete==0 }">
					<input type="radio" name="is_delete" value="1" /> 启用 
					<input type="radio" name="is_delete"  value="0" checked="checked" /> 禁用
				</c:if>
			</td>
		</tr>
		<tr>
			<td class="tableleft"></td>
			<td>
				<button type="submit" class="btn btn-primary" type="button">保存</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-success" name="backid"
					id="backid">返回列表</button>
			</td>
		</tr>
	</table>
</form>
<script>
	$(function() {
		$('#backid').click(function() {
			window.location.href = "index.html";
		});

	});
</script>