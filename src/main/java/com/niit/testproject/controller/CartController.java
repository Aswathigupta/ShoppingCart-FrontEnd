package com.niit.testproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.Product;

@Controller
public class CartController {

	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private Cart cart;
	
	
	@RequestMapping(value = "/myCart", method = RequestMethod.GET)
	public String myCart(Model model,HttpSession session) {
		
		model.addAttribute("cart",cart);
		String loggedInUserid = (String) session.getAttribute("loggedInUserid");
		System.out.println("user ID=" + loggedInUserid);
		session.setAttribute("cartList",cartDAO.list(loggedInUserid));
		model.addAttribute("totalAmount", cartDAO.getTotalAmount("loggedInUserid")); // Just to test, password user
		model.addAttribute("isdisplayCart", "true");
		
		return "/test";
	}
	
	
//	@RequestMapping(value = "/carts", method = RequestMethod.GET)
//	public String listCarts(Model model) {
//		model.addAttribute("cart", new Cart());
//		model.addAttribute("cartList", this.cartDAO.list(loggedInUserid));
//		return "cart";
//	}
	
	//For add and update cart both
    @RequestMapping(value= "/myCart/add/{id}", method = RequestMethod.GET)
	public String addToCart(@PathVariable("id") String id,HttpSession session){
		
  
    	System.out.println("\n*****\n"+ "product id :" + id + "\n*****\n"  );
	
	 Product product =	 productDAO.get(id);
	 Cart cart = new Cart();
//	 cart.setId("01");
	 cart.setPrice(product.getPrice());
	 cart.setProduct(productDAO.get(id));
	 cart.setQuantity(1);
	 String loggedInUserid = (String) session.getAttribute("loggedInUserid");

     cart.setUser(userDAO.get(loggedInUserid));  //  id should keep session and use the same id
	 cart.setStatus('N');  // 
		cartDAO.saveOrUpdate(cart);
		session.setAttribute("cartSize", cartDAO.list(loggedInUserid).size());

		//return "redirect:/views/home.jsp";
		return "redirect:/";
		
	}
	
	@RequestMapping("/myCart/remove/{id}")
    public String removeCart(@PathVariable("id") String id,ModelMap model,HttpSession session) throws Exception{
		
       try {
		cartDAO.delete(id);
		model.addAttribute("message","Successfully removed");
	} catch (Exception e) {
		model.addAttribute("message",e.getMessage());
		e.printStackTrace();
	}
       String loggedInUserid = (String) session.getAttribute("loggedInUserid");
       session.setAttribute("cartSize", cartDAO.list(loggedInUserid).size());
       //redirectAttrs.addFlashAttribute(arg0, arg1)
        return "redirect:/myCart";
    }
// 
//    @RequestMapping("cart/edit/{id}")
//    public String editCart(@PathVariable("id") String id, Model model){
//    	System.out.println("editCart");
//        model.addAttribute("cart", this.cartDAO.get(id));
//        model.addAttribute("listCarts", this.cartDAO.list());
//        return "cart";
//    }

}
