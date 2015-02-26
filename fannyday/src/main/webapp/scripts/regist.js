/*this is login and regist js check*/
$(document).ready(function(){
	var error_message_node = $("#error_message");
	var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;  
	var hasEmail = false;
	function checkEmail(checkEmail){
		$.ajax({
			url : "checkEmail",
			type : "get",
			cache : false,
			dataType : 'text',
			data : {
				sendTime : (new Date()).getTime(),
				email : checkEmail
			},
			success : function(data){
				if(data=="1"){
					error_message_node.html("对不起，您输入的邮箱已经被注册！！");
				}
				if(data=="0"){
					error_message_node.html("");
					hasEmail = true;
				}
			}
		});
	}
	
	$("#regist_email").on("blur",function(){
		if($(this).val()==null || $(this).val()=="" || $(this).val().length <6){
			error_message_node.html("对不起，您输入的邮箱不正确");
		}
		
		if(!pattern.test($(this).val())){
			error_message_node.html("对不起，您输入的邮箱不正确");
		}
		checkEmail($(this).val());
		
	});
	$("#login_email").on("blur",function(){
		if($(this).val()==null || $(this).val()=="" || $(this).val().length <6){
			error_message_node.html("对不起，您输入的邮箱不正确");
		}
		
		if(!pattern.test($(this).val())){
			error_message_node.html("对不起，您输入的邮箱不正确");
		}
	});
	
	$("#login_password").on("blur",function(){
		if($(this).val()==null || $(this).val()=="" || $(this).val().length<6){
			error_message_node.html("对不起，您输入的密码位数不能少于6位");
		}
		
	});
	
	$("#username").on("blur",function(){
		if($(this).val()==null || $(this).val()=="" || $(this).val().length<2){
			error_message_node.html("对不起，您输入的昵称位数不能少于2位");
		}
	});
	
	$("#randomCode").on("blur",function(){
		if($(this).val()==null || $(this).val()=="" || $(this).val().length!=4){
			error_message_node.html("对不起，您输入的验证码错误");
		}
	});
	
	$("#regist_submit").on("click",function(e){
		var email = $("#regist_email");
		var password = $("#login_password");
		var randomCode = $("#randomCode");
		var userName = $("#username");
		var chk_password=$("#chk_password");
		if(!pattern.test(email.val())){
			error_message_node.html("对不起，您输入的邮箱不正确");
			email.focus();
			e.preventDefault();
			return false;
		}
		
		if(email.val() == null || email.val()=="" || email.val().length < 6){
			error_message_node.html("对不起，您输入的邮箱不正确");
			email.focus();
			e.preventDefault();
			return false;
		}
		
		if(pattern.test(email.val())){
			checkEmail(email.val());
			if(!hasEmail){
				e.preventDefault();
				return false;
			}
		}
		
		if(userName.val() == null || userName.val()=="" || userName.val().length<2){
			error_message_node.html("对不起，您输入的昵称位数不能少于2位");
			userName.focus();
			e.preventDefault();
			return false;
		}
		
		if(password.val() == null || password.val()=="" || password.val().length<6){
			error_message_node.html("对不起，您输入的密码位数不能少于6位");
			password.focus();
			e.preventDefault();
			return false;
		}
		
		if(chk_password.val() == null || chk_password.val()=="" || chk_password.val().length<6){
			error_message_node.html("对不起，您输入的确认密码位数不能少于6位");
			chk_password.focus();
			e.preventDefault();
			return false;
		}
		
		if(chk_password.val() != password.val()){
			error_message_node.html("对不起，您输入的确认密码和原密码不同");
			chk_password.focus();
			e.preventDefault();
			return false;
		}
		
		if(randomCode.val()==null || randomCode.val()=="" || randomCode.val().length!=4){
			error_message_node.html("对不起，您输入的验证码错误");
			randomCode.focus();
			e.preventDefault();
			return false;
		}
		
		
		
		
		
		
		
	});
	
	$("#login_submit").on("click",function(e){
		var email = $("#login_email");
		var password = $("#login_password");
		var randomCode = $("#randomCode");
		if(!pattern.test(email.val())){
			error_message_node.html("对不起，您输入的邮箱不正确");
			email.focus();
			e.preventDefault();
			return false;
		}
		
		if(email.val() == null || email.val()=="" || email.val().length < 6){
			error_message_node.html("对不起，您输入的邮箱不正确");
			email.focus();
			e.preventDefault();
			return false;
		}
		
		if(password.val() == null || password.val()=="" || password.val().length<6){
			error_message_node.html("对不起，您输入的密码位数不能少于6位");
			password.focus();
			e.preventDefault();
			return false;
		}
		
		if(randomCode.val()==null || randomCode.val()=="" || randomCode.val().length!=4){
			error_message_node.html("对不起，您输入的验证码错误");
			randomCode.focus();
			e.preventDefault();
			return false;
		}
	});
});