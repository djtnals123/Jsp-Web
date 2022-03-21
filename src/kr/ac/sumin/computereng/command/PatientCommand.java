package kr.ac.sumin.computereng.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PatientCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setAttribute("Message", "soon.");
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("../choose_function_form.jsp");
		requestDispatcher.forward(request, response);
	}

}
