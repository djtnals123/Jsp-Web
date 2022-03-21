package kr.ac.sumin.computereng.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.sumin.computereng.dao.BoardDao;


public class LoadBoardModifyCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		BoardDao dao = new BoardDao();
		System.out.println(request.getParameter("no"));
		int no = Integer.parseInt(request.getParameter("no"));	
		
		request.setAttribute("board", dao.read(no));
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("../board_modify.jsp");
		requestDispatcher.forward(request, response);
	}
}
