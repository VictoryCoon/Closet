package com.project.closet.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public boolean adminIn(AdminDto dto) {
		String name = sqlSession.selectOne("adminIn", dto);
		return (name == null) ? false : true;
	}

	@Override
	public AdminDto AdminInfo(AdminDto dto) {
		return sqlSession.selectOne("adminInfo", dto);
	}

	@Override
	public List<AdminDto> adminList(AdminDto dto) {
		List<AdminDto> execList = sqlSession.selectList("adminLogin",dto);
		return execList;
	}

	@Override
	public List<AdminDto> companyInfo(AdminDto dto) {
		List<AdminDto> execList = sqlSession.selectList("companyInfo");
		return execList;
	}

}
