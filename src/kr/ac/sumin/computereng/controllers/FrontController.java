package kr.ac.sumin.computereng.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.sumin.computereng.command.AgreeCommand;
import kr.ac.sumin.computereng.command.BoardDeleteCommand;
import kr.ac.sumin.computereng.command.BoardListCommand;
import kr.ac.sumin.computereng.command.BoardModifyCommand;
import kr.ac.sumin.computereng.command.BoardReadCommand;
import kr.ac.sumin.computereng.command.BoardWriteCommand;
import kr.ac.sumin.computereng.command.ChooseFunctionCommand;
import kr.ac.sumin.computereng.command.Command;
import kr.ac.sumin.computereng.command.DownloadCommand;
import kr.ac.sumin.computereng.command.JoinCommand;
import kr.ac.sumin.computereng.command.LoginCheckCommand;
import kr.ac.sumin.computereng.command.LogoutCommand;
import kr.ac.sumin.computereng.command.PatientCommand;
import kr.ac.sumin.computereng.command.LoadBoardModifyCommand;
import kr.ac.sumin.computereng.command.UserListCommand;
import kr.ac.sumin.computereng.command.UserModifyCommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/controller/*")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static int check=0;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.checkURL(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.checkURL(request, response);
	}

	private void checkURL(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Command command = null;
		String url = request.getRequestURI();
		if(url.equals("/JspWeb/controller/loginCheck")) command = new LoginCheckCommand();
		else if(url.equals("/JspWeb/controller/logout")) command = new LogoutCommand();
		else if(url.equals("/JspWeb/controller/boardList")) command = new BoardListCommand();
		else if(url.equals("/JspWeb/controller/boardRead")) command = new BoardReadCommand();
		else if(url.equals("/JspWeb/controller/LoadBoardModify")) command = new LoadBoardModifyCommand();
		else if(url.equals("/JspWeb/controller/boardModify")) command = new BoardModifyCommand();
		else if(url.equals("/JspWeb/controller/boardWrite")) command = new BoardWriteCommand();
		else if(url.equals("/JspWeb/controller/boardDelete")) command = new BoardDeleteCommand();
		else if(url.equals("/JspWeb/controller/join")) command = new JoinCommand();
		else if(url.equals("/JspWeb/controller/agree")) command = new AgreeCommand();
		else if(url.equals("/JspWeb/controller/userModify")) command = new UserModifyCommand();
		else if(url.equals("/JspWeb/controller/userList")) command = new UserListCommand(); 
		else if(url.equals("/JspWeb/controller/download")) command = new DownloadCommand(); 
		else if(url.equals("/JspWeb/controller/patient")) command = new PatientCommand(); 
		else if(url.equals("/JspWeb/controller/choose_function")) command = new ChooseFunctionCommand(); 
		else System.err.println("URL ERROR: " + url);
		System.out.println("[" + check++ + "] " + url);
		
		command.excute(request, response);
	}
}
