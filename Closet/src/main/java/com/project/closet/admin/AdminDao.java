package com.project.closet.admin;

import java.util.List;

import com.project.closet.dto.UserDto;

public interface AdminDao {

	boolean adminIn(AdminDto dto);
	AdminDto AdminInfo(AdminDto dto);
	List<AdminDto> adminList(AdminDto dto);
	List<AdminDto> companyInfo(AdminDto dto);

}
