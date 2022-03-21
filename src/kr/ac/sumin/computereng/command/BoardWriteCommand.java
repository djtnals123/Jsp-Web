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
import kr.ac.sumin.computereng.dto.AttachFile;
import kr.ac.sumin.computereng.dto.UserDatatype;

public class BoardWriteCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MultipartRequest multipart = null;
		try {
			multipart = new MultipartRequest(request, uploadPath, 1024*1024*1024, "EUC-KR", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		UserDatatype user = (UserDatatype) request.getSession().getAttribute("user");
		String title = multipart.getParameter("title");
		String writer = user.getId();
		String contents = multipart.getParameter("contents");
		
		
		BoardDao dao = new BoardDao();
		dao.write(title, writer, contents, null, getAttachFile(multipart));
		
		request.setAttribute("board", new BoardDao().read(dao.getNo()));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/controller/boardRead?no=" + dao.getNo());
		dispatcher.forward(request, response);
	}

	private final String  uploadPath = "D:\\upload";
	private MultipartRequest multipart;
	
	private AttachFile getAttachFile(MultipartRequest multipart) {
		AttachFile attachFile = null;
		
		Enumeration<String> fileNames = multipart.getFileNames();
		
		while(fileNames.hasMoreElements()) {
			String fileName = fileNames.nextElement();
			if(multipart.getOriginalFileName(fileName) != null)
				attachFile = new AttachFile(uploadPath,
					multipart.getOriginalFileName(fileName), multipart.getFilesystemName(fileName));
		}
		return attachFile;
	}
}
