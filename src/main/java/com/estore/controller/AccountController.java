package com.estore.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.estore.bean.MailInfo;
import com.estore.dao.CustomerDAO;
import com.estore.entity.Customer;
import com.estore.service.CookieService;
import com.estore.service.MailService;

@Controller
public class AccountController {
	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	HttpSession session;
	@Autowired
	CookieService cookieService;
	@Autowired
	ServletContext servletContext;
	@Autowired
	MailService mailService;
	@Autowired
	HttpServletRequest request;

	@GetMapping("/account/login")
	public String login(Model model) {
		Cookie ckid = cookieService.read("userid");
		Cookie ckpw = cookieService.read("pass");
		if (ckid != null) {
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();
			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
		}

		return "account/login";
	}

	@PostMapping("/account/login")
	public String login(Model model, @RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam(value = "rm", defaultValue = "false") boolean rm) {
		Customer user = customerDAO.findById(id);
		if (user == null) {
			model.addAttribute("message", "Invalid username!");
		} else if (!pw.equals(user.getPassword())) {
			model.addAttribute("message", "Invalid password!");
		} else if (!user.getActivated()) {
			model.addAttribute("message", "Your account is Inactivated!");
		} else {
			model.addAttribute("message", "Login success!");
			session.setAttribute("user", user);
			// Ghi nhớ tài khoản bằng cookie
			if (rm == true) {
				cookieService.create("userid", user.getId(), 30);
				cookieService.create("pass", user.getPassword(), 30);
			} else {
				cookieService.delete("userid");
				cookieService.delete("pass");
			}
			
			//Quay lại trang bị chặn (nếu có)
			String backUrl = (String) session.getAttribute("back-url");
			if (backUrl != null) {
				return "redirect:"+backUrl;
			}
		}
		return "account/login";
	}

	@RequestMapping("/account/logout")
	public String logout(Model model) {
		session.removeAttribute("user");

		return "redirect:/home/index";
	}

	@GetMapping("/account/register")
	public String register(Model model) {
		Customer user = new Customer();
		model.addAttribute("form", user);
		return "account/register";
	}

	@PostMapping("/account/register")
	public String register(Model model, 
			@Validated @ModelAttribute("form") Customer user, BindingResult errors, 
			@RequestParam("photo-file") MultipartFile file) throws IllegalStateException, IOException, MessagingException {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Please fix some following errors");
			return "account/register";
		} else {
			Customer user2 = customerDAO.findById(user.getId());
			if (user2 != null) {
				model.addAttribute("message", "User is in used");
				return "account/register";
			}
		}
		if (file.isEmpty()) {
			user.setPhoto("user.jpg");
		} else {
			String dir = servletContext.getRealPath("/static/image/customers");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		user.setActivated(false);
		user.setAdmin(false);
		customerDAO.create(user);
		
		model.addAttribute("message", "Register successfully!");
		String from = "vobinhyen93@gmail.com";
//		"vobinhyen931@gmail.com";
		String to = user.getEmail();
		String subject = "Welcome";
		String url = request.getRequestURL().toString().replace("register", "activate/"+user.getId());
		String body = "Click <a href='"+url+"'>Activated</a>";
		MailInfo mail = new MailInfo(from, to, subject, body);
		mailService.send(mail);
		
		return "account/register";
	}
	
	@GetMapping("/account/activate/{id}")
	public String register(Model model, @PathVariable("id") String id) {
		Customer user = customerDAO.findById(id);
		user.setActivated(true);
		customerDAO.update(user);
		return "redirect:/account/login";
	}
	
	@GetMapping("/account/forgot")
	public String forgot(Model model) throws MessagingException {
		
		return "account/forgot";
	}
	
	@PostMapping("/account/forgot")
	public String forgot(Model model, 
			@RequestParam("id") String id,
			@RequestParam("email") String email) throws MessagingException {
		Customer user = customerDAO.findById(id);
		if (user == null) {
			model.addAttribute("message", "Invalid username");
		} else if (!email.equals(user.getEmail())) {
			model.addAttribute("message", "Invalid email");
		} else {
			String from = "vobinhyen93@gmail.com";
			String to = user.getEmail();
			String subject = "Forgot password";
			String body = "Your password is <strong>"+ user.getPassword()+"</strong>";
			MailInfo mail = new MailInfo(from, to, subject, body);
			mailService.send(mail);
			model.addAttribute("message", "Your password was sent to your inbox");
		}
		return "redirect:/account/login";
	}
	
	@GetMapping("/account/change")
	public String change(Model model) throws MessagingException {
		
		return "account/change";
	}
	
	@PostMapping("/account/change")
	public String change(Model model, 
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			@RequestParam("pw1") String pw1,
			@RequestParam("pw2") String pw2) throws MessagingException {
		
		if (!pw1.equals(pw2)) {
			model.addAttribute("message","Confirm password is not match");
		} else {
			Customer user = customerDAO.findById(id);
			if (user == null) {
				model.addAttribute("message", "Invalid username");
			} else if (!pw.equals(user.getPassword())) {
				model.addAttribute("message", "Invalid password");
			} else {
				user.setPassword(pw1);
				customerDAO.update(user);
				model.addAttribute("message", "Your password was changed successfully!");
			}
		}
		return "redirect:/account/login";
	}
	
	@GetMapping("/account/edit")
	public String edit(Model model) {
		Customer user = (Customer) session.getAttribute("user");
		model.addAttribute("form", user);
		return "account/edit";
	}

	@PostMapping("/account/edit")
	public String edit(Model model, 
			@Validated @ModelAttribute("form") Customer user, BindingResult errors,
			@RequestParam("photo-file") MultipartFile file) throws IllegalStateException, IOException {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Please fix some following errors");
			return "account/register";
		} else {
			Customer user2 = customerDAO.findById(user.getId());
			if (user2 != null) {
				model.addAttribute("message", "User is in used");
				return "account/register";
			}
		}
		if (!file.isEmpty()) {
			String dir = servletContext.getRealPath("/static/image/customers");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		customerDAO.update(user);
		session.setAttribute("user", user);
		model.addAttribute("message", "Update account successfully!");
		return "account/edit";
	}
	
	
}
