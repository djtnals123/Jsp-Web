package kr.ac.sumin.computereng.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.sumin.computereng.dao.UserDataDao;
import kr.ac.sumin.computereng.dto.UserDatatype;

public class LoginCheckCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDataDao dao = new UserDataDao();
		UserDatatype user = dao.loginCheck(id, pw);

		String viewPage = null;
		if(dao.isNullID()) { 
			RequestDispatcher view = request.getRequestDispatcher("/login_form.jsp");
			view.forward(request, response);
		} else if(user == null) {
			if(!dao.isInvalidID()) request.setAttribute("loginMessage", "INVALID_ID");
			else if(!dao.isIncorrectPW()) request.setAttribute("loginMessage", "INCORRECT_PW");
			RequestDispatcher view = request.getRequestDispatcher("/login_form.jsp");
			view.forward(request, response);
		} else {
			if(dao.isAdmin()) { 
				request.setAttribute("loginMessage", "ADMIN");
				viewPage = "/JspWeb/controller/userList";
			} else {
				request.setAttribute("loginMessage", "SUCCESS");
				viewPage = "/JspWeb/controller/choose_function";
			}
			session.setAttribute("user", user);
			response.sendRedirect(viewPage);
		}
	}
}
