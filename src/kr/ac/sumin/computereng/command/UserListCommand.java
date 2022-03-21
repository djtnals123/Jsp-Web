package kr.ac.sumin.computereng.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.sumin.computereng.dao.UserDataDao;
import kr.ac.sumin.computereng.dto.Criteria;
import kr.ac.sumin.computereng.dto.PageMaker;
import kr.ac.sumin.computereng.dto.UserDatatype;

public class UserListCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		UserDataDao dao = new UserDataDao();
		int page;
		int perPage;
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
		 
		Criteria criteria = new Criteria(page, perPage);
		PageMaker pageMaker = new PageMaker(criteria, dao.count(criteria));	
		List<UserDatatype> userList = dao.list(criteria);
		request.setAttribute("userList", userList);
		request.setAttribute("pageMaker", pageMaker);
		RequestDispatcher view = request.getRequestDispatcher("/user_list.jsp");
		view.forward(request, response);
		
		



		request.setAttribute("boardList", dao.list(criteria));
		request.setAttribute("pageMaker", pageMaker);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/board_list.jsp");
		dispatcher.forward(request, response);
	}

}
