<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String pre = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员管理-有点</title>
<link rel="stylesheet" type="text/css" href="<%=pre %>/resources/style/css.css" />
<link rel="stylesheet" type="text/css" href="<%=pre %>/resources/style/pagination.css" />
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/md5.js"></script>
<!-- <script type="text/javascript" src="js/page.js" ></script> -->
<style type="text/css">
#userbtn_add_id {
	margin-left: 60px;
	width: 135px;
	height: 40px;
	border: none;
	font-size: 16px;
	color: #fff;
	background-color: #47a4e1;
}
</style>
<script type="text/javascript">
// 广告弹出框
var id = 0;
function del(did){
	id = did;
	$(".banDel").show();
}
function PageCallback(index) { 
	window.location.href="<%=request.getContextPath() %>/sys/index/admin?page="+(index+1);
}
$(function(){
	
	$("#Pagination").pagination("${page.totalPage }",{
		current_page:"${page.currentPage-1}",
		callback: PageCallback
	});
	
	$("#delban").click(function(){
		$(".banDel").show();
	});
	$(".close").click(function(){
		$(".banDel").hide();
	});
	$(".no").click(function(){
		$(".banDel").hide();
	});
	
	$(".yes").click(function(){
		
		$.ajax({
			contentType: "application/json;charset=utf-8",
			url : "<%=request.getContextPath()%>/sys/index/delAdmin?id="+id,
			type : "post",
			async: false,
			dataType : "json",
			success : function(data) {
				if (data.hasOwnProperty("code")) {
					if (data.code == "0") {
						$(".banDel").hide();
						window.location.href = "<%=request.getContextPath() %>/sys/index/admin?page=1";//当前页面...
					} else if (data.code == "1") {
						$(".banDel").hide();
					} 
				}
			}
		});	
	});
	
	$("#userbtn_add_id").click(function(){
		
		$("#username").css("border-color","#ccc");
		$("#password").css("border-color","#ccc");
		var flag = true;
		if ($("#username").val()==""||$("#username").val().trim()=="") {
			$("#username").css("border-color","red").focus();
			flag = false;
		}
		if ($("#password").val()==""||$("#password").val().trim()=="") {
			$("#password").css("border-color","red").focus();
			flag = false;
		}
		if(!flag)
		{	
			return false;
		}
		
		var md5 = new MD5();
		var paratmeter = {
				username : $("#username").val(),
				password : md5.MD5($("#password").val())
			};
		$.ajax({
			contentType: "application/json;charset=utf-8",
			url : "<%=request.getContextPath()%>/sys/index/addAdmin",
			type : "post",
			data : JSON.stringify(paratmeter),
			dataType : "json",
			success : function(data) {
				if (data.hasOwnProperty("code")) {
					
					if (data.code == "0") {
						window.location.href = "<%=request.getContextPath() %>/sys/index/admin?page=1";//当前页面...
					} else if (data.code == "1") {
						$("#username").css("border-color","red");
					} 
				}
			}
		});	
		return false;
	});
})
// 广告弹出框 end
</script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="<%=pre %>/resources/img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;-</span>&nbsp;管理员管理
			</div>
		</div>

		<div class="page">
			<!-- user页面样式 -->
			<div class="connoisseur">
				<div class="conform">
					<form>
						<div class="cfD">
							<input class="userinput" id="username" name="username" type="text" placeholder="输入用户名" />&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input class="userinput vpr" id="password" name="password" type="text" placeholder="输入用户密码" />
							<button id="userbtn_add_id">添加</button>
						</div>
					</form>
				</div>
				<!-- user 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="66px" class="tdColor tdC">序号</td>
							<td width="400px" class="tdColor">用户名</td>
							<td width="400px" class="tdColor">姓名</td>
							<td width="435px" class="tdColor">Email</td>
							<td width="435px" class="tdColor">手机号</td>
							<td width="630px" class="tdColor">添加时间</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>
						<c:forEach items="${admins }" var="admin" varStatus="status">
							<tr height="40px">
								<td>${status.index+1 }</td>
								<td>${admin.username }</td>
								<td>${admin.contact }</td>
								<td>${admin.email }</td>
								<td>${admin.phone }</td>
								<td>${fn:split(admin.ctime,'.')[0] }</td>
								<td>
									<img onclick="del(${admin.id})" id="delban" class="operation delban" src="<%=pre %>/resources/img/delete.png">
								</td>
						</tr>
						</c:forEach>
					</table>
					<div class="pages">
						<div id="Pagination" style="float: right;"></div>
				        <%-- <div class="searchPage" style="float: right;">
				        	<span class="page-sum">共<strong class="allPage">${page.totalPage }</strong>页</span>
				          	<span class="page-go">跳转<input type="text">页</span>
				        	<a href="javascript:;" class="page-btn">GO</a>
				        </div> --%>
					</div>
				</div>
				<!-- user 表格 显示 end-->
			</div>
			<!-- user页面样式end -->
		</div>
	</div>


	<!-- 删除弹出框 -->
	<div class="banDel">
		<div class="delete">
			<div class="close">
				<a><img src="../img/shanchu.png" /></a>
			</div>
			<p class="delP1">你确定要删除此条记录吗？</p>
			<p class="delP2">
				<a href="#" class="ok yes">确定</a><a class="ok no">取消</a>
			</p>
		</div>
	</div>
	<!-- 删除弹出框  end-->
</body>
</html>