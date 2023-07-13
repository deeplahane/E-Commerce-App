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

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");

			User user = new User(name, email, password, phone, "default.jpg", address, "normal");
			boolean f = UserDao.saveUser(user);

			if (f) {
				Message msg = new Message("Congrats! Registration  Successfull...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("login.jsp");
			} else {
				Message msg = new Message("Oops! Something went wrong...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			/*
			 * Message msg = new
			 * Message("The email entered is already registered. Please enter a unique email."
			 * , "alert-warning"); session.setAttribute("msg", msg);
			 * res.sendRedirect("register.jsp");
			 */
			e.printStackTrace();
		}
	}

}
