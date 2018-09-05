package com.project.closet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomController {

	@RequestMapping("/custom/qnaList") 
	public String qnaList(){
		return "custom/qnaList";
	}
	
	@RequestMapping("/custom/faqList") 
	public String faqList(){
		return "custom/faqList";
	}
	
	@RequestMapping("/custom/question") 
	public String question(){
		return "custom/question";
	}
	
	@RequestMapping("/custom/answerList") 
	public String answerList(){
		return "custom/answerList";
	}
	
	@RequestMapping("/custom/answerView") 
	public String answerView(){
		return "custom/answerView";
	}
}
