package com.estore.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.estore.dao.OrderDAO;
import com.estore.dao.OrderDetailDAO;
import com.estore.entity.Order;

@Controller
public class OrderManagerController {
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	OrderDetailDAO details;
	
	@RequestMapping("/admin/order/index")
	public String index(Model model) {
		Order order = new Order();
		model.addAttribute("entity", order);
		model.addAttribute("details", details.findByOrder(order));
		model.addAttribute("list", orderDAO.findAll());
		return "admin/order/index";
	}
	
	@RequestMapping("/admin/order/edit/{id}")
	public String edit(@PathVariable("id") Integer id,Model model) {
		Order order = orderDAO.findById(id);
		model.addAttribute("entity", order);
		model.addAttribute("details", details.findByOrder(order));
		model.addAttribute("list", orderDAO.findAll());
		return "admin/order/index";
	}
	
	@RequestMapping("/admin/order/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Order entity) {
		// check null, trùng tên
		orderDAO.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/order/index";// để form trống
	}
	
	@RequestMapping("/admin/order/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Order entity) {
		orderDAO.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/order/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/order/delete","/admin/order/delete/{id}"})
	public String delete(@RequestParam(value = "id", required = false) Integer id1, @PathVariable(value = "id", required = false) Integer id2,RedirectAttributes model) {
		Integer id = (id1 != null)? id1 : id2;
		orderDAO.delete(id);
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:/admin/order/index";
	}
}
