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
    <title>this is title</title>  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">    
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
   <link rel="stylesheet" type="text/css" href="background/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="background/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="background/Css/style.css" />
    <script type="text/javascript" src="background/Js/jquery.js"></script>
    <script type="text/javascript" src="background/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="background/Js/bootstrap.js"></script>
    <script type="text/javascript" src="background/Js/ckform.js"></script>
    <script type="text/javascript" src="background/Js/common.js"></script>

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
<form action="background/updatePicture.action" method="post" class="definewidth m20">
<table class="table table-bordered table-hover m10">
    <tr>
        <td width="10%" class="tableleft">上级菜单ID</td>
        <td>
           <input type="text" name="catalog_id" value="${parentPicture.catalog_id }" readonly="readonly"/>
        </td>
    </tr>
    
    <tr>
        <td width="10%" class="tableleft">ID</td>
        <td>	
           <input type="text" name="id" value="${parentPicture.id }" readonly="readonly"/>
        </td>
    </tr>
    
    <tr>
        <td class="tableleft">名称</td>
        <td><input type="text" name="parent_picture_name" value="${parentPicture.parent_picture_name }"/></td>
    </tr>
    <tr>
        <td class="tableleft">detail-详情</td>
        <td><textarea rows="10" cols="10" name="detail">${parentPicture.detail }</textarea></td>
    </tr>
    <tr>
        <td class="tableleft">点击次数</td>
        <td><input type="text" name="skim_count" value="${parentPicture.skim_count }"/></td>
    </tr>
     <tr>
        <td class="tableleft">URL</td>
        <td><input type="text" name="picture_url" value="${parentPicture.picture_url }"/></td>
    </tr>
    <tr>
        <td class="tableleft">状态</td>
        <td>
        	<c:if test="${parentPicture.is_delete==1 }">
	            <input type="radio" name="is_delete" value="1" checked="checked"/> 启用
	            <input type="radio" name="is_delete" value="0"/> 禁用
            </c:if>
            
            <c:if test="${parentPicture.is_delete!=1 }">
	            <input type="radio" name="is_delete" value="1" /> 启用
	            <input type="radio" name="is_delete" value="0" checked="checked"/> 禁用
            </c:if>
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