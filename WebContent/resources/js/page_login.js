$(document).ready(function() {
	//username password vcode emTip(登录情况)
	// 获取JS传递的语言参数
	var utils = new Utils();
	var args = utils.getScriptArgs();
	// 隐藏Loading/注册失败 DIV
	$(".loading").hide();
	//$(".login").hide();
	registError = $("<label class='error repeated'></label>");

	// 加载国际化语言包资源
	utils.loadProperties(args.lang);
	
	// 输入框激活焦点、移除焦点
	jQuery.focusblur = function(focusid) {
		var focusblurid = $(focusid);
		var defval = focusblurid.val();
		focusblurid.focus(function() {
			var thisval = $(this).val();
			if (thisval == defval) 
			{	
				$(this).val("");
			}
		});
		focusblurid.blur(function() {
			var thisval = $(this).val();
			if (thisval == "") {
				$(this).val(defval);
			}
		});
	};

	/* 下面是调用方法 */
	//$.focusblur("#vcode");
	// 获取表单验证对象[填写验证规则]
	var validate = $("#loginForm").validate({
		rules : {
			username : {required : true},
			password : {required : true},
			vcode : {required : true}
			},
		messages : {
			username : {
				required : $.i18n.prop("Form.PleaseInputUser"),
				},
			password : {
				required : $.i18n.prop("Form.PleaseInputPassword"),
				},
			vcode : {
				required : $.i18n.prop("Form.PleaseInputVCode"),
				}
			}
		});
		// ajax提交注册信息
		$("#login_btn").bind("click", function() {
			//alert("点击提交");
			regist(validate);
		});
	
		$("body").each(function() {
			$(this).keydown(function() {
				if (event.keyCode == 13) {
					regist(validate);
					}
				});
		});

		// 输入框激活焦点、溢出焦点的渐变特效
		$("#vcode").focus(function() {
			$(this).prev().fadeOut();
			});
		$("#vcode").blur(function() {
			if (!$("#vcode").val()) {
				$(this).prev().fadeIn();
			}
		});
		if ($("#vcode").val()) {
			$("#vcode").prev().fadeOut();
		};
		
		if ($("#username").val()) {
			$("#username").prev().fadeOut();
		};
		$("#username").focus(function() {
			$(this).prev().fadeOut();
		});
		
		$("#username").blur(function() {
			if (!$("#username").val()) {$(this).prev().fadeIn();};
		});
		
		
		if ($("#password").val()) {$("#password").prev().fadeOut();};
		$("#password").focus(function() {
			$(this).prev().fadeOut();});
		$("#password").blur(function() {if (!$("#password").val()) {$(this).prev().fadeIn();};
	
	});
});
//var local = document.location.pathname;
//var index = local.substr(1).indexOf("/");
//var contextPath = local.substr(0, index + 1);
//var t = 5;
//function showTime(){  
//    t = t - 1;  
//    $(".login").html($.i18n.prop("MSG.success")+","+t+"秒后自动调转到登录页面....");
//    if(t==0){
//    	window.location.href = contextPath + "/user?method=login";
//    }
//    //每秒执行一次,showTime()  
//    setTimeout("showTime()",1000);
//}  
function regist(validate) {
	// 校验username, password，校验如果失败的话不提交
	if (validate.form()) {
			//alert("提交数据,,,,path: "+contextPath);
			var md5 = new MD5();
			var paratmeter = {
					"username" : $("#username").val(),
					"password" : md5.MD5($("#password").val()),
					"vcode" : $("#vcode").val()
				};
			var local = document.location.pathname;
			var index = local.substr(1).indexOf("/");
			var contextPath = local.substr(0, index + 1);
			//alert(paratmeter);
			//alert(JSON.stringify(paratmeter))
			$.ajax({
						contentType : 'application/json',
						url : contextPath + "/user?method=verify",
						type : "post",
						data : JSON.stringify(paratmeter),
						dataType : "json",
						success : function(data) {
							if (data.hasOwnProperty("code")) {
								if (data.code == 0) {
									var local = document.location.pathname;
									var index = local.substr(1).indexOf("/");
									var contextPath = local.substr(0, index + 1);
									window.location.href = contextPath+"/";//登录成功.跳转首页...
								} else if (data.code == 1) {
									$("#emTip").text("验证码输入错误");
									$("#emTip").attr("style", "display: inline;color:#ff0000;padding-left:12px;bottom:-20px;font-size:6px;");//多个属性的设置 
								} else if (data.code == 2) {
									$("#emTip").text("用户或密码输入错误");
									$("#emTip").attr("style", "display: inline;color:#ff0000;padding-left:12px;bottom:-20px;font-size:6px;");//多个属性的设置
								}
							}
						}
					});
	}
}

var Utils = function() {
};

Utils.prototype.loadProperties = function(lang) {
	jQuery.i18n.properties({// 加载资浏览器语言对应的资源文件
		name : 'ApplicationResources',
		language : lang,
		path : 'resources/i18n/',
		mode : 'map',
		callback : function() {// 加载成功后设置显示内容
		}
	});
};

Utils.prototype.getScriptArgs = function() {// 获取多个参数
	var scripts = document.getElementsByTagName("script"),
	// 因为当前dom加载时后面的script标签还未加载，所以最后一个就是当前的script
	script = scripts[scripts.length - 1], src = script.src, reg = /(?:\?|&)(.*?)=(.*?)(?=&|$)/g, temp, res = {};
	while ((temp = reg.exec(src)) != null)
		res[temp[1]] = decodeURIComponent(temp[2]);
	return res;
};
