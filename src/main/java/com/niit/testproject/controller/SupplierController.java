package com.niit.testproject.controller;

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

import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Supplier;

@Controller
public class SupplierController {
	
	Logger log = LoggerFactory.getLogger(SupplierController.class);
	
	@Autowired
	private SupplierDAO supplierDAO;

	@Autowired
	private Supplier supplier;

	@RequestMapping(value = "/suppliers", method = RequestMethod.GET)

	public String listSuppliers(Model model) {
		log.debug("Starting of the method listsuppliers");
		model.addAttribute("isAdminClickedSuppliers", "true");
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", this.supplierDAO.list());
		log.debug("Ending of the method listsuppliers");
		return "test";
	}

	@RequestMapping(value = "/supplier/add", method = RequestMethod.POST)
		
		public String addSupplier(@ModelAttribute("supplier") Supplier supplier) 
		{
			supplierDAO.saveOrUpdate(supplier);
			return "redirect:/suppliers";
		}

	@RequestMapping(value = "/supplier/remove/{id}")
		public String deleteSupplier(@PathVariable("id") String id, ModelMap model) {
		log.debug("Starting of the method onLoad");
		try {
			supplierDAO.delete(id);
			model.addAttribute("message","Successfully Added");
		} catch (Exception e) {
			model.addAttribute("message",e.getMessage());
			e.printStackTrace();
		}
		log.debug("Ending of the method onLoad");
		return "redirect:/suppliers";
	}
	
	@RequestMapping(value = "/supplier/edit/{id}")
	public String editSupplier(@PathVariable("id") String id, Model model) {
	supplier= supplierDAO.get(id);
	log.debug("Starting of the method editsuplier");
	model.addAttribute("supplier", supplier);
	model.addAttribute("supplierList", supplierDAO.list());
	log.debug("Ending of the method editsupplier");
	return "redirect:/suppliers";
	}
	
	


}
