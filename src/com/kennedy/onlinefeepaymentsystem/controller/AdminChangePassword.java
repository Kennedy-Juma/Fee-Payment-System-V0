package com.kennedy.onlinefeepaymentsystem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kennedy.onlinefeepaymentsystem.dao.AdminLoginDao;
import com.kennedy.onlinefeepaymentsystem.model.AdminLoginBean;

/**
 * Servlet implementation class AdminChangePassword
 */
@WebServlet("/AdminChangePassword")
public class AdminChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//retrieve all parameters from jsp page
		
		String oldpass=request.getParameter("current");
		String newpass=request.getParameter("new");
		String renewpass=request.getParameter("confirm");
		
		HttpSession session = request.getSession();
		
		String currentpass=(String)session.getAttribute("password");
		String username=(String)session.getAttribute("username");
		
		if(oldpass.equals("")||oldpass==null||newpass.equals("")||newpass==null||renewpass.equals("")||renewpass==null) {
			session.setAttribute("NOTIFICATION", "All Fields are mandatory");
			response.sendRedirect("admin-change-password.jsp");
		}
		else if(!newpass.equals(renewpass)) {
			session.setAttribute("NOTIFICATION", "Password does not Match");
			response.sendRedirect("admin-change-password.jsp");
		}
		else if(!currentpass.equals(oldpass)) {
			session.setAttribute("NOTIFICATION", "Old Password is not correct");
			response.sendRedirect("admin-change-password.jsp");
		}
		else {
			//set values to model object
			AdminLoginBean admin=new AdminLoginBean(username, newpass);
			
			AdminLoginDao aloginDao = new AdminLoginDao();
			
			//call a method in dao to update the table
	
			try {
				
				int i=AdminLoginDao.resetPass(admin);
				
				if(i!=0) {
					session.setAttribute("msg", "Password Updated Successfully");
					response.sendRedirect("admindashboard.jsp");
				}
				else {
					session.setAttribute("error", "Password not Updated, try after sometime");
					response.sendRedirect("admindashboard.jsp");
				}
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
			
			
		}
	}

}
