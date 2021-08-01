package com.devpro.controller.users;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import com.devpro.entities.AjaxResponse;
import com.devpro.entities.Cart;
import com.devpro.entities.CartItem;
import com.devpro.entities.Product;
import com.devpro.entities.SaleOrder;
import com.devpro.entities.SaleOrderProducts;
import com.devpro.entities.User;
import com.devpro.repositories.ProductRepo;
import com.devpro.repositories.SaleOrderRepo;
import com.devpro.services.ProductService;
import com.devpro.services.SaleOrderService;

@Controller
public class CartController extends BaseController {

	@Autowired
	ProductRepo productRepo;
	@Autowired
	SaleOrderRepo saleOrderRepo;
	@Autowired
	ProductService productService;
	@Autowired
	SaleOrderService saleOrderService;
	
	@RequestMapping(value = { "/paypal" }, method = RequestMethod.POST)
	public String paypal(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		String customerName = null;
		String customerAddress = null;
		String customerPhone = null;
		String customerEmail = null;

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
				customerPhone = ((User) principal).getPhone();
				customerName = ((User) principal).getName();
				customerAddress = ((User) principal).getAddress();
				customerEmail = ((User) principal).getEmail();

				model.addAttribute("customerName", ((User) principal).getName());
				model.addAttribute("customerAddress", ((User) principal).getAddress());
				model.addAttribute("customerPhone", ((User) principal).getPhone());
				model.addAttribute("customerEmail", ((User) principal).getEmail());
			} else {

				customerPhone = request.getParameter("customerPhone");
				customerAddress = request.getParameter("customerAddress");
				customerName = request.getParameter("customerName");
				customerEmail = request.getParameter("customerEmail");

				model.addAttribute("customerName", request.getParameter("customerName"));
				model.addAttribute("customerAddress", request.getParameter("customerAddress"));
				model.addAttribute("customerPhone", request.getParameter("customerPhone"));
				model.addAttribute("customerEmail", request.getParameter("customerEmail"));
			}
		}

		SaleOrder saleOrder = new SaleOrder();
		Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
		List<CartItem> cartItems = cart.getCartItems();

		BigDecimal sum = new BigDecimal(0);
		String sumVN = null;
		for (CartItem item : cartItems) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productRepo.getOne(item.getProductId()));
			saleOrderProducts.setQuantity(item.getQuantity());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
			for (int i = 1; i <= item.getQuantity(); i++) {
				sum = sum.add(saleOrderProducts.getProduct().getPrice());
			}
			Locale locale = new Locale("vi", "VN");
			NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
			sumVN = fmt.format(sum);
		}
		model.addAttribute("quantityCart", cartItems.size());
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("sumVN", sumVN);
		model.addAttribute("sum", sum);
		//saleOrderService.saveOrderProduct(customerAddress, customerName, customerPhone, customerEmail, httpSession);
		return "paypal";
	}
	
	
	@RequestMapping(value = { "/cart/finish" }, method = RequestMethod.POST)
	public String finish(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		String customerName = null;
		String customerAddress = null;
		String customerPhone = null;
		String customerEmail = null;

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
				customerPhone = ((User) principal).getPhone();
				customerName = ((User) principal).getName();
				customerAddress = ((User) principal).getAddress();
				customerEmail = ((User) principal).getEmail();

				model.addAttribute("customerName", ((User) principal).getName());
				model.addAttribute("customerAddress", ((User) principal).getAddress());
				model.addAttribute("customerPhone", ((User) principal).getPhone());
				model.addAttribute("customerEmail", ((User) principal).getEmail());
			} else {

				customerPhone = request.getParameter("customerPhone");
				customerAddress = request.getParameter("customerAddress");
				customerName = request.getParameter("customerName");
				customerEmail = request.getParameter("customerEmail");

				model.addAttribute("customerName", request.getParameter("customerName"));
				model.addAttribute("customerAddress", request.getParameter("customerAddress"));
				model.addAttribute("customerPhone", request.getParameter("customerPhone"));
				model.addAttribute("customerEmail", request.getParameter("customerEmail"));
			}
		}

		SaleOrder saleOrder = new SaleOrder();
		Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
		List<CartItem> cartItems = cart.getCartItems();

		BigDecimal sum = new BigDecimal(0);
		String sumVN = null;
		for (CartItem item : cartItems) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productRepo.getOne(item.getProductId()));
			saleOrderProducts.setQuantity(item.getQuantity());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
			for (int i = 1; i <= item.getQuantity(); i++) {
				sum = sum.add(saleOrderProducts.getProduct().getPrice());
			}
			Locale locale = new Locale("vi", "VN");
			NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
			sumVN = fmt.format(sum);
		}
		model.addAttribute("quantityCart", cartItems.size());
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("sumVN", sumVN);
		model.addAttribute("sum", sum);
		//saleOrderService.saveOrderProduct(customerAddress, customerName, customerPhone, customerEmail, httpSession);
		return "users/finish";
	}
	
	
	@RequestMapping(value = { "/cart/thankyou" }, method = RequestMethod.POST)
	public String thankyou(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		String customerName = null;
		String customerAddress = null;
		String customerPhone = null;
		String customerEmail = null;
		Integer userId = null;

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
				customerPhone = ((User) principal).getPhone();
				customerName = ((User) principal).getName();
				customerAddress = ((User) principal).getAddress();
				customerEmail = ((User) principal).getEmail();
				userId = ((User) principal).getId();

				model.addAttribute("customerName", ((User) principal).getName());
				model.addAttribute("customerAddress", ((User) principal).getAddress());
				model.addAttribute("customerPhone", ((User) principal).getPhone());
				model.addAttribute("customerEmail", ((User) principal).getEmail());
				model.addAttribute("userId", ((User) principal).getId());
			} else {

				customerPhone = request.getParameter("customerPhone");
				customerAddress = request.getParameter("customerAddress");
				customerName = request.getParameter("customerName");
				customerEmail = request.getParameter("customerEmail");

				model.addAttribute("customerName", request.getParameter("customerName"));
				model.addAttribute("customerAddress", request.getParameter("customerAddress"));
				model.addAttribute("customerPhone", request.getParameter("customerPhone"));
				model.addAttribute("customerEmail", request.getParameter("customerEmail"));
			}
		}

		SaleOrder saleOrder = new SaleOrder();
		Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
		List<CartItem> cartItems = cart.getCartItems();

		BigDecimal sum = new BigDecimal(0);
		String sumVN = null;
		for (CartItem item : cartItems) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productRepo.getOne(item.getProductId()));
			saleOrderProducts.setQuantity(item.getQuantity());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
			for (int i = 1; i <= item.getQuantity(); i++) {
				sum = sum.add(saleOrderProducts.getProduct().getPrice());
			}
			Locale locale = new Locale("vi", "VN");
			NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
			sumVN = fmt.format(sum);
		}
		model.addAttribute("quantityCart", cartItems.size());
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("sumVN", sumVN);
		saleOrderService.saveOrderProduct(customerAddress, customerName, customerPhone, customerEmail, userId, httpSession);
		return "users/thankyou";
	}

	@RequestMapping(value = { "/cart/thankyouPayPal" }, method = RequestMethod.POST)
	public String thankyouPayPal(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession httpSession = request.getSession();
		String customerName = null;
		String customerAddress = null;
		String customerPhone = null;
		String customerEmail = null;
		Integer userId = null;

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
				customerPhone = ((User) principal).getPhone();
				customerName = ((User) principal).getName();
				customerAddress = ((User) principal).getAddress();
				customerEmail = ((User) principal).getEmail();
				userId = ((User) principal).getId();

				model.addAttribute("customerName", ((User) principal).getName());
				model.addAttribute("customerAddress", ((User) principal).getAddress());
				model.addAttribute("customerPhone", ((User) principal).getPhone());
				model.addAttribute("customerEmail", ((User) principal).getEmail());
				model.addAttribute("userId", ((User) principal).getId());
			} else {

				customerPhone = request.getParameter("customerPhone");
				customerAddress = request.getParameter("customerAddress");
				customerName = request.getParameter("customerName");
				customerEmail = request.getParameter("customerEmail");

				model.addAttribute("customerName", request.getParameter("customerName"));
				model.addAttribute("customerAddress", request.getParameter("customerAddress"));
				model.addAttribute("customerPhone", request.getParameter("customerPhone"));
				model.addAttribute("customerEmail", request.getParameter("customerEmail"));
			}
		}

		SaleOrder saleOrder = new SaleOrder();
		Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
		List<CartItem> cartItems = cart.getCartItems();

		BigDecimal sum = new BigDecimal(0);
		String sumVN = null;
		for (CartItem item : cartItems) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productRepo.getOne(item.getProductId()));
			saleOrderProducts.setQuantity(item.getQuantity());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
			for (int i = 1; i <= item.getQuantity(); i++) {
				sum = sum.add(saleOrderProducts.getProduct().getPrice());
			}
			Locale locale = new Locale("vi", "VN");
			NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
			sumVN = fmt.format(sum);
		}
		model.addAttribute("quantityCart", cartItems.size());
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("sumVN", sumVN);
		saleOrderService.saveOrderProductPayPal(customerAddress, customerName, customerPhone, customerEmail, userId, httpSession);
		return "users/thankyouPayPal";
	}

	
	@RequestMapping(value = { "/cart/check-out" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		HttpSession httpSession = request.getSession();
		SaleOrder saleOrder = new SaleOrder();
		Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
		List<CartItem> cartItems = cart.getCartItems();

		BigDecimal sum = new BigDecimal(0);
		String sumVN = null;
		for (CartItem item : cartItems) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productRepo.getOne(item.getProductId()));
			saleOrderProducts.setQuantity(item.getQuantity());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
			for (int i = 1; i <= item.getQuantity(); i++) {
				sum = sum.add(saleOrderProducts.getProduct().getPrice());
			}
		}
		model.addAttribute("TOTAL", sum);
		return "users/checkout";
	}

	@RequestMapping(value = {
			"/cart/check-out/delete-product-cart-with-ajax/{productId}" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> subscribe(@RequestBody CartItem data, @PathVariable("productId") int productId,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		HttpSession httpSession = request.getSession();
		Cart cart = null;
		if (httpSession.getAttribute("GIO_HANG") != null) {
			cart = (Cart) httpSession.getAttribute("GIO_HANG");
		} else {
			cart = new Cart();
			httpSession.setAttribute("GIO_HANG", cart);
		}

		List<CartItem> cartItems = cart.getCartItems();

		for (int a = 0; a < cartItems.size(); a++) {
			if (cartItems.get(a).getProductId() == productId) {
				cartItems.remove(a);
			}
		}

		return ResponseEntity.ok(new AjaxResponse(200, "Success"));
	}
	
	@RequestMapping(value = "/cart/check-out/update", method = RequestMethod.POST)
	public String update(@RequestParam("quantities") int[] quantities, HttpSession httpSession) {
		Cart cart = null;
		if(httpSession.getAttribute("GIO_HANG") != null) {
			cart = (Cart) httpSession.getAttribute("GIO_HANG");
			List<CartItem> cartItems = cart.getCartItems();
			for(int i = 0; i < cartItems.size(); i++) {
				cartItems.get(i).setQuantity(quantities[i]);
			}
			httpSession.setAttribute("GIO_HANG", cart);
		}
	
		return "redirect:/cart/check-out";	
	}

	@RequestMapping(value = { "/cart/mua-hang" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> muaHang(@RequestBody CartItem data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) throws IOException {
		HttpSession httpSession = request.getSession();

		Cart cart = null;

		if (httpSession.getAttribute("GIO_HANG") != null) {
			cart = (Cart) httpSession.getAttribute("GIO_HANG");
		} else {
			cart = new Cart();
			httpSession.setAttribute("GIO_HANG", cart);
		}

		List<CartItem> cartItems = cart.getCartItems();
		boolean isExists = false;
		int quantity = 0;
		for (CartItem item : cartItems) {
			if (item.getProductId() == data.getProductId()) {
				isExists = true;
				item.setQuantity(item.getQuantity() + data.getQuantity());
			}
		}
		if (!isExists) {

			Product product = productRepo.getOne(data.getProductId());
			data.setProductName(product.getTitle());
			data.setUnitPrice(product.getPrice());
			cart.getCartItems().add(data);
		}
		for (CartItem item : cartItems) {
			quantity += item.getQuantity();
		}

		httpSession.setAttribute("SL_SP_GIO_HANG", quantity);

		return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(quantity)));
	}

}
