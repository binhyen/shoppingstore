package com.estore.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.estore.dao.ProductDAO;
import com.estore.entity.Product;

//bean này tải theo session vào spring quản lý, 1 session có 1 bean
@SessionScope //scopedTarget.cartService
@Service
public class CartService {
	@Autowired 
	ProductDAO productDAO;
	
	Map<Integer, Product> map = new HashMap<>();

	public void add(Integer id) {
		Product p = map.get(id);
		if (p == null) {
			p = productDAO.findById(id);
			p.setQuantity(1);
			map.put(id, p);
		} else {
			p.setQuantity(p.getQuantity()+1);
		}
	}

	public void remove(Integer id) {
		map.remove(id);
	}

	public void update(Integer id, int qty) {
		Product p = map.get(id);
		p.setQuantity(qty);
	}

	// xóa sạch giở hàng
	public void clear() {
		map.clear();
	}

	// tính tổng số các mặt hàng
	public int getCount() {
		Collection<Product> ps = this.getItems();
		int count = 0;
		for (Product product : ps) {
			count += product.getQuantity();
		}
		return count;
	}

	// tính tổng số tiền của giỏ hàng
	public double getAmount() {
		Collection<Product> ps = this.getItems();
		double amount = 0;
		for (Product product : ps) {
			amount += ((product.getQuantity() * product.getUnitPrice()) * (1 - product.getDiscount()));
		}
		return amount;
	}

	// lấy các mặt hàng trong giỏ
	public Collection<Product> getItems() {
		return map.values();
	}
}
