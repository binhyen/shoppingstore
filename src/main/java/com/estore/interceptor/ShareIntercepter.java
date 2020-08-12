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
public class ShareIntercepter extends HandlerInterceptorAdapter{
	
	@Autowired
	CategoryDAO dao;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		List<Category> list = dao.findAll();
//		modelAndView.addObject("cates", list);
		request.setAttribute("cates", list);
	}
}
