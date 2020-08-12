package com.estore.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.estore.dao.CategoryDAO;
import com.estore.entity.Category;
import com.estore.entity.Customer;

@Component
public class AuthorizeInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	CategoryDAO dao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Customer user = (Customer) session.getAttribute("user");
		if (user == null) {
			// lấy đường dẫn cố tình truy xuất và lưu lại
			session.setAttribute("back-url", request.getRequestURI());
			response.sendRedirect("/account/login");
			return false;
		}
		return true;
	}
	
}
