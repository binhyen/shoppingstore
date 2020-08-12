package com.estore.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.estore.dao.CustomerDAO;
import com.estore.entity.Customer;

@Controller
public class CustomerManagerController {
	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	ServletContext servletContext; 
	
	@RequestMapping("/admin/customer/index")
	public String index(Model model) {
		Customer customer = new Customer();
		model.addAttribute("entity", customer);
		model.addAttribute("list", customerDAO.findAll());
		return "admin/customer/index";
	}
	
	@RequestMapping("/admin/customer/edit/{id}")
	public String edit(@PathVariable("id") String id,Model model) {
		Customer customer = customerDAO.findById(id);
		model.addAttribute("entity", customer);
		model.addAttribute("list", customerDAO.findAll());
		return "admin/customer/index";
	}
	
	@RequestMapping("/admin/customer/create")
	public String create(RedirectAttributes model, 
			@ModelAttribute("entity") Customer entity,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		// check null, trùng tên
		
		if (file.isEmpty()) {
			entity.setPhoto("photo.jpg");
		} else {
			entity.setPhoto(file.getOriginalFilename());
			String path = servletContext.getRealPath("/static/image/customers/" + entity.getPhoto());
			file.transferTo(new File(path));
		}
		customerDAO.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/customer/index";// để form trống
	}
	
	@RequestMapping("/admin/customer/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Customer entity, @RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			entity.setPhoto(file.getOriginalFilename());
			String path = servletContext.getRealPath("/static/image/customers/" + entity.getPhoto());
			file.transferTo(new File(path));
		}
		customerDAO.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/customer/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/customer/delete","/admin/customer/delete/{id}"})
	public String delete(@RequestParam(value = "id", required = false) String id1, @PathVariable(value = "id", required = false) String id2,RedirectAttributes model) {
		String id = (id1 != null)? id1 : id2;
		customerDAO.delete(id);
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/customer/index";
	}
	
	int pageSize = 2;
	@ResponseBody
	@RequestMapping("/pager/customer/page-count")
	public long pageCount(@RequestParam("pageSize") int pageSize) {
		return customerDAO.getPageCount(pageSize);
	}
	
	@ResponseBody
	@RequestMapping("/pager/customer/page/{pageNo}")
	public List<Customer> getPage(@PathVariable("pageNo") int pageNo) {
		List<Customer> list = customerDAO.getPage(pageNo,pageSize); 
		return list;
	}
	
	
}
