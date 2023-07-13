package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.CategoryDao;
import com.entities.Category;
import com.entities.Message;

public class UpdateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {

			int id=Integer.parseInt(req.getParameter("id")); 
			String category= req.getParameter("category");
			String description = req.getParameter("description");
			

			Category category1 = new Category();
			category1.setCategoryId(id);
			category1.setCategoryTitle(category);
			category1.setCategoryDescription(description);
			
			boolean f=CategoryDao.updateCategory(category1);

			if (f) {
				Message msg = new Message("Category updated successfully...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("edit_category.jsp");
			} else {
				Message msg = new Message("Oops! Something went wrong...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("update_category.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
