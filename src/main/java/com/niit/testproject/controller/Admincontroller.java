package com.niit.testproject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;

@Controller
public class Admincontroller {
	
	Logger log = LoggerFactory.getLogger(Admincontroller.class);
	
	@Autowired
	private Category category;

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Supplier supplier;
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	@Autowired
	private Product product;
	
	@Autowired
	private ProductDAO productDAO;
	
	

	@RequestMapping("/manageCategories")
	public ModelAndView categories() {
		ModelAndView mv = new ModelAndView("/test");
		log.debug("Starting of the method categories");
		mv.addObject("category", category);
		mv.addObject("isAdminClickedCategories", "true");
		mv.addObject("categoryList", categoryDAO.list());
		log.debug("Ending of the method categories");
		return mv;
	}
	
	@RequestMapping("/manageSuppliers")
	public ModelAndView suppliers() {
		ModelAndView mv = new ModelAndView("/test");
		log.debug("Starting of the method suppliers");
		mv.addObject("supplier", supplier);
		mv.addObject("isAdminClickedSuppliers", "true");
		mv.addObject("supplierList", supplierDAO.list());
		log.debug("Ending of the method suppliers");
		return mv;
	}
	
	@RequestMapping("/manageProducts")
	public ModelAndView products() {
		ModelAndView mv = new ModelAndView("/test");
		log.debug("Starting of the method products");
		mv.addObject("product", product);
		mv.addObject("isAdminClickedProducts", "true");
		
//		mv.addObject("isAdminClickedProducts", "true");
//		mv.addObject("product", product);
//		model.addAttribute("category", new Category());
//		model.addAttribute("supplier", new Supplier());
		mv.addObject("productList", productDAO.list());
		mv.addObject("categoryList", categoryDAO.list());
		mv.addObject("supplierList", supplierDAO.list());
		log.debug("Ending of the method products");
		return mv;
	}

	
}
