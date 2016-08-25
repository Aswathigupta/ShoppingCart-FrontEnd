//package com.niit.testproject.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.niit.shoppingcart.dao.UserDAO;
//import com.niit.shoppingcart.model.User;
//
//@Controller
//public class RegistrationController {
//
//	 @Autowired
//	 User user;
//	 
//	 @Autowired
//	 UserDAO userDAO;
//	 
//		@RequestMapping("test")
//		public String registerUser(@ModelAttribute User user){
//			System.out.println("register user");
//			userDAO.saveOrUpdate(user);
//			return "index";
//		}
//}
