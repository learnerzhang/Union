<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String pre = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大学工会后台系统</title>
<link rel="stylesheet" type="text/css" href="<%=pre %>/resources/style/public.css" />
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/public.js"></script>
<style type="text/css">
.head .headR .p1 a {
	font-size: 16px;
	padding-top: 12px;
	display: inline-block;
	color: rgb(249, 210, 167);
	cursor: pointer;
}
</style>
<script type="text/javascript">

$(function(){
	$(".goOut").click(function(){
		$.ajax({
			contentType : "application/json;charset=utf-8",
			type : "get",
			url : "<%=request.getContextPath()%>/sys/logout",//
			datatype : "json",
			async : false,
			success : function(result) {
				if (result.hasOwnProperty("code")) {
					if (result.code=="0") {
						window.parent.location.reload();//用于刷新整个窗口
					}else if (result.code=="-1") {
						alert("网络异常,请稍后再试!");
					}
				}
			}
		});
	});
});
</script>
</head>
<body>
	<!-- 头部 -->
	<div class="head">
		<div class="headL" align="left">
			<img class="headLogo" src="<%=pre %>/resources/img/headLogo.png"/>
		</div>
		<div class="headR">
			<p class="p1">
				欢迎，${admin.username }&nbsp;&nbsp;<a class="goOut" onclick="{if(confirm('&quot;确定退出吗&quot;')){return true;}return false;}">退出</a>
			</p>
			<!-- <p class="p2">
				<a href="#" class="resetPWD">重置密码</a>&nbsp;&nbsp;<a href="{:U('Admin/Index/exit')}" class="goOut">退出</a>
			</p> -->
		</div>
		<!-- onclick="{if(confirm(&quot;确定退出吗&quot;)){return true;}return false;}" -->
	</div>
	<!-- <div class="closeOut">
		<div class="coDiv">
			<p class="p1">
				<span>X</span>
			</p>
			<p class="p2">确定退出当前用户？</p>
			<P class="p3">
				<a class="ok yes" href="#">确定</a><a class="ok no" href="#">取消</a>
			</p>
		</div>
	</div> -->
</body>
</html>