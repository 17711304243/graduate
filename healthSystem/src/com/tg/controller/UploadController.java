package com.tg.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.entity.Monitoring;
import com.tg.service.MonitoringService;


@Controller

@RequestMapping("/upload")
public class UploadController {
	
	@Autowired
	private MonitoringService monitoringService;
	
	@RequestMapping("/up.do")
	public void saveTest(HttpServletRequest request,HttpServletResponse response) {
		try {
			System.out.println("---");
			String path = request.getContextPath();
			String realpath = request.getSession().getServletContext().getRealPath("file/");
			File file=new File(realpath);
			if (!file.exists()) {
				file.mkdirs();
			}
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			System.out.println(realpath+"===");
			System.out.println(basePath+"+++");
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if(!isMultipart){
				
			}
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			List<FileItem> items = upload.parseRequest(request);
			System.out.println(items);
			for(FileItem item:items){
				if(item.isFormField()){
					
					String fieldName = item.getFieldName();
					String fieldValue = item.getString();
					System.out.println(fieldName+"="+fieldValue);
				}else{
					
					InputStream in = item.getInputStream();
					
					String fileName = item.getName();//   C:\Documents and Settings\wzhting\桌面\a.txt        a.txt
					fileName = fileName.substring(fileName.lastIndexOf("\\")+1);//   a.txt
					System.out.println("filename="+fileName);
					Monitoring mo = new Monitoring();
					mo.setEcg(fileName);
					monitoringService.add(mo);
					String storeFile = realpath+fileName;
					System.out.println(storeFile+"++++");
					OutputStream out = new FileOutputStream(storeFile);
					
					byte b[] = new byte[1024];
					int len = -1;
					while((len=in.read(b))!=-1){
						out.write(b,0,len);
					}
					out.close();
					in.close();
				}
			}
		} catch (FileUploadException e) {
			throw new RuntimeException("服务器忙");
			// TODO Auto-generated catch block
		} catch (IOException e) {
			
		}
	}
}