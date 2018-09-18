package com.project.closet.daoImpl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.closet.dao.CashDao;
import com.project.closet.dto.CashDto;

@Repository
public class CashDaoImpl implements CashDao {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public HashMap<String, Object> charge(CashDto dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		/* 01 */map.put("SP_User_Id",dto.getUserId());
		/* 02 */map.put("SP_Cash_Raw_Amt",dto.getCashRawAmt());
		/* 03 */map.put("SP_Cash_Real_Amt",dto.getCashRealAmt());
		/* 04 */map.put("SP_Pmt_Kind",dto.getPmtKind());
		/* 05 */map.put("SP_Pmt_Bank_Cd",dto.getBankCd());
		/* 06 */map.put("SP_Pmt_Depositor",dto.getDepositor());
		/* 07 */map.put("SP_Pmt_Account",dto.getAccount());
		/* 08 */map.put("SP_Pmt_Card_Cd",dto.getCardCd());
		/* 09 */map.put("SP_Pmt_Card_No",dto.getCardNo());
		/* 10 */map.put("SP_Pmt_Card_Ow",dto.getCardOw());
		/* 11 */map.put("SP_Pmt_Card_Quota",dto.getCardQuota());
		/* 12 */map.put("SP_Pmt_Card_Pw",dto.getCardPw());
		/* 13 */map.put("SP_Pmt_Card_Exp_Year",dto.getCardExpYear());
		/* 14 */map.put("SP_Pmt_Card_Exp_Month",dto.getCardExpMonth());
		/* 15 */map.put("SP_Pmt_Mobile",dto.getMobile());
		/* 16 */map.put("SP_Pmt_Point",dto.getPoint());
		
		System.out.println("Ins Map : "+map);
		
		sqlSessionTemplate.selectOne("cashChargeStartProc", map);
		
		System.out.println("Out Map : "+map);
		
		//String tryResult = (String) map.get("SP_ReturnCode");
		//String pmtValue = (String) map.get("SP_StatusValue");
		
		return map; 
	}
}
