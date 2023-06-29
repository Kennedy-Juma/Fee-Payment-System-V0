package com.kennedy.onlinefeepaymentsystem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kennedy.onlinefeepaymentsystem.dao.StudentDao;
import com.kennedy.onlinefeepaymentsystem.model.Student;

/**
 * Servlet implementation class Register
 */
@WebServlet(name = "Register", description = "This is servlet controller for register page", urlPatterns = {
		"/Register" })
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList al = new ArrayList();
		
		HttpSession session = request.getSession();

		// read data from html form
		String Fname = request.getParameter("firstname");
		String Lname = request.getParameter("lastname");
		String RegNo = request.getParameter("regno");
		String Password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirm_password");
		
		String patChar = "(.*[/].*$)";
		String patUppercase = "(.*[A-Z].*)";
		String patNumber = "(.*[0-9].*)";
		//String passwordPattern = "^[a-zA-Z[:punct:]]{8,10}$";
		

		if ((Fname == null) || (Fname.equals(""))) {
           al.add("Enter Your First Name!");
        } 
		if ((Lname == null) || (Lname.equals(""))) {
            al.add("Enter Your Last Name!");
        }
		if ((RegNo == null) || (RegNo.equals(""))) {
            al.add("Enter Your Registration Number!");
        }
		if ((Password == null) || (Password.equals(""))) {
            al.add("Enter Your Password!");
        }
		if(!(confirmPassword).equals(Password)) {
            al.add("Password Did not Match");
        }
		
		if(!(Password).matches(RegNo))
		if(!(RegNo).matches(patChar) || !(RegNo).matches(patUppercase) || !(RegNo).matches(patNumber)) {
			al.add("Enter a valid Registration Number!");
		}
		if (al.size() != 0) {
			
            String al_data = Arrays.toString(al.toArray()).replaceAll("[\\[\\]]", "");
            
            session.setAttribute("WARNING", al_data);
			response.sendRedirect("register.jsp");
            
        } else {

		Student student = new Student(Fname, Lname, RegNo, Password);

		StudentDao studentdao = new StudentDao();

		try {
			int result = studentdao.registerStudent(student);
			if (result == 1) {
				session.setAttribute("NOTIFICATION", "User Registered Successfully!");
				response.sendRedirect("register.jsp");
			} else {
				session.setAttribute("ERROR", "STUDENT Already Exist");
				response.sendRedirect("register.jsp");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	}
}
