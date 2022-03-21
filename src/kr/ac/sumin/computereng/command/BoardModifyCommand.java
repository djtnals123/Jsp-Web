package kr.ac.sumin.computereng.command;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.ac.sumin.computereng.dao.BoardDao;
import kr.ac.sumin.computereng.dao.UserDataDao;
import kr.ac.sumin.computereng.dto.AttachFile;

public class BoardModifyCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		BoardDao dao = new BoardDao();
		if(request.getMethod().equals("GET")) {
			int no = Integer.parseInt(request.getParameter("no"));	
			
			request.setAttribute("board", dao.read(no));
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("../board_modify.jsp");
			requestDispatcher.forward(request, response);
		} else if(request.getMethod().equals("POST")) {
			MultipartRequest multipart = null;
			try {
				multipart = new MultipartRequest(request, uploadPath, 1024*1024*1024, "EUC-KR", new DefaultFileRenamePolicy());
			} catch (IOException e) {
				e.printStackTrace();
			}
			String title = multipart.getParameter("title");
			String contents = multipart.getParameter("contents");
			int no = Integer.parseInt(multipart.getParameter("no"));

			dao.update(no, title, contents, getAttachFile(multipart));
			
			request.setAttribute("board", new BoardDao().read(dao.getNo()));
			RequestDispatcher dispatcher = request.getRequestDispatcher("/controller/boardRead?no=" + no);
			dispatcher.forward(request, response);
		}
		
	}
	private final String  uploadPath = "D:\\upload";
	
	
	
	private AttachFile getAttachFile(MultipartRequest multipart) {
		AttachFile attachFile = null;
		
		Enumeration<String> fileNames = multipart.getFileNames();
		
		while(fileNames.hasMoreElements()) {
			String fileName = fileNames.nextElement();

			String uploadPath;
			if(multipart.getOriginalFileName(fileName) != null)
				attachFile = new AttachFile(this.uploadPath,
						multipart.getOriginalFileName(fileName), multipart.getFilesystemName(fileName));
		}
		return attachFile;
	}
}
