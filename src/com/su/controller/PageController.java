package com.su.controller;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class PageController {
	protected final transient Log log = LogFactory.getLog(PageController.class);
	public PageController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping
	public String load(ModelMap modelMap) {
		log.info("Go web index page...");
		return "index";
	}
	
	@RequestMapping("infos")
	public String getInfo(ModelMap modelMap) {
		log.info("get index infos...");
		return "view/front/infos";
	}
	
	@RequestMapping("news")
	public String getNew(ModelMap modelMap) {
		log.info("get index news...");
		return "view/front/news";
	}
	
	@RequestMapping("bases")
	public String getBase(ModelMap modelMap) {
		log.info("get index basenews...");
		return "view/front/bases";
	}
}
