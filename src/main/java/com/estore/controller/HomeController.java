package com.estore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.estore.dao.CategoryDAO;
import com.estore.dao.ProductDAO;
import com.estore.entity.Category;

@Controller
public class HomeController {
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping("home/index")
	public String index(Model model) {
		List<Category> list = categoryDAO.getRandom();
		model.addAttribute("randoms", list);
		int special = 4;
		model.addAttribute("list", productDAO.findBySpecial(special));
		return "home/index";
	}
	
	@RequestMapping("home/about")
	public String about() {
		return "home/about";
	}
	
	@RequestMapping("home/contact")
	public String contact() {
		return "home/contact";
	}
	
	@RequestMapping("home/feedback")
	public String feedback() {
		return "home/feedback";
	}
	
	@RequestMapping("home/faq")
	public String faq() {
		return "home/faq";
	}
	
	@ResponseBody
	@RequestMapping("/home/language")
	public void language() {
		System.out.println("bbbbbbbbbb");
//		return "home/faq";
	}
}
