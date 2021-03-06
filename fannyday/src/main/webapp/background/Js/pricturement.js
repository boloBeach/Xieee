$(document).ready(function(){
	function getData(menu,currentPages){
		$.ajax({
			dataType:"json",
			data:{parentId:menu,currentPage:currentPages},
			type:"POST",
			url:"background/getCatalogInfo.action",
			success:function(data){
				var list = data.list;
				var currentPage = data.pageNumber;
				var pageCount = data.pageCount;
				$("#tbody").html("");
				if(!data.haveNextPage){
					$(".nextPage").attr("href","javascript:void(0)");
				}
				if(!data.havePrePage){
					$(".prePage").attr("href","javascript:void(0)");
				}
				var pages = $(".pagers");
				pages.html("");
				var pageTemp = pageCount-currentPage;
				var currentTemp = currentPage-1;
				
				if(data.havePrePage){
					$("<button class='btn btn-info' onclick='button(this)' currentPage="+(currentPage-1)+" parentId="+menu+">上一页</button> ").on("click",function(){button(this);}).appendTo(pages);
				}
				
				if(currentTemp>5){
					$("<button class='btn btn-info' onclick='button(this)' currentPage=1 parentId="+menu+" >1</button> ").on("click",function(){button(this);}).appendTo(pages);
					$("<span>...</span>").appendTo(pages);
				}
				
				if(currentTemp>=4){
					for(var i = 4;i>0;i--){
						$("<button class='btn btn-info' onclick='button(this)' currentPage="+(currentPage-i)+" parentId="+menu+">"+(currentPage-i)+"</button> ").on("click",function(){button(this);}).appendTo(pages);
					}
				}
				
				if(currentTemp<4){
					for(var i = currentTemp ;i>0;i--){
						$("<button class='btn btn-info' onclick='button(this)' currentPage="+(currentPage-i)+" parentId="+menu+" >"+(currentPage-i)+"</button> ").on("click",function(){button(this);}).appendTo(pages);
					}
				}
				$("<button currentPage="+currentPage+" onclick='button(this)' parentId="+menu+"  class='btn btn-warning'>"+currentPage+"</button> ").on("click",function(){button(this);}).appendTo(pages);
				// 如果pageCount-currentPage的時候，那么就显示后五条
				if(pageTemp>4){
					for(var i = 1 ;i<=4;i++){
						$("<button class='btn btn-info' onclick='button(this)' currentPage="+(currentPage+i)+" parentId="+menu+" >"+(currentPage+i)+"</button> ").on("click",function(){button(this);}).appendTo(pages);
					}
					$("<span>...</span>").appendTo(pages);
					$("<button class='btn btn-info' onclick='button(this)' currentPage="+pageCount+" parentId="+menu+" >"+pageCount+"</button> ").on("click",function(){button(this);}).appendTo(pages);
				}
				
				if(pageTemp<4){
					for(var i = 1 ;i<=pageTemp;i++){
						$("<button class='btn btn-info' onclick='button(this)' currentPage="+(currentPage+i)+" parentId="+menu+" >"+(currentPage+i)+"</button> ").on("click",function(){button(this);}).appendTo(pages);
					}
				}
				if(data.haveNextPage){
					$("<button class='btn btn-info'  currentPage="+(currentPage+1)+" parentId="+menu+" >下一页</button> ").on("click",function(){button(this);}).appendTo(pages);
				}
				
				for(var i = 0;i<list.length;i++){
					$("<tr><td>"+list[i].parent_picture_name+"</td><td>"+list[i].catalog_id+"</td><td>"+list[i].picture_url+"</td><td>"+list[i].is_delete+"</td><td><a href='background/editPicture.action?id="+list[i].id+"'>编辑</a></td></tr>").appendTo($("#tbody"));
				}
			}
		});
	}
	
	$("#menuone").on("change",function(){
		var menu = $(this).val();
		getData(menu,1);
	});
	
	function button(obj){
		var currentPages = $(obj).attr("currentPage");
		var parentId = $(obj).attr("parentId");
		getData(parentId,currentPages);
	}
	
});