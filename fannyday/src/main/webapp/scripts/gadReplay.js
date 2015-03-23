$(document).ready(function(){
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
	$(".upDown").on("click",function(){
		var upDownNode = $(this);
		// 并且加载数据
		var catalogId = $("#catalogId").val();
		var currentPage = $("#currentPage").val();
		if(typeof(currentPage)=='undefined'){
			currentPage = 1;
		}
		var ulNode = upDownNode.parent("div").next().find("ul");
		ulNode.html("");
		var resourceId = upDownNode.prevAll("input").val();
		if(resourceId!=null){
			submitAjax(ulNode,resourceId,currentPage,catalogId);
		}
		upDownNode.parent("div").next().show();
	});
	
	function submitAjax(ulNode,resourceId,currentPage,catalogId){
		$.ajax({
			url:"getCommon.html",
			type:"post",
			dataType:"json",
			data:{catalogId:catalogId,resourceId:resourceId,currentPage:currentPage},
			success:function(data){
				if(data!=null){
					var commonList = data.list;
					for(var i = 0;i<commonList.length;i++){
						ulNode.prepend($("<li><img src='images/user.png'><div><span class='name gray'>"+commonList[i].address+"的网友:</span> <span class='says black'>"+commonList[i].content+"</span><span class='time gray'>"+new Date(commonList[i].modify_time).Format("yyyy-MM-dd hh:mm:ss ") +"<em class='treadDown'> <i class='tread'></i>("+commonList[i].down_count+") </em> <em class='favourTop'> <i class='favour'></i>("+commonList[i].top_count+") </em> </span> </div></li>"));
					}
					ulNode.parent("div").next("div").find("input").val(data.pageNumber+1);
					if(data.haveNextPage){
						ulNode.parent("div").next("div").find(".allp").show();
					}else{
						ulNode.parent("div").next("div").find(".allp").html("没有下一页了");
					}
				}
			}
		});
	}
	
	$(".allp").on("click",function(){
		var catalogId = $("#catalogId").val();
		var currentPage = $(this).next("input").val();
		var resourceId = $(this).next("input").attr("alt");
		var ulNode = $(this).prev("div").find("ul");
		submitAjax(ulNode,resourceId,currentPage,catalogId);
	});
	
	$(".bobtn").on("click",function(){
		$(this).parent("div").parent("div").hide(1000);
	});
	$(".btn01").on("click",function(){
		var btnNode = $(this);
		var dt = btnNode.parent("dd").next("dt").find("span");
		if(!btnNode.hasClass('Onclick')){
			//样式不存在
			btnNode.addClass('Onclick')
			var resourceId = btnNode.parent("dd").prevAll("input").val();
			var catalogId = $("#catalogId").val();
			var content = btnNode.prev().val();
			var ipaddress = $("#ipaddress").val();
			var ip = $("#ip").val();
			var userName = $("#userName").val();
			if(content!=null && content!=""){
				if(content.length<200){
					$.ajax({
						url:"saveCommontGad.html",
						data:{resourceId:resourceId,catalogId:catalogId,content:content,ipaddress:ipaddress,ip:ip,userName:userName},
						dataType:"json",
						type:"post",
						success:function(data){
							if(data!="0"){
								btnNode.parent("dd").parent("div").next().show(1000);
								btnNode.parent("dd").parent("div").next().find("ul").prepend($("<li><img src='images/user.png'><div><span class='name gray'>"+ipaddress+"的网友:</span> <span class='says black'>"+content+"</span><span class='time gray'>"+new Date().Format("yyyy-MM-dd hh:mm:ss ") +"<em class='treadDown'> <i class='tread'></i>(0) </em> <em class='favourTop'> <i class='favour'></i>(0) </em> </span> </div></li>"));
								dt.show();
								dt.html("操作成功");
								setTimeout(function(){btnNode.removeClass('Onclick')},5000);
							}
						}
					});
				}else{
					dt.show();
					dt.html("不能输入超过200字");
				}
			}else{
				dt.show();
				dt.html("评论不能为空唷。");
			}
		}else{
			dt.show();
			dt.html("不能点快咯！！");
		}
	});
	
});