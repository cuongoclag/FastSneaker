package com.devpro.controller.users;

import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.entities.AjaxResponse;
import com.devpro.entities.Contact;
import com.devpro.entities.User;
import com.devpro.services.UserService;
@Controller
public class SignupController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	private MailSender mailSender;
	
	@RequestMapping(value = { "/signup" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("user", new User());
		return "login";
	}
	@RequestMapping(value = { "/save-guestUser" }, method = RequestMethod.POST)
	public String saveGuestUser(@ModelAttribute("user") User user,
			final ModelMap model, final HttpServletRequest request, 
			final HttpServletResponse response, @RequestParam(name = "email") String email,
			final HttpSession session) throws Exception{
		String code = request.getParameter("code");
		String codeVerify = (String) session.getAttribute("codeVerify");
		if (!code.equals(codeVerify)) {
			request.setAttribute("error", "Invalid code, please try again!");
			return "login";
		} else {
			if(userService.findUserByEmail(email) == null) {
				model.addAttribute("user", new User());
				userService.saveGuestUser(user);
				return "redirect:/";
			} else {
				user = userService.findUserByEmail(email);
				request.setAttribute("error", "The email address is already exist!");
				return "login";
			}
		}
	}
	
	public void sendEmail(String from, String to, String subject, String content) {
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom(from);
		mailMessage.setTo(to);
		mailMessage.setSubject(subject);
		mailMessage.setText(content);

		mailSender.send(mailMessage);
	}
	
	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	static SecureRandom rnd = new SecureRandom();

	String randomString(int len){
	   StringBuilder sb = new StringBuilder(len);
	   for(int i = 0; i < len; i++)
	      sb.append(AB.charAt(rnd.nextInt(AB.length())));
	   return sb.toString();
	}
	
	@PostMapping(value = "/send-code")
	public String sendCode(@RequestParam(name = "email") String email, 
			final HttpServletRequest request, 
			final HttpSession session,
			@ModelAttribute("user") User user) {
		String code = randomString(8);
		email = request.getParameter("email");
		if(userService.findUserByEmail(email) != null) {
			user = userService.findUserByEmail(email);
			request.setAttribute("error", "The email address is already exist!");
			return "login";
		}
		sendEmail("fastsneakercompany@gmail.com", email, "Welcome to FastSneaker!",
				"Hello, " + email.split("@")[0] + "! Please confirm that you can login in FastSneaker!" + " Your confirmation code is: " + code);
		session.setAttribute("codeVerify", code);
		request.setAttribute("success", "Check your mail to get code");
		return "redirect:/signup";
	}

}
