<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String pre = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码-大学工会</title>
<link rel="stylesheet" type="text/css" href="<%=pre %>/resources/style/css.css" />
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/md5.js"></script>
<script type="text/javascript">

var f1 = false;
var f2 = false;
var f3 = false;
function checkpwd1(){
	var md5 = new MD5();
	var user = document.getElementById('pwd1').value.trim();
	if (md5.MD5(user)=="${admin.password }") {
		  $("#pwd1").parent().find(".imga").show();
		  $("#pwd1").parent().find(".imgb").hide();
		  $("#pwd1").css("border-color","#ccc");
		  f1 = true;
	}else{
		  $("#pwd1").parent().find(".imgb").show();
		  $("#pwd1").parent().find(".imga").hide();
		  f1 = false;
	};
}
function checkpwd2(){
	var user = document.getElementById('pwd2').value.trim();
	if (user.length >= 4 && user.length <= 12) {
		$("#pwd2").parent().find(".imga").show();
		$("#pwd2").parent().find(".imgb").hide();
		$("#pwd2").css("border-color","#ccc");
		f2 = true;
	}else{
		$("#pwd2").parent().find(".imgb").show();
		$("#pwd2").parent().find(".imga").hide();
		f2 = false;
	};
}
function checkpwd3(){
	var user = document.getElementById('pwd3').value.trim();
	var pwd = document.getElementById('pwd2').value.trim();
	if (user.length >= 4 && user.length <= 12 && user == pwd) {
	  	$("#pwd3").parent().find(".imga").show();
	  	$("#pwd3").parent().find(".imgb").hide();
	  	$("#pwd3").css("border-color","#ccc");
	  	f3 = true;
	}else{
	   	$("#pwd3").parent().find(".imgb").show();
	  	$("#pwd3").parent().find(".imga").hide();
	  	f3 = false;
	};
}
$(function(){
	$(".btn_yes").click(function(){
		
		$("#pwd1").css("border-color","#ccc");
		$("#pwd2").css("border-color","#ccc");
		$("#pwd3").css("border-color","#ccc");
		var flag = true;
		if(!f1){
			$("#pwd1").css("border-color","red");flag = false;
		}
		if(!f2){
			$("#pwd2").css("border-color","red");flag = false;
		}
		if(!f3){
			$("#pwd3").css("border-color","red");flag = false;
		}
		if (!flag) {
			return;
		}
		var md5 = new MD5();
		var paratmeter = {
				"id" : "${admin.id }",
				"password" : md5.MD5($("#pwd2").val())
			};
		$.ajax({
			contentType: "application/json;charset=utf-8",
			url : "<%=request.getContextPath()%>/sys/index/updateAdminPwd",
			type : "post",
			data : JSON.stringify(paratmeter),
			dataType : "json",
			success : function(data) {
				if (data.hasOwnProperty("code")) {
					if (data.code == "0") {
						window.parent.location.reload();//登录成功.跳转首页...
					} else if (data.code == "1") {
						alert("网络异常,请稍后再试....");
					} 
				}
			}
		});	
	});
});
</script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="<%=pre %>/resources/img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp;-</span>&nbsp;修改密码
			</div>
		</div>
		<div class="page ">
			<!-- 修改密码页面样式 -->
			<div class="bacen">
				<div class="bbD">
					&nbsp;&nbsp;&nbsp;&nbsp;管理员UID：&nbsp;&nbsp;&nbsp;&nbsp;${admin.id }</div>
				<div class="bbD">管理员用户名：&nbsp;&nbsp;&nbsp;&nbsp;${admin.username }</div>
				<div class="bbD">
					&nbsp;&nbsp;&nbsp;&nbsp;输入旧密码：<input type="password" class="input3"
						onblur="checkpwd1()" id="pwd1" /> <img class="imga"
						src="<%=pre %>/resources/img/ok.png" /><img class="imgb" src="<%=pre %>/resources/img/no.png" />
				</div>
				<div class="bbD">
					&nbsp;&nbsp;&nbsp;&nbsp;输入新密码：<input type="password" class="input3"
						onblur="checkpwd2()" id="pwd2" /> <img class="imga"
						src="<%=pre %>/resources/img/ok.png" /><img class="imgb" src="<%=pre %>/resources/img/no.png" />
				</div>
				<div class="bbD">
					再次确认密码：<input type="password" class="input3" onblur="checkpwd3()"
						id="pwd3" /> <img class="imga" src="<%=pre %>/resources/img/ok.png" /><img class="imgb" src="<%=pre %>/resources/img/no.png" />
				</div>
				<div class="bbD">
					<p class="bbDP">
						<button class="btn_ok btn_yes" href="#">提交</button>
						<a class="btn_ok btn_no" href="<%=request.getContextPath() %>/sys/index/main">取消</a>
					</p>
				</div>
			</div>
			<!-- 修改密码页面样式end -->
		</div>
	</div>
</body>
</html>