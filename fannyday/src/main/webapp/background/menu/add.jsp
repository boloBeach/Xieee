<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>background/">    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <title>this is title</title>        
 <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
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

        @media (max-width: 980px) {
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
<form action="addMenu.action" method="post" class="definewidth m20">
<table class="table table-bordered table-hover m10">
    <tr>
        <td width="10%" class="tableleft">上级</td>
        <td>
            <select name="parent_catalog_id">
	            <option value="0">请选择一级菜单</option>
	            <c:forEach items="${catalog }"  var="catalog">
	            	<option value="${catalog.id }">${catalog.name }</option>
	            </c:forEach>       
           	</select>
        </td>
    </tr>
    <tr>
        <td class="tableleft">名称</td>
        <td><input type="text" name="name"/></td>
    </tr>
    <tr>
        <td class="tableleft">Model</td>
        <td><input type="text" name="module"/></td>
    </tr>
    <tr>
        <td class="tableleft">Action</td>
        <td><input type="text" name="url"/></td>
    </tr>
    <tr>
        <td class="tableleft">备注</td>
        <td><input type="text" name="remark"/></td>
    </tr>
    <tr>
        <td class="tableleft">状态</td>
        <td>
            <input type="radio" name="is_delete" value="1" checked/> 启用
            <input type="radio" name="is_delete" value="0"/> 禁用
        </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="index.html";
		 });

    });
</script>