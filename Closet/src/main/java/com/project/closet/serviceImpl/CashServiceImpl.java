package com.project.closet.serviceImpl;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.closet.dao.CashDao;
import com.project.closet.dto.CashDto;
import com.project.closet.service.CashService;

@Repository
public class CashServiceImpl implements CashService{

	@Autowired
	CashDao cashDao;

	@Override
	public JSONObject charge(CashDto dto) {
		HashMap<String, Object> returnMap = cashDao.charge(dto); 
		JSONObject ajaxMap = new JSONObject(returnMap);
		return ajaxMap;
	}
	
}
