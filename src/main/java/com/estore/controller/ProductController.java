package com.estore.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.estore.bean.MailInfo;
import com.estore.dao.CategoryDAO;
import com.estore.dao.ProductDAO;
import com.estore.entity.Product;
import com.estore.service.CookieService;
import com.estore.service.MailService;

@Controller
public class ProductController {
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CookieService cookieService;
	@Autowired
	MailService mailService;
	
	@RequestMapping("product/list-by-category/{cid}")
	public String listByCategory(Model model,@PathVariable("cid") Integer categoryId) {
		List<Product> list = productDAO.findByCategoryId(categoryId);
		model.addAttribute("list", list);
		return "product/list";
	}
	
	
	@RequestMapping(value = "/product/list-by-keywords", method = RequestMethod.POST)
	public String listByCategory(Model model,@RequestParam("keywords") String keywords) {
		List<Product> list = productDAO.findByKeywords(keywords);
		model.addAttribute("list", list);
		return "product/list";
	}
	
	@RequestMapping("product/list-by-special/{id}")
	public String listBySpecial(Model model,@PathVariable("id") Integer id) {
		List<Product> list = productDAO.findBySpecial(id);
		model.addAttribute("list", list);
		return "product/list";
	}
	
	@RequestMapping("product/detail/{id}")
	public String detail(Model model,@PathVariable("id") Integer id) {
		Product prod = productDAO.findById(id);
		model.addAttribute("prod", prod);
		
		//Tăng số lần xem
		prod.setViewCount(prod.getViewCount() + 1);
		productDAO.update(prod);
		
		//Hàng cùng loại
		List<Product> list =productDAO.findByCategoryId(prod.getCategory().getId());
		model.addAttribute("list", list);
		
		//Hàng yêu thích
		Cookie favo = cookieService.read("favo");
		if (favo != null) {
			String ids = favo.getValue();
			List<Product> favos = productDAO.findByIds(ids);
			model.addAttribute("favos", favos);
		}
		
		//Hàng đã xem
		Cookie viewed = cookieService.read("viewed");
		String value = id.toString();
		if (viewed != null) {
			value = viewed.getValue();
			value += ","+id.toString();
		}
		cookieService.create("viewed", value, 10);
		List<Product> vieweds = productDAO.findByIds(value);
		model.addAttribute("vieweds", vieweds);
		
		return "product/detail";
	}
	
	@ResponseBody
	@RequestMapping("product/add-to-favo/{id}")
	public boolean addToFavo(Model model,@PathVariable("id") Integer id) {
		Cookie favo = cookieService.read("favo");
		String value = id.toString();
		if (favo != null) {
			value = favo.getValue();
			if (!value.contains(id.toString())) {
				value+=","+id.toString();
			} else {
				return false;
			}
		}
		cookieService.create("favo", value, 30);
		return true;
	}
	
	@ResponseBody
	@RequestMapping("/product/send-to-friend")
	public boolean sendToFriend(Model model,MailInfo info,HttpServletRequest request) {
		info.setSubject("Thông tin hàng hóa");
		try {
			String id = request.getParameter("id");
			System.out.println("#yen debug id: "+id);
			String link = request.getRequestURL().toString().replace("send-to-friend", "detail/"+id);
			info.setBody(info.getBody()+"<hr><a href='"+link+"'>Xem chi tiết...</a>");
			mailService.send(info);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
}
