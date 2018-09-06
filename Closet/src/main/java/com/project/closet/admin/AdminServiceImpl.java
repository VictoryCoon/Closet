package com.project.closet.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;

	@Override
	public AdminDto AdminInfo(AdminDto dto) {
		return adminDao.AdminInfo(dto);
	}

	@Override
	public void logOut(HttpSession session) {
		session.invalidate();
	}

	@Override
	public List<Object> adminLogin(AdminDto dto) {
		List<AdminDto> execlist = adminDao.adminList(dto);
		HashMap<String, Object> listSet = new HashMap<String, Object>();
		List<Object> ajaxList = new ArrayList<Object>();
		
		for(int i = 0; i <execlist.size(); i++) {
			listSet.put("cnt", execlist.get(i).getCnt());
			listSet.put("adminId", execlist.get(i).getAdminId());
			listSet.put("adminPw", execlist.get(i).getAdminPw());
			listSet.put("access", execlist.get(i).getAccess());
			JSONObject json = new JSONObject(listSet);
			ajaxList.add(json);
		}
		return ajaxList;
	}

	@Override
	public List<Object> companyInfo(AdminDto dto) {
		List<AdminDto> execlist = adminDao.companyInfo(dto);
		HashMap<String, Object> listSet = new HashMap<String, Object>();
		List<Object> ajaxList = new ArrayList<Object>();
		for(int i = 0; i <execlist.size(); i++) {
			listSet.put("adminId", execlist.get(i).getAdminId());
			listSet.put("adminPw", execlist.get(i).getAdminPw());
			listSet.put("access", execlist.get(i).getAccess());
			listSet.put("cnt", execlist.get(i).getCnt());
			JSONObject json = new JSONObject(listSet);
			ajaxList.add(json);
		}
		return ajaxList;
	}
}
