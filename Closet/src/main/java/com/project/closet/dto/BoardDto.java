package com.project.closet.dto;

public class BoardDto {

	/* 게시판 일반 파라미터 */
	public String boardNo;
	public String boardTitle;
	public String boardContent;
	//public String boardImage;	이미지관련 자료형은 나중에 정리해서.
	public String userId;
	public String userName;
	public String closetCd;
	public String closetName;
	public String closetBrand;
	public String pointGood;
	public String pointBad;
	public String regDate;
	public String hit;
	
	/* 게시판 댓글 파라미터 */
	public String rpyNo;
	public String rpyContent;
	public String rPointGood;
	public String rPointBad;
	public String privateYn;
	public String rRegDate;
	
	/* 게시판 카테고리 파라미터 */
	public String cateCd;
	public String cateName;
	public String imgPath;
	public String imgName;
	public String remark;
	
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getClosetCd() {
		return closetCd;
	}
	public void setClosetCd(String closetCd) {
		this.closetCd = closetCd;
	}
	public String getClosetName() {
		return closetName;
	}
	public void setClosetName(String closetName) {
		this.closetName = closetName;
	}
	public String getClosetBrand() {
		return closetBrand;
	}
	public void setClosetBrand(String closetBrand) {
		this.closetBrand = closetBrand;
	}
	public String getPointGood() {
		return pointGood;
	}
	public void setPointGood(String pointGood) {
		this.pointGood = pointGood;
	}
	public String getPointBad() {
		return pointBad;
	}
	public void setPointBad(String pointBad) {
		this.pointBad = pointBad;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getRpyNo() {
		return rpyNo;
	}
	public void setRpyNo(String rpyNo) {
		this.rpyNo = rpyNo;
	}
	public String getRpyContent() {
		return rpyContent;
	}
	public void setRpyContent(String rpyContent) {
		this.rpyContent = rpyContent;
	}
	public String getrPointGood() {
		return rPointGood;
	}
	public void setrPointGood(String rPointGood) {
		this.rPointGood = rPointGood;
	}
	public String getrPointBad() {
		return rPointBad;
	}
	public void setrPointBad(String rPointBad) {
		this.rPointBad = rPointBad;
	}
	public String getPrivateYn() {
		return privateYn;
	}
	public void setPrivateYn(String privateYn) {
		this.privateYn = privateYn;
	}
	public String getCateCd() {
		return cateCd;
	}
	public void setCateCd(String cateCd) {
		this.cateCd = cateCd;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getrRegDate() {
		return rRegDate;
	}
	public void setrRegDate(String rRegDate) {
		this.rRegDate = rRegDate;
	}
}
