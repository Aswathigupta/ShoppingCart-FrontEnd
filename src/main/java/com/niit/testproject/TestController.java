package com.niit.testproject;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.User;

@Controller
public class TestController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	User user;

	@RequestMapping("/")
	public ModelAndView load() {
		ModelAndView mv = new ModelAndView("/test");
		return mv;
	}

	@RequestMapping("/home")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("/test");

		mv.addObject("ishome", "true");
		return mv;
	}

	@RequestMapping("/register")
	public ModelAndView signin()

	{
		ModelAndView mv = new ModelAndView("/test");
		mv.addObject("user", user);
		mv.addObject("isregister", "true");

		return mv;
	}

	@RequestMapping(value = "here/home", method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute User user) {
		userDAO.saveOrUpdate(user);
		ModelAndView mv = new ModelAndView("/test");
		mv.addObject("successMessage", "You are successfully register");

		return mv;
	}

}
