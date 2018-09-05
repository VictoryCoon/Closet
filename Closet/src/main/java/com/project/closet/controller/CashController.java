package com.project.closet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cash/")
public class CashController {

	@RequestMapping("charge")
	public String policy(Model model) {
		return "cash/charge";
	}
	
}
