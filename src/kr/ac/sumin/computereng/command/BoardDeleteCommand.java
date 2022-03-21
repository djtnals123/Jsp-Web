package kr.ac.sumin.computereng.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.sumin.computereng.dao.BoardDao;

public class BoardDeleteCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		BoardDao dao = new BoardDao();
		dao.delete(Integer.parseInt(request.getParameter("no")));
		response.sendRedirect("/JspWeb/controller/boardList");
	}

}
