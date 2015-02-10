$(document).ready(function(){
	$("#menuone").on("change",function(){
		$.ajax({
			dataType:"json",
			data:{parentId:$(this).val()},
			type:"POST",
			url:"background/getCatalogInfo.action",
			success:function(data){
				var list = data.list;
				$("#tbody").html("");
				for(var i = 0;i<list.length;i++){
					$("<tr><td>"+list[i].parent_picture_name+"</td><td>"+list[i].catalog_id+"</td><td>"+list[i].picture_url+"</td><td>"+list[i].is_delete+"</td><td><a href='background/menu/pictureEdit.jsp?id="+list[i].id+"'>编辑</a></td></tr>").appendTo($("#tbody"));
				}
			}
		});
	});
});