<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String pre = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大学工会系统——后台管理</title>
<link rel="stylesheet" type="text/css" href="<%=pre %>/resources/style/public.css" />
<link rel="stylesheet" type="text/css" href="<%=pre %>/resources/style/page.css" />
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/public.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/md5.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript">
	$(function(){
		$("#login").click(function(){
			
			$("#username").css("border-color","");
			$("#password").css("border-color","");
			$("#vcode").css("border-color","");
			
			var flag = true;
			if ($("#username").val()==""||$("#username").val().trim()=="") {
				$("#username").css("border-color","red").focus();
				flag = false;
			}
			if ($("#password").val()==""||$("#password").val().trim()=="") {
				$("#password").css("border-color","red").focus();
				flag = false;
			}
			if ($("#vcode").val()==""||$("#vcode").val().trim()=="") {
				$("#vcode").css("border-color","red").focus();
				flag = false;
			}
			
			if(!flag)
				return;
			
			var md5 = new MD5();
			var paratmeter = {
					"username" : $("#username").val(),
					"password" : md5.MD5($("#password").val()),
					"vcode" : $("#vcode").val()
				};
			$.ajax({
				contentType : "application/json",
				url : "<%=request.getContextPath()%>/sys/verify",
				type : "post",
				data : JSON.stringify(paratmeter),
				dataType : "json",
				success : function(data) {
					if (data.hasOwnProperty("code")) {
						if (data.code == 0) {
							window.location.href = "<%=request.getContextPath() %>/sys/index";//登录成功.跳转首页...
						} else if (data.code == 1) {
							$("#vcode").css("border-color","red");
						} else if (data.code == 2) {
							$("#username").css("border-color","red");
							$("#password").css("border-color","red");
						}
					}
				}
			});		
		});
	});
	function reloadVcode() {
		var img = $("#vcode_image");
		var src = img.attr("src");
		var timestamp = (new Date()).valueOf();
		//时间戳   
		//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳   
		if (src.indexOf("?") != -1) {
			src = src.substring(0, src.indexOf("?timestamp"));
		}
		src = src + "?timestamp=" + timestamp;
		img.attr("src", src);
	}
</script>
</head>
<body>
	<!-- 登录页面头部 -->
	<div class="logHead">
		<img src="<%=pre %>/resources/img/logLOGO.png" />
	</div>
	<!-- 登录页面头部结束 -->

	<!-- 登录body -->
	<div class="logDiv">
		<img class="logBanner" src="<%=pre %>/resources/img/logBanner.png" />
		<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1">登录</p>
				<p class="p2">系统管理员</p>
			</div>
			<!-- 输入框 -->
			<div class="lgD">
				<img class="img1" src="<%=pre %>/resources/img/logName.png" /><input id="username" name="username" type="text" placeholder="输入用户名" />
			</div>
			<div class="lgD">
				<img class="img1" src="<%=pre %>/resources/img/logPwd.png" /><input id="password" name="password" type="password" placeholder="输入用户密码" />
			</div>
			<div class="lgD logD2">
				<input class="getYZM" type="text" name="vcode" id="vcode"/>
				<div class="logYZM">
					<img  onclick="reloadVcode()" id="vcode_image" class="yzm" src="<%=request.getContextPath()%>/vcode" />
				</div>
			</div>
			<div class="logC">
				<button id="login">登 录</button>
			</div>
		</div>
	</div>
	<!-- 登录body  end -->

	<!-- 登录页面底部 -->
	<div class="logFoot">
		<p class="p1">版权所有：xx大学工会系统</p>
		<!-- <p class="p2">南京设易网络科技有限公司 登记序号：苏ICP备11003578号-2</p> -->
	</div>
	<!-- 登录页面底部end -->
</body>
</html>