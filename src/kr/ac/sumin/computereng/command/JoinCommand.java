package kr.ac.sumin.computereng.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.sumin.computereng.dao.UserDataDao;
import kr.ac.sumin.computereng.dto.UserDatatype;

public class JoinCommand implements Command {
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String hospital = request.getParameter("hospital");
		String[] roles = request.getParameterValues("roles");
		UserDataDao dao = new UserDataDao();
		dao.join(id, pw, email, name, hospital, roles);
		
		if(dao.isAgree()) {
			request.setAttribute("agree", "TRUE");
			if(dao.isDuplicateID()) {
				request.setAttribute("joinUser", new UserDatatype(id, pw, email, name, hospital, roles, null));
				request.setAttribute("joinMessage", "DUPLICATE_ID");
			} else {
				request.setAttribute("joinMessage", "SUCCESS");
			}
		}
		else request.setAttribute("agree", "FALSE");
		
		RequestDispatcher view = request.getRequestDispatcher("../join_form.jsp");
		view.forward(request, response);
	}
}
