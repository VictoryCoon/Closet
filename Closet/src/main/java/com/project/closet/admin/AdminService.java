package com.project.closet.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface AdminService {

	AdminDto AdminInfo(AdminDto dto);
	void logOut(HttpSession session);
	List<Object> adminLogin(AdminDto dto);
	List<Object> companyInfo(AdminDto dto);
}
