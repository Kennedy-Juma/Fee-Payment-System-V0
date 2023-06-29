package com.kennedy.onlinefeepaymentsystem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kennedy.onlinefeepaymentsystem.dao.StudentLoginDao;
import com.kennedy.onlinefeepaymentsystem.model.StudentLoginBean;

/**
 * Servlet implementation class Studentlogin
 */
@WebServlet(name = "Studentlogin", description = "This is servlet controller for register page", urlPatterns = {
"/Studentlogin" })
public class Studentlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Studentlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		StudentLoginBean studentloginbean = new StudentLoginBean(username, password);
		
		StudentLoginDao sloginDao = new StudentLoginDao();
		try {
			if(sloginDao.validateStudent(studentloginbean)) {
				session.setAttribute("AUTH",true);
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				response.sendRedirect("studentdashboard.jsp");
				
			}
			else {
				session.setAttribute("ERROR", "AUTHENTICATION Failed!!!");
				response.sendRedirect("login.jsp");
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
