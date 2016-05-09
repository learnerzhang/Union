/**
 * 
 */

$(document).ready(function() {
	// 输入框激活焦点、移除焦点
	jQuery.focusblur = function(focusid) {
		var focusblurid = $(focusid);
		var defval = focusblurid.val();
		focusblurid.focus(function() {
			var thisval = $(this).val();
			if (thisval == defval) {
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
})
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