package com.estore.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.estore.dao.ProductDAO;
import com.estore.entity.Product;

@Controller
public class ProductManagerController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	ServletContext servletContext; 
	
	@RequestMapping("/admin/product/index")
	public String index(Model model) {
		Product product = new Product();
		model.addAttribute("entity", product);
		model.addAttribute("list", productDAO.findAll());
		return "admin/product/index";
	}
	
	@RequestMapping("/admin/product/edit/{id}")
	public String edit(@PathVariable("id") Integer id,Model model) {
		Product product = productDAO.findById(id);
		model.addAttribute("entity", product);
		model.addAttribute("list", productDAO.findAll());
		return "admin/product/index";
	}
	
	@RequestMapping("/admin/product/create")
	public String create(RedirectAttributes model, 
			@ModelAttribute("entity") Product entity,
			@RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException {
		// check null, trùng tên
		
		if (file.isEmpty()) {
			entity.setImage("photo.jpg");
		} else {
			entity.setImage(file.getOriginalFilename());
			String path = servletContext.getRealPath("/static/image/products/" + entity.getImage());
			file.transferTo(new File(path));
		}
		productDAO.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/product/index";// để form trống
	}
	
	@RequestMapping("/admin/product/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Product entity, @RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			entity.setImage(file.getOriginalFilename());
			String path = servletContext.getRealPath("/static/image/products/" + entity.getImage());
			file.transferTo(new File(path));
		}
		productDAO.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/product/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/product/delete","/admin/product/delete/{id}"})
	public String delete(@RequestParam(value = "id", required = false) Integer id1, @PathVariable(value = "id", required = false) Integer id2,RedirectAttributes model) {
		Integer id = (id1 != null)? id1 : id2;
		productDAO.delete(id);
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/product/index";
	}
}
