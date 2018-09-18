package com.project.closet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.closet.dto.CashDto;
import com.project.closet.service.CashService;

@Controller
@RequestMapping("/cash/")
public class CashController {

	@Autowired
	CashService cashService;
	
	@RequestMapping("charge")
	public String policy(Model model) {
		return "cash/charge";
	}
	
	@RequestMapping(value = "test.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody List<Object> testList(@ModelAttribute HttpServletRequest request, HttpSession session) throws Exception{
		
		String userId = (String) request.getAttribute("userId");
		
		System.out.println("Request Test : "+ userId);
		
		//List<Object> ajaxList = cashService.testService(dto);
		//System.out.println(this.toString() + " - " + ajaxList);
		//return ajaxList;
		return null;
	}
	
	@RequestMapping(value = "tryCharge.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody JSONObject tryCharge(@ModelAttribute CashDto dto, HttpSession session) throws Exception{
		JSONObject tryResult = cashService.charge(dto);
		return tryResult;
	}
}
