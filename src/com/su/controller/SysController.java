package com.su.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.su.model.Page;
import com.su.model.User;
import com.su.service.UserService;
import com.su.util.PageUtil;
import com.su.util.StringUtil;


@Controller
@RequestMapping("/sys")
public class SysController {

	protected final transient Log log = LogFactory.getLog(SysController.class);
	@Autowired
	public UserService userService;
	@Autowired
	@RequestMapping(value="/login")
	public String login() {
		
		return "view/sys/login";
	}
	
	//登录验证
	@RequestMapping(value="/verify", method =RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> AdminLogin(@RequestBody User user, HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession httpSession = request.getSession();
		String captcha = (String) httpSession.getAttribute("captcha");
		String vcode = user.getVcode();
		if (!StringUtil.equalWithcode(captcha, vcode)) {
			log.info(captcha + " != " + vcode);
			map.put("code", "1");// 验证码错误
		} else {
			log.info(captcha + " == " + vcode);// 输入正确验证....
			int rs = userService.verifyAdminUser(user);// 验证是否存在该用户
			User  u = userService.getUserByField("username", user.getUsername());
			if (rs == 0) {// 存在.即登录成功.将用户存于Session中去
				
				log.debug(u);
				httpSession.setAttribute("admin", u);
			}
			map.put("code", rs);// 返回状态码
		}
		return map;
	}
	//登录验证
	@RequestMapping(value="/logout")
	@ResponseBody
	public Map<String, Object> Adminlogout(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		try {
			session.removeAttribute("admin");
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "-1");
		}
		return map;
	}
	@RequestMapping(value="/index")
	public String index() {
		
		return "view/sys/index";
	}
	@RequestMapping(value="/index/head")
	public String head() {
		
		return "view/inc/head";
	}
	@RequestMapping(value="/index/left")
	public String left() {
		
		return "view/inc/left";
	}
	@RequestMapping(value="/index/main")
	public String main(ModelMap map) {
		
		return "view/sys/main";
	}
	//**系统管理员**/
	@RequestMapping(value="/index/admin",params="page")
	public String admin(ModelMap map,@RequestParam("page") String page) {
		log.info("page: "+page);
		int total = userService.getAllAdminNum();
		Page p = PageUtil.createPage(10, total, Integer.valueOf(page));//!!!
		List<Object> admins = userService.getAllAdmins(p);
		map.put("admins", admins);
		map.put("page", p);
		return "view/sys/admin";
	}
	
	@RequestMapping(value="/index/addAdmin",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addAdmin(@RequestBody User user) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(null!=userService.getUserByField("username", user.getUsername())){
			map.put("code", "1");//用户名存在
		}else {
			user.setEmail("");
			user.setStatus("yes");
			user.setSex("m");
			user.setContact("");
			user.setCtime(new Timestamp(System.currentTimeMillis()));
			if (userService.saveAdmin(user)) {
				map.put("code", "0");
			}
		}
		return map;
	}
	@RequestMapping(value="/index/adminInfo",params="id")
	public String adminInfo(ModelMap modelMap,@RequestParam("id") String id) {
		
		User user =userService.getUserById(id);
		modelMap.put("user", user);
		return "view/sys/adminInfo";
	}
	@RequestMapping(value="/index/updateAdminInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateAdminInfo(@RequestBody User user,HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		User u = userService.getUserById(user.getId());
		
		u.setContact(user.getContact());
		u.setPhone(user.getPhone());
		u.setEmail(user.getEmail());
		u.setSex(user.getSex());
		
		try {
			userService.updateUser(u);
			request.getSession().setAttribute("admin", u);
			log.info("update:"+u);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	
	@RequestMapping(value="/index/adminPwd")
	public String adminPwd(ModelMap modelMap) {
		
		return "view/sys/changepwd";
	}
	@RequestMapping(value="/index/updateAdminPwd",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateAdminPwd(@RequestBody User user,HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		User u = userService.getUserById(user.getId());
		u.setPassword(user.getPassword());
		try {
			userService.updateUser(u);
			request.getSession().setAttribute("admin", u);
			log.info("update:"+u);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	
	@RequestMapping(value="/index/delAdmin",params="id" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delAdmin(@RequestParam("id") String id) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		User delAdmin = userService.getUserById(id);
		log.info(id+" : " +delAdmin);
		try {
			userService.deleteUser(delAdmin);
			map.put("code", "0");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("code", "1");
		}
		return map;
	}
	
}
