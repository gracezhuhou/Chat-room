package casecom.Servlet;

import java.io.IOException;
//import java.io.PrintWriter;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import casecom.Service.RegisterService;
import casecom.bean.user;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);  
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		user newu = new user();                      
		request.setCharacterEncoding("UTF-8");   
		newu.setUsername(request.getParameter("newusername"));   
		newu.setPassword(request.getParameter("newpassword"));
		RegisterService newus = new RegisterService();
		HttpSession session = request.getSession();        
		if(newu.getUsername().equals("") || newu.getPassword().equals(""))
		{	   
			response.setContentType("text/html;charset=UTF-8"); 
			response.sendRedirect("register.jsp");
		}
		
		else{
			response.setContentType("text/html;charset=UTF-8");
			session.setAttribute("username", newu.getUsername());
			if(newus.inputUser(newu)) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.write("<script>alert('注册成功');</script>");
				writer.write("<script>window.location.href='login.jsp';</script>");
				writer.close();
				writer.flush();	
			}
			else{
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.write("<script>alert('此用户名已注册。');</script>");
				writer.write("<script>window.location.href='register.jsp';</script>");
				writer.close();
				writer.flush();
			}
		}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}