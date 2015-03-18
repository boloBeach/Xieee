$(document).ready(function(){
	$(".upDown").on("click",function(){
		$(this).parent("div").next().css("display","block");
	});
	$(".bobtn").on("click",function(){
		$(this).parent("div").parent("div").css("display","none");
	});
});