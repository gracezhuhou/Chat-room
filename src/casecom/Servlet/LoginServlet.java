package casecom.Servlet;

import java.io.IOException;
//import java.io.PrintWriter;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import casecom.Service.LoginService;
import casecom.bean.user;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);  
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		user u = new user();                      
		request.setCharacterEncoding("UTF-8");   
		u.setUsername(request.getParameter("username"));   
		u.setPassword(request.getParameter("password"));   
		LoginService us = new LoginService(); 
		HttpSession session = request.getSession();        
		   if(u.getUsername().equals("") || u.getPassword().equals(""))
		{
			response.setContentType("text/html;charset=UTF-8"); 
			response.sendRedirect("login.jsp");                
		}
		
		else if(us.checkPassword(u)){
			response.setContentType("text/html;charset=UTF-8");
			session.setAttribute("username", request.getParameter("username")); 
			response.sendRedirect("chat.jsp"); 
		}
		else{
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write("<script>alert('用户名或密码错误。');</script>");
			writer.write("<script>window.location.href='login.jsp';</script>");
			writer.close();
			writer.flush();
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
