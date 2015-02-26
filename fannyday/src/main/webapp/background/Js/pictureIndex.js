$(document).ready(function(){
	$("#all").click(function(){  
	  $("input[name='pictureIds']").each(function(){
	   $(this).attr("checked",true);
	  });  
	});
		
	 $("#delAll").click(function(){  
		  $("input[name='pictureIds']").each(function(){
		   $(this).attr("checked",false);
		  });  
	 	});
	 $("#antiAll").click(function(){
		  $("input[name='pictureIds']").each(function(){
		   $(this).attr("checked",!this.checked);              
	});
	});
	$("#menuOne").on("change",function(){
		$.ajax({
			dataType:"json",
			data:{parentId:$(this).val()},
			type:"POST",
			url:"catalogByParentPicture.action",
			success:function(data){
				var list = data;
				var menuTwo = $("#menuTwo");
				menuTwo.html("");
				for(var i = 0;i<list.length;i++){
					$("<option value='"+list[i].id+"'>"+list[i].parent_picture_name+"</option>").appendTo(menuTwo);
				}
			}
		});
	});
});