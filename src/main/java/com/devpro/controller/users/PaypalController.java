package com.devpro.controller.users;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.devpro.entities.Cart;
import com.devpro.entities.CartItem;
import com.devpro.entities.PayPal;
import com.devpro.entities.SaleOrder;
import com.devpro.entities.SaleOrderProducts;
import com.devpro.entities.User;
import com.devpro.repositories.ProductRepo;
import com.devpro.repositories.SaleOrderRepo;
import com.devpro.services.PaypalService;
import com.devpro.services.ProductService;
import com.devpro.services.SaleOrderService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

@Controller
public class PaypalController {
	@Autowired
	ProductRepo productRepo;
	@Autowired
	SaleOrderRepo saleOrderRepo;
	@Autowired
	ProductService productService;
	@Autowired
	SaleOrderService saleOrderService;

	@Autowired
	PaypalService service;

	public static final String SUCCESS_URL = "pay/success";
	public static final String CANCEL_URL = "pay/cancel";

	@GetMapping("/paypal")
	public String home() {
		return "paypal";
	}

	@PostMapping("/pay")
	public String payment(@ModelAttribute("paypal") PayPal order) {
		try {
			Payment payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
					order.getIntent(), order.getDescription(), "http://localhost:8888/" + CANCEL_URL,
					"http://localhost:8888/" + SUCCESS_URL);
			for(Links link:payment.getLinks()) {
				if(link.getRel().equals("approval_url")) {
					return "redirect:"+link.getHref();
				}
			}
			
		} catch (PayPalRESTException e) {
		
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	 @GetMapping(value = CANCEL_URL)
	    public String cancelPay() {
	        return "cancel";
	    }

	    @GetMapping(value = SUCCESS_URL)
	    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
	        try {
	            Payment payment = service.executePayment(paymentId, payerId);
	            System.out.println(payment.toJSON());
	            if (payment.getState().equals("approved")) {
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
	                return "success";
	            }
	        } catch (PayPalRESTException e) {
	         System.out.println(e.getMessage());
	        }
	        return "redirect:/";
	    }

}