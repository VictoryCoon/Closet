package com.project.closet.service;

import java.util.ArrayList;

import com.project.closet.dto.BoardDto;

public interface BoardService {

	public ArrayList<BoardDto> list();
	public void write(String title, String content);
	public void update(String writer, String title, String content);
	public void delete(String bId);
	
}
	