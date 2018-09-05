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
		
		try {
			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();
			path = getSaveLocation(request, obj);
			
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
		
		return path + fileName;
	}

	private String getSaveLocation(MultipartHttpServletRequest request, Object obj) {
		/* 절대경로 셋팅 */
		String uploadPath = "/Users/g/Project/Closet/Closet/src/main/webapp/";	//request.getSession().getServletContext().getRealPath("/");
		String attachPath = "file/closet/";
		
		/* 여기서 의류 항목별로 파일폴더를 나누어서 저장 할 수 있어야함. */
		/* Form에서 애초에 나눠서 오면 되겠다...*/
		
		System.out.println("Request Category : "+request.getParameter("category"));
		System.out.println("Request Category : "+request.getParameter("category").toString());
		
		String category = request.getParameter("category").toString();
		
		if(category == "outer") {
			attachPath += "outer/";
		} else if(category == "top") {
			attachPath += "top/";
		} else if(category == "bottom") {
			attachPath += "bottom/";
		} else if(category == "underTop") {
			attachPath += "underTop/";
		} else if(category == "underBottom") {
			attachPath += "underBottom/";
		} else if(category == "accessory") {
			attachPath += "accessory/";
		} else if(category == "shoes") {
			attachPath += "shoes/";
		} else {
			attachPath += "etc/";
			System.out.println("왜 여기로오는데 ? "+ request.getParameter("category").toString());
		}
		
		System.out.println("FileUtil - getSaveLocation uPath : " + uploadPath);
		System.out.println("FileUtil - getSaveLocation  path : " + uploadPath + attachPath);
		
		return uploadPath + attachPath;
	}
}
