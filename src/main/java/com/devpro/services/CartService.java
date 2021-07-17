package com.devpro.services;

import com.devpro.entities.CartItem;

public interface CartService {

	int getAmount();

	CartItem update(int proID, int qty);

}
