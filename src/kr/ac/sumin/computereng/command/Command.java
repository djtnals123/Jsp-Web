package kr.ac.sumin.computereng.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	void excute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException ;
}