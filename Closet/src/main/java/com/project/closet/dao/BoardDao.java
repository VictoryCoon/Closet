package com.project.closet.dao;

import java.util.ArrayList;

import com.project.closet.dto.BoardDto;
import com.project.closet.service.BoardService;

public class BoardDao implements BoardService{
	
	public BoardDao() { }

	@Override
	public ArrayList<BoardDto> list() { return null; }

	@Override
	public void write(String title, String content) { }

	@Override
	public void update(String writer, String title, String content) { }

	@Override
	public void delete(String bId) { }

}
