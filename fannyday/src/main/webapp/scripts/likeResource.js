$(document).ready(function(){
	// 对Date的扩展，将 Date 转化为指定格式的String 
	// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
	// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
	// 例子： 
	// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
	// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
	Date.prototype.Format = function(fmt) 
	{ //author: meizz 
	  var o = { 
	    "M+" : this.getMonth()+1,                 //月份 
	    "d+" : this.getDate(),                    //日 
	    "h+" : this.getHours(),                   //小时 
	    "m+" : this.getMinutes(),                 //分 
	    "s+" : this.getSeconds(),                 //秒 
	    "q+" : Math.floor((this.getMonth()+3)/3), //季度 
	    "S"  : this.getMilliseconds()             //毫秒 
	  }; 
	  if(/(y+)/.test(fmt)) 
	    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	  for(var k in o) 
	    if(new RegExp("("+ k +")").test(fmt)) 
	  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
	  return fmt; 
	}
	
	$("#submitCommont").on("click",function(){
		var content = $("#comment").val();
		var checkCode = $("#checkCode").val();
		var catalogId = $("#catalogId").val();
		var cartoonId = $(".cartoon_id").val();
		var ip = $("#ip").val();
		var errorMessage = $("#error-message");
		var ipaddress = $("#ipaddress").val();
		var userName=$("#userName").val();
		// check content and checkCode
		if(content==null || content==""){
			$("#comment").focus();
			errorMessage.html("您输入的内容为空");
			return false;
		}
		if(checkCode==null || checkCode=="" || checkCode.length!=4){
			$("#checkCode").focus();
			errorMessage.html("对不起，您输入的验证码错误!");
			return false;
		}
		// ajax提交
		$.ajax({
			url:"saveCommont.html",
			type:"POST",
			datatype:"text",
			data:{ip:ip,catalogId:catalogId,cartoonId:cartoonId,checkCode:checkCode,ipaddress:ipaddress,content:content,userName:userName},
			success:function(data){
				if(data=="-2"){
					$("#checkCode").focus();
					errorMessage.html("对不起，您输入的验证码错误,请重新输入!");
				}
				if(data>"0"){
					$(".common").prepend($("<li><img src='images/user.png'><div><span class='name gray'>"+ipaddress+"的网友:</span> <span class='says black'>"+content+"</span><span class='time gray'>"+new Date().Format("yyyy-MM-dd hh:mm:ss ") +"<em> <i class='tread'></i>(0) </em> <em> <i class='favour'></i>(0) </em> </span> </div></li>"));
				}
			}
		});
	});
	
	
	// 采用cookie来进行设置每天只能点击一次
	/**
	 * 设置cookie
	 * cookieName 是cookie的名字
	 * value 是cookie的值
	 * expireHours cookie 存在的时间
	 */
	function setCookie(cookieName,value,expireHours){
		var exdate = new Date();
		exdate.setHours(exdate.getHours()+expireHours)
		document.cookie=cookieName+ "=" + escape(value) + ((expireHours==null) ? "" : ";expires="+exdate.toGMTString());
	}
	
	/**
	 * 通过cookie的名字来获取cookie信息
	 */
	function getCookie(c_name){
		if (document.cookie.length>0){//先查询cookie是否为空，为空就return ""
			c_start=document.cookie.indexOf(c_name + "=")//通过String对象的indexOf()来检查这个cookie是否存在，不存在就为 -1　　
			if (c_start!=-1){ 
				c_start=c_start + c_name.length+1//最后这个+1其实就是表示"="号啦，这样就获取到了cookie值的开始位置
				c_end=document.cookie.indexOf(";",c_start)//其实我刚看见indexOf()第二个参数的时候猛然有点晕，后来想起来表示指定的开始索引的位置...这句是为了得到值的结束位置。因为需要考虑是否是最后一项，所以通过";"号是否存在来判断
				if (c_end==-1) c_end=document.cookie.length
					return unescape(document.cookie.substring(c_start,c_end))//通过substring()得到了值。想了解unescape()得先知道escape()是做什么的，都是很重要的基础，想了解的可以搜索下，在文章结尾处也会进行讲解cookie编码细节
			} 
		}
		return "";
	}
	function oldresource(node,virgin,ipAddress,spanCount,type,cartoonId,url){
		var spanCount = parseInt(spanCount);
		// 首先获取cookie
		var cookieCartoonId = getCookie(cartoonId+type);
		if(cookieCartoonId == null || cookieCartoonId == "" || cookieCartoonId!=cartoonId){
			setCookie(cartoonId+type,cartoonId,24);
			if(!isNaN(spanCount)){
				$.ajax({
					url:url,
					type:"post",
					data:{spanCount:spanCount,type:type,urlId:cartoonId},
					dataType:"text",
					success:function(data){
						if(data!=null){
							node.children("span").html(spanCount+1);
							node.parent().children("span:last").show();
							node.parent().children("span:last").text("操作成功");
						}
					}
				});
			}
		}else{
			node.parent().children("span:last").text("对不起，您今天已经顶过了");
		}
	}
	
	
	$(".goodVirgin").on("click",function(){
		var ipAddress = $("#ipaddress").val();
		var cartoonId = $(".cartoon_id").val();
		if(typeof(cartoonId)=="undefined"){
			cartoonId = $(this).nextAll("input").val();
		}
		var span = $(this).children("span").html();
		oldresource($(this),"virgin",ipAddress,span,"good",cartoonId,"likePicture.html");
	});
	
	$(".badVirgin").on("click",function(){
		var ipAddress = $("#ipaddress").val();
		var cartoonId = $(".cartoon_id").val();
		if(typeof(cartoonId)=="undefined"){
			cartoonId = $(this).nextAll("input").val();
		}
		var span = $(this).children("span").html();
		oldresource($(this),"virgin",ipAddress,span,"bad",cartoonId,"likePicture.html");
	});
	
	$(".oldVirgin").on("click",function(){
		var ipAddress = $("#ipaddress").val();
		var cartoonId = $(".cartoon_id").val();
		if(typeof(cartoonId)=="undefined"){
			cartoonId = $(this).nextAll("input").val();
		}
		var span = $(this).children("span").html();
		oldresource($(this),"virgin",ipAddress,span,"old",cartoonId,"likePicture.html");
	});
	
	
	$(".good").on("click",function(){
		var ipAddress = $("#ipaddress").val();
		var cartoonId = $(".cartoon_id").val();
		var span = $(this).children("span").html();
		oldresource($(this),"no",ipAddress,span,"good",cartoonId,"likeResource.html");
	});
	
	$(".bad").on("click",function(){
		var ipAddress = $("#ipaddress").val();
		var cartoonId = $(".cartoon_id").val();
		var span = $(this).children("span").html();
		oldresource($(this),"no",ipAddress,span,"bad",cartoonId,"likeResource.html");
	});
	
	$(".old").on("click",function(){
		var ipAddress = $("#ipaddress").val();
		var cartoonId = $(".cartoon_id").val();
		var span = $(this).children("span").html();
		oldresource($(this),"no",ipAddress,span,"old",cartoonId,"likeResource.html");
	});
	
	function replace(obj){
		if(obj==null || obj==""){
			return 0;
		}else{
			return parseInt(obj.replace("(","").replace(")",""));
		}
	}
	
	/**
	 * 把提交的ajax写入一个方法
	 * @param catalogId是菜单的id
	 * @param cartoonId是内容的id
	 * @param spanCount表示点赞的次数
	 * @param type 表示类型,theadDown是不喜欢，favourTop 表示喜欢
	 */
	function submitCommonTop(node,id,spanCount,type){
		var cookieCartoonId = getCookie(id+type);
		if(cookieCartoonId == null || cookieCartoonId == "" || cookieCartoonId!=id){
			setCookie(id+type,id,24);
			if(!isNaN(spanCount)){
				$.ajax({
					url:"commonTop.html",
					type:"post",
					data:{type:type,commonId:id},
					dataType:"text",
					success:function(data){
						if(data!=null){
							var count = spanCount+1;
							if(type=="treadDown"){
								node.html("<i class='tread'></i>("+count+")");
							}else{
								node.html("<i class='favour'></i>("+count+")");
							}
							alert("顶成功");
						}
					}
				});
			}
		}else{
			alert("对不起，您今天已经顶过了");
		}
	}
	
	$(".treadDown").on("click",function(){
		var id = $(this).nextAll("input").eq(0).val();
		var catalogId = $("#catalogId").val();
		var spanCount = replace($(this).text());
		submitCommonTop($(this),id,spanCount,"treadDown");
	});
	
	$(".favourTop").on("click",function(){
		var id = $(this).nextAll("input").eq(0).val();
		var spanCount = replace($(this).text());
		submitCommonTop($(this),id,spanCount,"favourTop");
	});
});