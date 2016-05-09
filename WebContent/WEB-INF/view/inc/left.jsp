<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String pre = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页左侧导航</title>
<link rel="stylesheet" type="text/css" href="<%=pre %>/resources/style/public.css" />
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/public.js"></script>
<script type="text/javascript">

$(function(){
	$("#quit").click(function(){
		$.ajax({
			contentType: "application/json;charset=utf-8",
			url : "<%=request.getContextPath()%>/sys/logout",
			type : "post",
			dataType : "json",
			success : function(data) {
				if (data.hasOwnProperty("code")) {
					if (data.code == "0") {
						window.parent.location.reload();
					} else if (data.code == "1") {
						alert("网络异常,请稍后再试....");
					} 
				}
			}
		});	
	});
})
</script>
</head>
<body id="bg">
	<!-- 左边节点 -->
	<div class="container">
		<div class="leftsidebar_box">
			<a href="<%=request.getContextPath() %>/sys/index/main" target="main">
			<div class="line">
					<img src="<%=pre %>/resources/img/coin01.png" />&nbsp;&nbsp;首页
			</div></a>
			<!-- <dl class="system_log">
			<dt><img class="icon1" src="../img/coin01.png" /><img class="icon2"src="../img/coin02.png" />
				首页<img class="icon3" src="../img/coin19.png" /><img class="icon4" src="../img/coin20.png" /></dt>
		</dl> -->
			<dl class="system_log">
				<dt>
					<img class="icon1" src="<%=pre %>/resources/img/coin03.png" />
					<img class="icon2" src="<%=pre %>/resources/img/coin04.png" /> 网站管理
					<img class="icon3" src="<%=pre %>/resources/img/coin19.png" />
					<img class="icon4" src="<%=pre %>/resources/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="<%=pre %>/resources/img/coin111.png" /><img class="coin22"
						src="<%=pre %>/resources/img/coin222.png" />
						<a class="cks" href="<%=request.getContextPath() %>/sys/index/admin?page=1" target="main">管理员管理</a><img class="icon5" src="<%=pre %>/resources/img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="<%=pre %>/resources/img/coin05.png" /><img class="icon2"
						src="<%=pre %>/resources/img/coin06.png" /> 公共管理<img class="icon3"
						src="<%=pre %>/resources/img/coin19.png" /><img class="icon4"
						src="<%=pre %>/resources/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="<%=pre %>/resources/img/coin111.png" /><img class="coin22"
						src="<%=pre %>/resources/img/coin222.png" /><a class="cks" href="<%=request.getContextPath() %>/sys/index/banner?page=1"
						target="main">学院管理</a><img class="icon5" src="<%=pre %>/resources/img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="<%=pre %>/resources/img/coin111.png" />
					<img class="coin22" src="<%=pre %>/resources/img/coin222.png" />
					<a class="cks" href="<%=request.getContextPath() %>/sys/index/msg?page=1" target="main">公告管理</a>
					<img class="icon5" src="<%=pre %>/resources/img/coin21.png" />
				</dd>
				<!-- <dd>
					<img class="coin11" src="../img/coin111.png" /><img class="coin22"
						src="../img/coin222.png" /><a class="cks" href="../opinion.html"
						target="main">意见管理</a><img class="icon5" src="../img/coin21.png" />
				</dd> -->
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="<%=pre %>/resources/img/coin07.png" /><img class="icon2"
						src="<%=pre %>/resources/img/coin08.png" /> 会员管理<img class="icon3"
						src="<%=pre %>/resources/img/coin19.png" /><img class="icon4"
						src="<%=pre %>/resources/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="<%=pre %>/resources/img/coin111.png" /><img class="coin22"
						src="<%=pre %>/resources/img/coin222.png" /><a href="<%=request.getContextPath() %>/sys/index/vip?page=1" target="main"
						class="cks">会员管理</a><img class="icon5" src="<%=pre %>/resources/img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="<%=pre %>/resources/img/coin11.png" /><img class="icon2"
						src="<%=pre %>/resources/img/coin12.png" />资讯管理<img class="icon3"
						src="<%=pre %>/resources/img/coin19.png" /><img class="icon4"
						src="<%=pre %>/resources/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="<%=pre %>/resources/img/coin111.png" /><img class="coin22"
						src="<%=pre %>/resources/img/coin222.png" /><a href="<%=request.getContextPath() %>/sys/index/review?page=1" target="main"
						class="cks">资讯管理</a><img class="icon5" src="<%=pre %>/resources/img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="<%=pre %>/resources/img/coinL1.png" /><img class="icon2"
						src="<%=pre %>/resources/img/coinL2.png" /> 系统管理<img class="icon3"
						src="<%=pre %>/resources/img/coin19.png" /><img class="icon4"
						src="<%=pre %>/resources/img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="<%=pre %>/resources/img/coin111.png" /><img class="coin22"
						src="<%=pre %>/resources/img/coin222.png" /><a href="<%=request.getContextPath() %>/sys/index/adminInfo?id=${admin.id}"
						target="main" class="cks">个人信息</a><img class="icon5"
						src="<%=pre %>/resources/img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="<%=pre %>/resources/img/coin111.png" /><img class="coin22"
						src="<%=pre %>/resources/img/coin222.png" /><a href="<%=request.getContextPath() %>/sys/index/adminPwd"
						target="main" class="cks">修改密码</a><img class="icon5"
						src="<%=pre %>/resources/img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="<%=pre %>/resources/img/coin111.png" /><img class="coin22"
						src="<%=pre %>/resources/img/coin222.png" /><a class="cks" id="quit">退出</a><img class="icon5" src="<%=pre %>/resources/img/coin21.png" />
				</dd>
			</dl>

		</div>

	</div>
</body>
</html>
