package kr.ac.sumin.computereng.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.sumin.computereng.dao.UserDataDao;
import kr.ac.sumin.computereng.dto.UserDatatype;

public class UserModifyCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		UserDatatype user = (UserDatatype) request.getSession().getAttribute("user");
		if(request.getMethod().equals("GET")) {
			if(user == null) {
				response.sendRedirect("/JspWeb/login_form.jsp");
			} else {
				request.setAttribute("loginUser", user);
				request.setAttribute("isUserModify", "TRUE");
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("../join_form.jsp");
				requestDispatcher.forward(request, response);
			}
		} else if(request.getMethod().equals("POST")) {
			UserDataDao dao = new UserDataDao();
			if(user == null) response.sendRedirect("/JspWeb/login_form.jsp");
			
			
			user.setId(request.getParameter("id"));
			user.setPass(request.getParameter("pw"));
			user.setEmail(request.getParameter("email"));
			user.setName(request.getParameter("name"));
			user.setHospital(request.getParameter("hospital"));
			user.setRoles(request.getParameterValues("roles"));
			
			dao.update(user);
			response.sendRedirect("/JspWeb/choose_function_form.jsp");
		}
		

		
	}
}


