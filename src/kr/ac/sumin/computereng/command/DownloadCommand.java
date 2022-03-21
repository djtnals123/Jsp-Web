package kr.ac.sumin.computereng.command;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String fileName = request.getParameter("filename");
		String uploadpath = "D:\\upload";
		File file = new File(uploadpath+"\\"+fileName);
		
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disponsition", "attachment;filename=\""+fileName+"\";");
		
		FileInputStream is = new FileInputStream(file);
		ServletOutputStream os = response.getOutputStream();
		
		byte[] buffer = new byte[1024];
		int data = 0;
		
		while((data=is.read(buffer)) != -1) {
			os.write(buffer, 0, data);
		}
		
		os.flush();
		os.close();
		is.close();
	}

}
