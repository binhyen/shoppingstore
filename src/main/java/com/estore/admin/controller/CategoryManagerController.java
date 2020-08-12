package com.estore.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.estore.dao.CategoryDAO;
import com.estore.entity.Category;

@Controller
public class CategoryManagerController {
	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping("/admin/category/index")
	public String index(Model model) {
		Category category = new Category();
		model.addAttribute("entity", category);
		model.addAttribute("list", categoryDAO.findAll());
		return "admin/category/index";
	}
	
	@RequestMapping("/admin/category/edit/{id}")
	public String edit(@PathVariable("id") Integer id,Model model) {
		Category category = categoryDAO.findById(id);
		model.addAttribute("entity", category);
		model.addAttribute("list", categoryDAO.findAll());
		return "admin/category/index";
	}
	
	@RequestMapping("/admin/category/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Category entity) {
		// check null, trùng tên
		categoryDAO.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/category/index";// để form trống
	}
	
	@RequestMapping("/admin/category/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Category entity) {
		categoryDAO.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/category/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/category/delete","/admin/category/delete/{id}"})
	public String delete(@RequestParam(value = "id", required = false) Integer id1, @PathVariable(value = "id", required = false) Integer id2,RedirectAttributes model) {
		Integer id = (id1 != null)? id1 : id2;
		categoryDAO.delete(id);
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/category/index";
	}
}
