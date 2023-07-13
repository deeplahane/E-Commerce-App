package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.UserDao;
import com.entities.Message;
import com.entities.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			User user= UserDao.getUser(email, password);
			System.out.println(user);
			HttpSession session=req.getSession();
			if(user!=null) {	
				if(user.getUserType().equals("admin")) {
					Message msg = new Message("Login Successfull, Welcome Admin", "alert-success");
					session.setAttribute("msg", msg);
					session.setAttribute("userobj", user);
					res.sendRedirect("admin.jsp");
				}else if(user.getUserType().equals("normal")) {
					Message msg = new Message("Login Successfull...", "alert-success");
					session.setAttribute("msg", msg);
					session.setAttribute("userobj", user);
					res.sendRedirect("normal.jsp");
				}
				
			}else {
				Message msg = new Message("Invalid email or password...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("login.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
