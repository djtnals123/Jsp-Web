package kr.ac.sumin.computereng.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.sumin.computereng.dao.BoardDao;
import kr.ac.sumin.computereng.dto.Criteria;
import kr.ac.sumin.computereng.dto.PageMaker;

public class BoardListCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		BoardDao dao = new BoardDao(); 
		int page;
		int perPage;
		String option = request.getParameter("option");
		String keyword = request.getParameter("keyword");
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		
		try {
			perPage = Integer.parseInt(request.getParameter("per_page"));
		} catch (Exception e) {
			perPage = 10;
		}
		Criteria criteria = new Criteria(page, perPage, option, keyword);
		PageMaker pageMaker = new PageMaker(criteria, dao.count(criteria));

		request.setAttribute("boardList", dao.list(criteria));
		request.setAttribute("pageMaker", pageMaker);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/board_list.jsp");
		dispatcher.forward(request, response);
	}

}
