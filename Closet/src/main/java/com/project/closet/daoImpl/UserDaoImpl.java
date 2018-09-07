package com.project.closet.daoImpl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.closet.dao.UserDao;
import com.project.closet.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public HashMap<String, Object> signUp(UserDto dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("SP_User_Id", dto.getUserId());
		map.put("SP_User_Pw", dto.getUserPw());
		map.put("SP_User_Name", dto.getUserName());
		map.put("SP_User_Kind", dto.getUserKind());
		map.put("SP_Reg_Date", dto.getRegDate());
		map.put("SP_Birthday", dto.getBirthday());
		map.put("SP_Birth_Kind", dto.getBirthKind());
		map.put("SP_Social_No", dto.getSocialNo());
		map.put("SP_Mobile", dto.getMobile());
		
		sqlSessionTemplate.selectOne("userInsProc", map);
		
		return map; 
	}
	
	@Override
	public boolean signIn(UserDto dto) {
		String name = sqlSession.selectOne("signIn", dto);
		return (name == null) ? false : true;
	}

	@Override
	public UserDto viewUser(UserDto dto) {
		return sqlSession.selectOne("viewUser", dto);
	}

	@Override
	public void signOut(HttpSession session) { }

	@Override
	public boolean updatePassword(UserDto dto) {
		int update = 0;
		update = sqlSession.update("updatePassword", dto);
		return (update != 0) ? true : false;
	}

	@Override
	public boolean updateMobile(UserDto dto) {
		int update = 0;
		update = sqlSession.update("updateMobile", dto);
		return (update != 0) ? true : false;
	}

	@Override
	public boolean updateSex(UserDto dto) {
		int update = 0;
		update = sqlSession.update("updateSex", dto);
		return (update != 0) ? true : false;
	}
	
	@Override
	public boolean userDrop(UserDto dto) {
		int update = 0;
		update = sqlSession.update("userDrop", dto);
		return (update != 0) ? true : false;
	}


	@Override
	public List<UserDto> userIdChk(UserDto dto) {
		List<UserDto> execList = sqlSession.selectList("userIdChk",dto);
		return execList;
	}
	
	@Override
	public List<UserDto> testList(UserDto dto) {
		List<UserDto> execList = sqlSession.selectList("testAjax",dto);
		return execList;
	}
}
