package com.project.closet.admin;

import javax.servlet.http.HttpSession;

public interface AdminService {

	boolean adminIn(AdminDto dto, HttpSession session);
	AdminDto AdminInfo(AdminDto dto);
	void logOut(HttpSession session);

}
