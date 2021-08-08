package com.devpro.controller.users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.entities.User;
import com.devpro.repositories.RoleRepo;
import com.devpro.repositories.UserRepo;
import com.devpro.services.UserService;

@Controller
public class UserController extends BaseController{
	@Autowired
	public UserRepo userRepo;
	@Autowired
	public RoleRepo roleRepo;
	@Autowired
	UserService userService;
	
	@RequestMapping(value = { "/user/{id}"}, method = RequestMethod.GET)
	public String editUser(@PathVariable("id") int id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		model.addAttribute("role", roleRepo.findAll());
		model.addAttribute("user", userService.findUserById(id));
		return "users/UserEdit";
	}
	
	@RequestMapping(value = { "/user/save-user" }, method = RequestMethod.POST)
	public String saveUser(@RequestParam("images") MultipartFile[] images, @ModelAttribute("user") User user,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		userService.saveUser(images, user);

		return "users/UserEdit";
	}

}
