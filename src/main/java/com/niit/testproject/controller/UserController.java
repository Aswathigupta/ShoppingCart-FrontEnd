package com.niit.testproject.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.User;

import com.niit.shoppingcart.model.UserDetails;

@Controller
public class UserController {
	
    Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	User user;
	@Autowired
	UserDAO userDAO;
	@Autowired
	Category category;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	Cart cart;
	@Autowired
	CartDAO cartDAO;
//	@Autowired
//	UserDetails userDetails;
	
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(value = "name") String userID,
			@RequestParam(value = "password") String password, HttpSession session) {
		log.debug("Starting of the method login");
		log.info("userID is {}  password is {}", userID, password);

	
		ModelAndView mv = new ModelAndView("test");
		boolean isValidUser = userDAO.isValidUser(userID, password);

		System.out.println();
		if (isValidUser == true) {
			user = userDAO.get(userID);
			session.setAttribute("loggedInUser", user.getName());
			session.setAttribute("loggedInUserid", userID);
			System.out.println("User Logged in successfully !");
			if (user.isAdmin() == true) {
				mv.addObject("isAdmin", "true");
				System.out.println("Welcome Admin!");

			} else {
				if(cartDAO.getByUserId(userID)!=null){
				mv.addObject("isAdmin", "false");
				cart = cartDAO.getByUserId(userID);
				log.info("\n******\ncartID is {}\n******\n ", cart.getId());
				
				mv.addObject("cart", cart);
				log.info("\n******\ncartID is {}\n******\n ", cart.getId());

				List<Cart> cartList = cartDAO.list(userID);
				mv.addObject("cartList", cartList);
//				mv.addObject("cartSize", cartList.size());
				
				session.setAttribute("cartSize", cartList.size());
				}
			}

		} else {
            
			System.out.println("Invalid user !");
			mv.addObject("invalidCredentials", "true");
			mv.addObject("errorMessage", "Invalid Credentials");
			

		}
		log.debug("Ending of the method login");
		return mv;
	}
	

	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("/test");
		log.debug("Starting of the method logout");
		session.invalidate();
		session = request.getSession(true);
		session.setAttribute("category", category);
		session.setAttribute("categoryList", categoryDAO.list());
	
		System.out.println("successfully logged out");
		mv.addObject("logoutMessage", "You successfully logged out");
		mv.addObject("loggedOut", "true");
		log.debug("Ending of the method logout");

		return mv;
	 }

}
