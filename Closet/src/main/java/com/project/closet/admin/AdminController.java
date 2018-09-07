package com.project.closet.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.closet.dto.UserDto;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	AdminService adminService;

	@RequestMapping("enter")
	public String admin() {
		return "admin/enter";
	}
	
	@RequestMapping(value = "adminLogin.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody List<Object> userIdChk(@ModelAttribute AdminDto dto, HttpSession session) throws Exception {
		
		List<Object> ajaxList = adminService.adminLogin(dto);
		System.out.println(this.toString() + " - " + ajaxList);
		return ajaxList;
	}
	
	@RequestMapping("adminAccess.do")
	public ModelAndView adAccess(@ModelAttribute AdminDto dto) {
		ModelAndView mav = new ModelAndView();
		if(!dto.getAccess().equals("Y")) {
			mav.setViewName("admin/enter");
			mav.addObject("msg", "비정상적인 접근입니다.");
		} else {
			mav.setViewName("admin/main");
			mav.addObject("msg", "안녕하세요, 관리자님.");
		}
		return mav;
	}
	
	@RequestMapping("adminHome")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/main");
		return mav;
	}
	
	@RequestMapping("general")
	public ModelAndView general() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/general");
		return mav;
	}
	
	@RequestMapping("contract")
	public ModelAndView contract() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/contract");
		return mav;
	}
	
	@RequestMapping("content")
	public ModelAndView content() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/content");
		return mav;
	}
	@RequestMapping("client")
	public ModelAndView client() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/client");
		return mav;
	}

	@RequestMapping(value = "companyInfo.json", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody List<Object> companyInfo(@ModelAttribute AdminDto dto) throws Exception {
		List<Object> ajaxList = adminService.companyInfo(dto);
		System.out.println(this.toString() + " - " + ajaxList);
		return ajaxList;
	}
}
