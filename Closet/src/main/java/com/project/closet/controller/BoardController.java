package com.project.closet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.closet.service.BoardService;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/board/list")
	public String list(Model model) {
		
		BoardService dao = sqlSession.getMapper(BoardService.class);
		model.addAttribute("list", dao.list());
		
		return "board/list";
	}
	
	@RequestMapping("/board/write")
	public String write(HttpServletRequest request, Model model) {
		BoardService dao = sqlSession.getMapper(BoardService.class);
		dao.write(request.getParameter("title"), request.getParameter("content"));
		return "redirect:list";
	}
	
	@RequestMapping("/board/view")
	public String view(Model model) {
		return "board/view";
	}
	
	@RequestMapping("/board/edit")
	public String edit(Model model) {
		return "board/edit";
	}
	
}
