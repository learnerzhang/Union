package com.su.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.su.model.User;
import com.su.service.UserService;
import com.su.util.StringUtil;


@Controller
@RequestMapping("/user")
public class UserController {
	protected final transient Log log = LogFactory.getLog(UserController.class);
	@Autowired
	public UserService userService;

	public UserController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(params = "method=register")
	public String register(ModelMap modelMap, HttpServletRequest request) {
		System.out.println("注册页面...");
		return "view/user/user_register";
	}

	@RequestMapping(params = "method=login")
	public String login(ModelMap modelMap, HttpServletRequest request) {
		System.out.println("登录页面...");
		return "view/user/user_login";
	}

	@RequestMapping(params = "method=add", method = { RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> addUser(@RequestBody User user) throws IOException {
		System.out.println("添加用户....");
		user.setStatus("no");// waiting for checking....
		log.info(user);
		int rs = userService.saveUser(user);

		Map<String, Object> map = new HashMap<String, Object>();
		// data={code:val} val:-1,0,1,2,3,
		map.put("code", rs);
		return map;
	}

	@RequestMapping(params = "method=verify", method = { RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> Verify(@RequestBody User user, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession httpSession = request.getSession();

		String captcha = (String) httpSession.getAttribute("captcha");
		String vcode = user.getVcode();
		if (!StringUtil.equalWithcode(captcha, vcode)) {
			log.info(captcha + " != " + vcode);
			map.put("code", "1");// 验证码错误
		} else {

			log.info(captcha + " == " + vcode);// 输入正确验证....
			int rs = userService.verifyUser(user);// 验证是否存在该用户
			map.put("code", rs);// 返回状态码
		}
		return map;
	}

	@RequestMapping(params = "method=logout")
	@ResponseBody
	public Map<String, Object> logout(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		HttpSession httpSession = request.getSession();
		try {
			httpSession.removeAttribute("user");
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
}
