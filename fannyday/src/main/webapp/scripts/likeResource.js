$(document).ready(function(){
	
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
	function oldresource(node,ipAddress,spanCount,type,cartoonId){
		var spanCount = parseInt(spanCount);
		// 首先获取cookie
		var cookieCartoonId = getCookie(cartoonId+type);
		if(cookieCartoonId == null || cookieCartoonId == "" || cookieCartoonId!=cartoonId){
			setCookie(cartoonId+type,cartoonId,24);
			if(!isNaN(spanCount)){
				$.ajax({
					url:"likeResource.html",
					type:"post",
					data:{spanCount:spanCount,type:type,urlId:cartoonId},
					dataType:"text",
					success:function(data){
						if(data!=null){
							node.children("span").html(spanCount+1);
							alert("顶成功");
						}
					}
				});
			}
		}else{
			alert("对不起，您今天已经顶过了");
		}
	}
	$(".good").on("click",function(){
		var ipAddress = $("#keleyivisitorip").html();
		var cartoonId = $(".cartoon_id").val();
		var span = $(this).children("span").html();
		oldresource($(this),ipAddress,span,"good",cartoonId);
	});
	
	$(".bad").on("click",function(){
		var ipAddress = $("#keleyivisitorip").html();
		var cartoonId = $(".cartoon_id").val();
		var span = $(this).children("span").html();
		oldresource($(this),ipAddress,span,"bad",cartoonId);
	});
	
	$(".old").on("click",function(){
		var ipAddress = $("#keleyivisitorip").html();
		var cartoonId = $(".cartoon_id").val();
		var span = $(this).children("span").html();
		oldresource($(this),ipAddress,span,"old",cartoonId);
	});
});