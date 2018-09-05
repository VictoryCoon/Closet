package com.project.closet.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.project.closet.dao.UserDao;
import com.project.closet.dto.UserDto;
import com.project.closet.service.UserService;

@Repository
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public HashMap<String, Object> signUp(UserDto dto) {
		HashMap<String, Object> returnMap = userDao.signUp(dto);
		return returnMap;
	}
	
	@Override
	public boolean signIn(UserDto dto, HttpSession session) {
		
		boolean result = userDao.signIn(dto);
		if(result) {
			UserDto sDto = viewUser(dto);
			session.setAttribute("userId", sDto.getUserId());
			session.setAttribute("userName", sDto.getUserName());
			session.setAttribute("sex", sDto.getSex());
			session.setAttribute("regDate", sDto.getRegDate());
			session.setAttribute("birthday", sDto.getBirthday());
			session.setAttribute("userPw", sDto.getUserPw());
			session.setAttribute("mobile", sDto.getMobile());
			session.setAttribute("address", sDto.getAddress());
			session.setAttribute("point", sDto.getPoint());
			session.setAttribute("cash", sDto.getCash());
			session.setAttribute("cashAccAmt", sDto.getCashAccAmt());
			session.setAttribute("cashLastDate", sDto.getCashLastDate());
			session.setAttribute("bankCd", sDto.getBankCd());
			session.setAttribute("bankName", sDto.getBankName());
			session.setAttribute("closetCd", sDto.getClosetCd());
			session.setAttribute("closetName", sDto.getClosetName());
			session.setAttribute("profilePath",sDto.getProfilePath());
			session.setAttribute("profileImg",sDto.getProfileImg());
			session.setAttribute("profileImgExt",sDto.getProfileImgExt());
			session.setAttribute("length",sDto.getLength());
			session.setAttribute("weight",sDto.getWeight());
			session.setAttribute("head",sDto.getHead());
			session.setAttribute("neck",sDto.getNeck());
			session.setAttribute("shoulder",sDto.getShoulder());
			session.setAttribute("waist",sDto.getWaist());
			session.setAttribute("thigh",sDto.getThigh());
			session.setAttribute("foot",sDto.getFoot());
			session.setAttribute("finger",sDto.getFinger());
			session.setAttribute("bust",sDto.getBust());
			session.setAttribute("hip",sDto.getHip());
		}
		return result;
	}

	@Override
	public void signOut(HttpSession session) {
		session.invalidate();
	}

	@Override
	public UserDto viewUser(UserDto dto) {
		return userDao.viewUser(dto);
	}

	@Override
	public boolean updatePassword(UserDto dto) {
		System.out.println("Service UpPasswd : " + dto.getUserPw());
		boolean result = userDao.updatePassword(dto);
		return result;
	}

	@Override
	public boolean updateMobile(UserDto dto, HttpSession session) {
		System.out.println("Service UpMoblie : " + dto.getMobile());
		boolean result = userDao.updateMobile(dto);
		if(result) {
			UserDto sDto = viewUser(dto);
			session.setAttribute("mobile", sDto.getMobile());
		}
		return result;
	}

	@Override
	public boolean updateSex(UserDto dto, HttpSession session) {
		System.out.println("Service UpSex : " + dto.getSex());
		boolean result = userDao.updateSex(dto);
		if(result) {
			UserDto sDto = viewUser(dto);
			session.setAttribute("sex", sDto.getSex());
		}
		return result;
	}
	
	@Override
	public boolean userDrop(UserDto dto) {
		System.out.println("Service Drop User : " + dto.getUserPw());
		boolean result = userDao.userDrop(dto);
		
		return result;
	}

	@Override
	public boolean updateProfile(String uploadPath, String uploadImg, String uploadImgExt) {
		System.out.println("Service UpProfile : " + uploadPath + uploadImg + uploadImgExt);
		
		return false;
	}

	@Override
	public List<Object> userIdChk(UserDto dto) {
		List<UserDto> execlist = userDao.userIdChk(dto);
		HashMap<String, Object> listSet = new HashMap<String, Object>();
		List<Object> ajaxList = new ArrayList<Object>();
		
		for(int i = 0; i <execlist.size(); i++) {
			listSet.put("cnt", execlist.get(i).getCnt());
			JSONObject json = new JSONObject(listSet);
			ajaxList.add(json);
		}
		return ajaxList;
	}
	
	@Override
	public List<Object> testService(UserDto dto) {
		
		List<UserDto> execlist = userDao.testList(dto);
		HashMap<String, Object> listSet = new HashMap<String, Object>();
		List<Object> ajaxList = new ArrayList<Object>();
		
		for(int i = 0; i <execlist.size(); i++) {
			listSet.put("userKind", execlist.get(i).getUserKind());
			listSet.put("userName", execlist.get(i).getUserName());
			listSet.put("userId", execlist.get(i).getUserId());
			listSet.put("userPw", execlist.get(i).getUserPw());
			listSet.put("sex", execlist.get(i).getSex());
			listSet.put("regDate", execlist.get(i).getRegDate());
			listSet.put("mobile", execlist.get(i).getMobile());
			JSONObject json = new JSONObject(listSet);
			ajaxList.add(json);
		}
		return ajaxList;
	}
}
