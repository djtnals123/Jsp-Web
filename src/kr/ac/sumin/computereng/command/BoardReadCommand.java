package kr.ac.sumin.computereng.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.sumin.computereng.dao.BoardDao;
import kr.ac.sumin.computereng.dto.BoardVO;

public class BoardReadCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDao dao = new BoardDao();
		BoardVO board = dao.read(no);
		board.setAttachFile(dao.getAttachFile(no));
		request.setAttribute("board", board);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/board_read.jsp");
		dispatcher.forward(request, response);
	}
}
