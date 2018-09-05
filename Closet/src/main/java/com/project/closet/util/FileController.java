//package com.project.closet.util;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//
//@Controller
//@RequestMapping("/file/")
//public class FileController {
//	
//	@Autowired
//	FileService fileService;
//	
//	@RequestMapping(value = "upload.do", method = RequestMethod.POST)
//	public String addFileCtrl(@RequestParam("uploadFile") MultipartFile uploadFile, MultipartHttpServletRequest request, Object obj) {	// 오브젝트로 대체중. 시발.
//		
//		System.out.println("FileUpload Controller UploadFile : " + uploadFile);
//		
//		FileUtil uFile = new FileUtil();
//		
//		String uploadPath = uFile.fileUpload(request, uploadFile, obj);
//		
//		/* 주석부분은 MyBatis에 등록하는 로직, 일단은 냅두자.*/
//		//boolean num = fileService.addFile(uploadPath, obj);
//		
//		//System.out.println("FileUpload Controller UploadFile num : " + num);
//		System.out.println("FileUpload Controller UploadFile path : " + uploadPath);
//		
//		return "closet/myCloset";
//	}
//}
