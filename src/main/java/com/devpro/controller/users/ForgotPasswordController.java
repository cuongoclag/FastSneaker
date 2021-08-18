package com.devpro.controller.users;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.devpro.common.Utilities;
import com.devpro.entities.User;
import com.devpro.services.UserService;
import com.ibm.icu.impl.Utility;

import net.bytebuddy.utility.RandomString;

@Controller
public class ForgotPasswordController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/forgot_password")
	public String showForgotPasswordForm(Model model) {
		model.addAttribute("pageTitle", "Forgot Passowrd");
		return "forgot_password_form";
	}
	
	@PostMapping("/forgot_password")
	public String processForgotPasswordForm(HttpServletRequest request, Model model) {
		String email = request.getParameter("email");
		String token =  RandomString.make(45);
		
		try {
			userService.updateResetPasswordToken(token, email);
			String reserPasswordLink = Utilities.getSiteURL(request) + "/reset_password?token=" + token;
			sendEmail(email, reserPasswordLink);
			model.addAttribute("message", "We have sent a reset password link to your email. Please check mail!");
			
		} catch (UsernameNotFoundException ex) {
			model.addAttribute("error", ex.getMessage());
		} catch (UnsupportedEncodingException | MessagingException e) {
			model.addAttribute("error", "Error while sending email.");
		}

		return "forgot_password_form";
	}

	private void sendEmail(String email, String reserPasswordLink) throws UnsupportedEncodingException, MessagingException{
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom("fastsneakercompany@gmail.com","Fast Sneaker Support");
		helper.setTo(email);
		
		String subject = "Here's the link to reset your password";
		String content = "<p>Hello, </p>" 
				+ "<p>You have requested to reset your password.</p>"
				+ "<p>Click the link below to change your password:</p>"
				+ "<p><b><a href=\"" + reserPasswordLink + "\">Change my password</a></b></p>"
				+ "<p>Ignore this email if you do remember your password, or you have not made the request.</p>";
		
		helper.setSubject(subject);
		helper.setText(content, true);
		
		mailSender.send(message);
	}
	
	@GetMapping("/reset_password")
	public String showResetPasswordForm(@Param(value = "token") String token, Model model) {
		User user = userService.get(token);
		if(user == null) {
			model.addAttribute("title", "Rest your password");
			model.addAttribute("message", "Invalid Token");
			return "message";
		}
		model.addAttribute("token", token);
		model.addAttribute("pageTitle", "Reset Your Passowrd");
		return "reset_password_form";
	}
	
	@PostMapping("/reset_password")
	public String processResetPassword(HttpServletRequest request, Model model) {
		String token = request.getParameter("token");
		String password = request.getParameter("password");
		
		User user = userService.get(token);
		if(user == null) {
			model.addAttribute("title", "Rest your password");
			model.addAttribute("message", "Invalid Token");
		} else {
			userService.updatePassword(user, password);
			model.addAttribute("message", "You have successfully changed your password.");
		};
		return "message";
	}
}
