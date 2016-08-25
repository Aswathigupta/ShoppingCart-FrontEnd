package com.niit.testproject.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.User;




@Controller
public class TestController {

	Logger log = LoggerFactory.getLogger(TestController.class);

	@Autowired
	UserDAO userDAO;

	@Autowired
	User user;
	
	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	Category category;

	@RequestMapping("/")
	public ModelAndView load(HttpSession session) {
		ModelAndView mv = new ModelAndView("/test");
		log.debug("Starting of the method onLoad");
		session.setAttribute("category", category);
		session.setAttribute("categoryList", categoryDAO.list());
		log.debug("Ending of the method onLoad");
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
		log.debug("Starting of the method signin");
		mv.addObject("user", user);
		mv.addObject("isregister", "true");
		log.debug("Ending of the method signin");
		return mv;
	}

	@RequestMapping(value = "here/home", method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute User user) {
		log.debug("Starting of the method register");
		userDAO.saveOrUpdate(user);
		ModelAndView mv = new ModelAndView("/test");
		mv.addObject("successMessage", "You are successfully register");
		log.debug("Ending of the method register");
		return mv;
	}

}
