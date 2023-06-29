package com.kennedy.onlinefeepaymentsystem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kennedy.onlinefeepaymentsystem.dao.StudentDao;
import com.kennedy.onlinefeepaymentsystem.dao.feedDao;
import com.kennedy.onlinefeepaymentsystem.model.Student;
import com.kennedy.onlinefeepaymentsystem.model.feedbackBean;

/**
 * Servlet implementation class feedback
 */
@WebServlet("/feedback")
public class feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public feedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		PrintWriter out = response.getWriter();
		

		
		HttpSession session = request.getSession();

		// read data from html form
		String Name= request.getParameter("name");
		String Email = request.getParameter("email");
		String Comment = request.getParameter("comment");
		
		feedbackBean feedback = new feedbackBean(Name, Email, Comment);

		feedDao feedbackdao = new feedDao();
		
		try {
			int result = feedbackdao.Feedback(feedback);
			if (result == 1) {
				session.setAttribute("NOTIFICATION", "Feedback successfully sent!");
				response.sendRedirect("contact-us.jsp");
			} 

		} catch (Exception ex) {
			out.println("Exception:"+ex);
			ex.printStackTrace();
		}
	}

	}


