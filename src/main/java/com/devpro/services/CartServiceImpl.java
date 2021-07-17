package com.devpro.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.devpro.entities.CartItem;

@SessionScope
@Service
public class CartServiceImpl implements CartService{
	Map<Integer, CartItem> maps = new HashMap<>();
	
	@Override
	public CartItem update(int proID, int qty) {
		CartItem cartItem = maps.get(proID);
		cartItem.setQuantity(qty);
		return cartItem;
	}
	
	@Override
	public int getAmount() {
		return maps.values().stream()
				.mapToInt(item -> item.getQuantity() * item.getQuantity())
				.sum();
	}
}
