package com.project.closet.service;

import java.util.HashMap;

import org.json.simple.JSONObject;

import com.project.closet.dto.CashDto;

public interface CashService {
	public JSONObject charge(CashDto dto);
}
