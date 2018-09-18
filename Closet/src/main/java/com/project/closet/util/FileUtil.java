package com.project.closet.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUtil {

	String fileName = "";
	
	public String fileUpload(MultipartHttpServletRequest request, MultipartFile uploadFile, Object obj) {
		
		String path = "";
		String fileName = "";
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		/* 절대경로 셋팅 */
		String uploadPath = "C:/Users/victo/git/repository/Closet/src/main/webapp/";//request.getSession().getServletContext().getRealPath("/");
		String attachPath = "file/upload/";
		
		/* 여기서 의류 항목별로 파일폴더를 나누어서 저장 할 수 있어야함. */
		/* Form에서 애초에 나눠서 오면 되겠다...*/
		String category = request.getParameter("category").toString();
		
		if(category.equals("outer")) {
			attachPath += "outer/";
		} else if(category.equals("top")) {
			attachPath += "top/";
		} else if(category.equals("bottom")) {
			attachPath += "bottom/";
		} else if(category.equals("underTop")) {
			attachPath += "underTop/";
		} else if(category.equals("underBottom")) {
			attachPath += "underBottom/";
		} else if(category.equals("accessory")) {
			attachPath += "accessory/";
		} else if(category.equals("shoes")) {
			attachPath += "shoes/";
		} else if(category.equals("profile")) {
			attachPath += "profile/";
		} else {
			attachPath += "etc/";
		}
		
		try {
			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();
			path = uploadPath + attachPath;
			
			System.out.println("FileUtil - UPLOAD RECEIVE FILE_NAME : " + fileName);
			System.out.println("FileUtil - UPLOAD RECEIVE FILE_PATH : " + path);
			
			File file = new File(path);
			
			if(fileName != null && !fileName.equals("")) {
				if(file.exists()) {
					fileName = System.currentTimeMillis() + "_" + fileName;	//이름 저장 형
					file = new File(path + fileName);	// 경로 저장형식
					// 나중에 2개를 DB에 등록하여 호출도 할 수 있게끔 한다. Closet에 등록되는 듯 한 정보. MY_CLOSET 테이블을 따로 구성해야할듯?
				}
			}
			
			System.out.println("FileUtil - UPLOAD AFTER FILE_NAME : " + fileName);
			System.out.println("FileUtil - UPLOAD AFTER FULL_PATH : " + file);
			
			out = new FileOutputStream(file);
			
			System.out.println("FileUtil - UPLOAD OUT+STREAM" + out);
			
			out.write(bytes);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("FileUtil - UPLOAD : Exception");
		} finally {
			try {
				if(out != null) {
					out.close();
				}
				if(printWriter != null) {
					printWriter.close();
				}
			} catch (IOException ioe) {
				ioe.printStackTrace();
				System.out.println("FileUtil - UPLOAD : IOException");
			}
		}
		
		return attachPath + fileName;
	}
}
