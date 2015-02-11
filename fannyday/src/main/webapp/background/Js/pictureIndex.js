$(document).ready(function(){
	$("#menuOne").on("change",function(){
		$.ajax({
			dataType:"json",
			data:{parentId:$(this).val()},
			type:"POST",
			url:"getCatalogInfo.action",
			success:function(data){
				var list = data.list;
				var menuTwo = $("#menuTwo");
				menuTwo.html("");
				for(var i = 0;i<list.length;i++){
					$("<option value='"+list[i].id+"'>"+list[i].parent_picture_name+"</option>").appendTo(menuTwo);
				}
			}
		});
	});
});