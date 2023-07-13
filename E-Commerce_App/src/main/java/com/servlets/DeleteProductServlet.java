package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.ProductDao;
import com.entities.Message;

public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {

			int id=Integer.parseInt(req.getParameter("id")); 
			boolean f = ProductDao.deleteProduct(id);

			if (f) {
				Message msg = new Message("Product deleted successfully...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("edit_product.jsp");
			} else {
				Message msg = new Message("Oops! Something went wrong...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("edit_product.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
