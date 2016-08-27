package com.niit.testproject.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;
import org.springframework.webflow.execution.RequestContext;

import com.niit.shoppingcart.model.User;

import ch.qos.logback.core.net.SyslogOutputStream;

@Component
public class registrationHandler {

	public User getInstance() {
		return new User();
	}


	
	public String validateCredentials(User user,MessageContext messageContext){
		String status = "success";
		if (user.getId().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("id").defaultText("ID cannot be Empty").build());
			status = "failure";
		}
		if (user.getName().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("name").defaultText("Name cannot be Empty").build());
			status = "failure";
		}
		if (user.getPassword().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("password").defaultText("password cannot be Empty").build());
			status = "failure";
		}
		if (user.getEmailID().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("EmailID").defaultText("EmailID cannot be Empty").build());
			status = "failure";
		}
		if (user.getAddress().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("address").defaultText("address cannot be Empty").build());
			status = "failure";
		}
		if (user.getContactNumber().isEmpty()) {
			messageContext.addMessage(new MessageBuilder().error().source("contactnumber").defaultText("contactnumber cannot be Empty").build());
			status = "failure";
		}

//if(status.equals("success"))
//{
//	UserDAO userDAO = new UserDAO();
//	userDAO.saveOrUpdate(user);
//}

		return status;
		
	}
	
	public void addUser(RequestContext context, User user){
	    HttpSession session = ((HttpServletRequest)context.getExternalContext().getNativeRequest()).getSession();
	              session.setAttribute("user",user);
	       }
}
