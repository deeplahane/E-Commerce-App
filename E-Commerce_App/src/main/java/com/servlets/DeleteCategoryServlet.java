package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.CategoryDao;
import com.entities.Message;

public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {

			int id=Integer.parseInt(req.getParameter("id")); 
			boolean f = CategoryDao.deleteCategory(id);

			if (f) {
				Message msg = new Message("Category deleted successfully...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("edit_category.jsp");
			} else {
				Message msg = new Message("Oops! Something went wrong...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("edit_category.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
