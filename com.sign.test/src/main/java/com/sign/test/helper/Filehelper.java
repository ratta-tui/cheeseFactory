package com.sign.test.helper;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class Filehelper {
	public static String upload(String uploadPath, MultipartFile multipartFile, HttpServletRequest request) {
		
		String uploadFileUrl = null;
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		String realUploadPath =  rootPath + "/resources" + uploadPath;
		
		File dir = new File(realUploadPath);
		
		if(!dir.exists()) 
			dir.mkdirs();			
		
		File file = new File(dir.getAbsoluteFile() + File.separator + multipartFile.hashCode() + multipartFile.getOriginalFilename());
		
		try {
			multipartFile.transferTo(file);
			String contextPath = request.getContextPath();
			uploadFileUrl = contextPath + uploadPath + File.separator + file.getName();
		}catch(Exception e){
			e.printStackTrace();
		}
		return uploadFileUrl;
	}
}
