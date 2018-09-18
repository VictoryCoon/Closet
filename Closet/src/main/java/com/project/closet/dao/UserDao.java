package com.project.closet.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.closet.dto.UserDto;

public interface UserDao {
	public UserDto viewUser(UserDto dto);
	public HashMap<String, Object> signUp(UserDto dto);
	public boolean signIn(UserDto dto);
	public void signOut(HttpSession session);
	public boolean updatePassword(UserDto dto);
	public boolean updateMobile(UserDto dto);
	public boolean updateSex(UserDto dto);
	public boolean userDrop(UserDto dto);
	public List<UserDto> testList(UserDto dto);
	public List<UserDto> userIdChk(UserDto dto);
	public HashMap<String, Object> showPhoto(UserDto dto);
	public boolean updateProfile(String uploadPath, String userId);
}
