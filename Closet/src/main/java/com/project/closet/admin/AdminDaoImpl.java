package com.project.closet.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public boolean adminIn(AdminDto dto) {
		String name = sqlSession.selectOne("adminIn", dto);
		return (name == null) ? false : true;
	}

	@Override
	public AdminDto AdminInfo(AdminDto dto) {
		return sqlSession.selectOne("adminInfo", dto);
	}

}
