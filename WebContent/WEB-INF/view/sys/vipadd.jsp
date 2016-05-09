<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员注册-有点</title>
<link rel="stylesheet" type="text/css" href="../css/css.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.json-2.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/area.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/md5.js"></script>
<script type="text/javascript">
	function selectCity(data){
		var option = "";
		var selectedIndex = $("#prov :selected").text();
		$("#city").empty();
		$("#city").removeAttr("disabled");
		$.each(data, function(index, indexItem) {
			if(indexItem.n == selectedIndex){
				$.each(indexItem.c,function(i, item){
					option+="<option>"+item+"</option>";
				});
			}
		});
		$("#city").append(option);
	}
	function init_area(){
		var option = "";
		$.each(area, function(index, indexItem) {
			option+="<option>"+indexItem.n+"</option>";
		});
		$("#prov").append(option);
		
		$("#prov").bind("change", function() {
			$("#prov option[id='-1']").remove();//移除第一个元素
			selectCity(area);
		});
	}
	
	$(function(){
		init_area();
		$(".btn_yes").click(function(){
			$("#username").css("border-color","#ccc");
			$("#password").css("border-color","#ccc");
			$("#email").css("border-color","#ccc");
			$("#mobile_number").css("border-color","#ccc");
			$("#username").css("border-color","#ccc");
			$("#prov").css("border-color","#ccc");
			$("#code").css("border-color","#ccc");
			$("#address").css("border-color","#ccc");
			
			var flag = true;
			if ($("#username").val().trim()=="") {
				$("#username").css("border-color","red");flag = false;
			}
			if ($("#contact").val().trim()=="") {
				$("#contact").css("border-color","red");flag = false;
			}
			if ($("#password").val().trim()=="") {
				$("#password").css("border-color","red");flag = false;
			}
			
			var email = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
			if ($("#email").val().trim()==""||!email.test($("#email").val().trim())) {
				$("#email").css("border-color","red");flag = false;
			}
			if ($("#mobile_number").val().trim()=="") {
				$("#mobile_number").css("border-color","red");flag = false;
			}
			if ($("#username").val().trim()=="") {
				$("#username").css("border-color","red");flag = false;
			}
			if ($("#prov").val().trim()=="") {
				$("#prov").css("border-color","red");flag = false;
			}
			if ($("#code").val().trim()==""||isNaN($("#code").val())||$("#code").val().trim().length!=6) {
				$("#code").css("border-color","red");flag = false;
			}
			if ($("#address").val().trim()=="") {
				$("#address").css("border-color","red");flag = false;
			}
			if(!flag)return;
			var md5 = new MD5();
			var paratmeter = {
					username : $("#username").val().trim(),
					password : md5.MD5($("#password").val().trim()),
					type:$("input[name='type']:checked").val(),
					contact : $("#contact").val().trim(),
					email : $("#email").val().trim(),
					mobile_number : $("#mobile_number").val().trim(),
					area : $("#prov").val().trim()+";"+$("#city").val().trim(),
					code : $("#code").val().trim(),
					address : $("#address").val().trim()
			};
			$.ajax({
				contentType: "application/json;charset=utf-8",
				url : "<%=request.getContextPath()%>/sys/index/addUser",
				type : "post",
				data : JSON.stringify(paratmeter),
				dataType : "json",
				success : function(data) {
					if (data.hasOwnProperty("code")) {
						if (data.code == "0") {
							window.location.href = "<%=request.getContextPath() %>/sys/index/vip?page=${page }";//当前页面...
						} else if (data.code == "1") {
							$("#username").css("border-color","red").focus();
						} else{
							alert("网络异常,请稍后再试...");
						}
						
					}
				}
			});	
		});
	})
</script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="../img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
					href="#">会员管理</a>&nbsp;-</span>&nbsp;会员注册
			</div>
		</div>
		<div class="page ">
			<!-- 会员注册页面样式 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>会员注册</span>
				</div>
				<div class="baBody">
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input type="text" class="input3" id="username" name="username"/>
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="text" class="input3" id="password" name="password"/>
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：<input style="width: 20px;height: 20px;margin-left: 20px;" checked="checked" type="radio" class="input3" id="type" name="type" value="0"/>展商 <input  style="margin-left: 20px;width: 20px;height: 20px;" type="radio" class="input3" id="type" name="type" value="1"/>展馆
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" class="input3" id="contact" name="contact"/>
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input type="text" class="input3" id="email" name="email"/>
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;手机号码：<input type="text" class="input3"  id="mobile_number" name="mobile_number"/>
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;所在城市：&nbsp;<select id="prov" class="input3" style="width: 120px; margin-left: 6px;"> <option id="-1"></option> </select><select id="city" class="input3" disabled="disabled" style="width: 120px; margin-left: 6px;"> <option id="-1"></option></select> 
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：<input type="text" class="input3" id="code" name="code" />
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：<input type="text" class="input3" id="address" name="address"/>
					</div>
					<div class="bbD">
						<p class="bbDP">
							<a class="btn_ok btn_yes">提交</a> <a class="btn_ok btn_no" href="<%=request.getContextPath() %>/sys/index/vip?page=${page }">取消</a>
						</p>
					</div>
				</div>
			</div>

			<!-- 会员注册页面样式end -->
		</div>
	</div>
</body>
</html>