package com.niit.testproject.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.testproject.util.Util;

@Controller
public class CategoryController {
	
	Logger log = LoggerFactory.getLogger(CategoryController.class);

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private Category category;

	@RequestMapping(value = "/categories", method = RequestMethod.GET)

	public String listCategories(Model model) {
		log.debug("Starting of the method listcategories");
		model.addAttribute("isAdminClickedCategories", "true");
		model.addAttribute("category", category);
		model.addAttribute("categoryList", this.categoryDAO.list());
		log.debug("Ending of the method listcategories");
		return "test";
	}

	@RequestMapping(value = "/category/add", method = RequestMethod.POST)
		
		public String addCategory(@ModelAttribute("category") Category category) 
		{
			String newID = Util.removeComma(category.getId());
			category.setId(newID);
			categoryDAO.saveOrUpdate(category);
			return "redirect:/categories";
		}

	@RequestMapping(value = "/category/remove/{id}")
		public String deleteCategory(@PathVariable("id") String id, ModelMap model) {
		try {
			categoryDAO.delete(id);
			model.addAttribute("message", "Successfully Added");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/categories";
	}
	
	
	@RequestMapping(value = "/category/edit/{id}")
	public String editCategory(@PathVariable("id") String id, Model model) {
	category= categoryDAO.get(id);
	log.debug("Ending of the method editcategory");
	model.addAttribute("category", category);
	model.addAttribute("categoryList", categoryDAO.list());
	log.debug("Ending of the method editcategory");
	return "redirect:/categories";
	}
	

}
