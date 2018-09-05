package com.project.closet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/closet/")
public class ClosetController {

	@RequestMapping("myCloset")
	public String myCloset() {
		return "closet/myCloset";
	}
	
	@RequestMapping("closetShop")
	public String closetShop() {
		return "closet/closetShop";
	}
	
}
