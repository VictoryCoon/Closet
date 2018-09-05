package com.project.closet.service;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import com.project.closet.dto.UserDto;

public interface UserService {
	public UserDto viewUser(UserDto dto);
	public boolean signIn(UserDto dto, HttpSession session);
	public void signOut(HttpSession session);
	public HashMap<String, Object> signUp(UserDto dto);
	public boolean updatePassword(UserDto dto);
	public boolean updateMobile(UserDto dto, HttpSession session);
	public boolean updateSex(UserDto dto, HttpSession session);
	public boolean updateProfile(String uploadPath,String uploadImg,String uploadImgExt);
	public boolean userDrop(UserDto dto);
	public List<Object> testService(UserDto dto);
	public List<Object> userIdChk(UserDto dto);
}
