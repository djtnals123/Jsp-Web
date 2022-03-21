package kr.ac.sumin.computereng.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AgreeCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String viewPage = null;
		if(request.getMethod().equals("POST") && request.getParameter("agree").equals("on")) {
			request.getSession().setAttribute("agree", "on");
			viewPage = "/join_form.jsp";
		}
		else {
			viewPage = "/agree.jsp";
		}

		RequestDispatcher view = request.getRequestDispatcher(viewPage);
		view.forward(request, response);
		
	}

}
