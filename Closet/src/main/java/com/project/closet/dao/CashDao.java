package com.project.closet.dao;

import java.util.HashMap;

import com.project.closet.dto.CashDto;

public interface CashDao {
	public HashMap<String, Object> charge(CashDto dto);
}