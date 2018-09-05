package com.project.closet.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	AdminService adminService;

	@RequestMapping("enter")
	public String admin() {
		return "admin/enter";
	}
	
	@RequestMapping("sessionExpried")
	public ModelAndView sessionExpried() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","세션이 만료되었습니다. 다시 로그인해주세요.");
		mav.setViewName("admin/enter");
		
		return mav;
	}
	
	@RequestMapping("logIn.do")
	public ModelAndView logIn(@ModelAttribute AdminDto dto, HttpSession session) {
		boolean result = adminService.adminIn(dto, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.addObject("msg","관리자님, 반갑습니다.");
			mav.setViewName("admin/main");
		} else {
			mav.addObject("msg","로그인에 실패하였습니다. 아이디 또는 비밀번호를 확인 해 주세요.");
			mav.setViewName("admin/enter");
		}
		return mav;
	}
	
	@RequestMapping("logOut.do")
	public ModelAndView logOut(HttpSession session) {
		adminService.logOut(session);
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","로그아웃 되었습니다.");
		mav.setViewName("admin/enter");

		return mav;
	}
}
