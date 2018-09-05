package com.project.closet.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;
	
	@Override
	public boolean adminIn(AdminDto dto, HttpSession session) {
		boolean result = adminDao.adminIn(dto);
		if(result) {
			AdminDto sDto = AdminInfo(dto);
			session.setAttribute("userId", sDto.getUserId());
			session.setAttribute("userPw", sDto.getUserPw());
		}
		return result;
	}

	@Override
	public AdminDto AdminInfo(AdminDto dto) {
		return adminDao.AdminInfo(dto);
	}

	@Override
	public void logOut(HttpSession session) {
		session.invalidate();
	}
}
