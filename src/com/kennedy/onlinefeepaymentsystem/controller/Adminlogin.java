package com.kennedy.onlinefeepaymentsystem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kennedy.onlinefeepaymentsystem.dao.AdminLoginDao;
import com.kennedy.onlinefeepaymentsystem.dao.StudentLoginDao;
import com.kennedy.onlinefeepaymentsystem.model.AdminLoginBean;
import com.kennedy.onlinefeepaymentsystem.model.StudentLoginBean;

/**
 * Servlet implementation class Adminlogin
 */
@WebServlet("/Adminlogin")
public class Adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adminlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		AdminLoginBean adminloginbean = new AdminLoginBean(username, password);
		
		AdminLoginDao aloginDao = new AdminLoginDao();
		try {
			if(aloginDao.validateAdmin(adminloginbean)) {
				session.setAttribute("AUTH",true);
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				response.sendRedirect("admindashboard.jsp");
				
			}
			else {
				session.setAttribute("ERROR", "AUTHENTICATION Failed!!!");
				response.sendRedirect("AdminLogin.jsp");
			}
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
