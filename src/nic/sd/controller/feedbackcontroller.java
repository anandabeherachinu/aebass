package nic.sd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import nic.sd.dao.feedbackdao;
import nic.sd.model.feedbackmodel;
import nic.sd.utility.ConnectionDB;

@Controller
public class feedbackcontroller {
	
	@Autowired
	feedbackdao fdao;
	
	ConnectionDB con =new ConnectionDB();
	
	@RequestMapping(value="/feedback.html",method = RequestMethod.GET)
	public String homePag(@ModelAttribute("cb") feedbackmodel fd,Model model, HttpServletRequest request,
			HttpSession session) 
	
	{
		System.out.println("GET");
		System.out.println("GET"+fd.getName());
		int insertfeedbacks = fdao.insertFeedback(fd);
		
		return"index";	
	}
	@RequestMapping(value="/feedback.html",method = RequestMethod.POST)
	public String homePage(@ModelAttribute("cb") feedbackmodel fd,Model model, HttpServletRequest request,
			HttpSession session) 
	
	{
		// System.out.println("POST");
		
		System.out.println("POST"+fd.getName());
		int insertfeedbacks = fdao.insertFeedback(fd);
	
		return"index";		//System.out.println("GET");
	
	}
	

}