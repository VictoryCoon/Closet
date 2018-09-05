//package com.project.closet.util;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//
//public class FileDaoImpl implements FileDao{
//
//	@Autowired
//	SqlSession sqlSession;
//	
//	@Override
//	public boolean clothesUpload(String uploadPath) {
//		int update = 0;
//		
//		update = sqlSession.update("uploadClothes", uploadPath);//아.
//		System.out.println("UserDAO Dto updateYn : "+update);
//		
//		return (update != 0) ? true : false;
//	}
//
//}
