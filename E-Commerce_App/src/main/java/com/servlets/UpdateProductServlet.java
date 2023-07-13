package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.entities.Category;
import com.entities.Message;
import com.entities.Product;

@MultipartConfig
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();
			int pid=Integer.parseInt(req.getParameter("pid"));
			String title = req.getParameter("title");
			String desc = req.getParameter("desc");
			int price = Integer.parseInt(req.getParameter("price"));
			int discount = Integer.parseInt(req.getParameter("discount"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			Part part = req.getPart("pic");
			int pic = Integer.parseInt(req.getParameter("category"));
			Category c = CategoryDao.getCategoryById(pic);

			Product p = new Product();
			p.setpPId(pid);
			p.setpTitle(title);
			p.setpDesc(desc);
			p.setpPrice(price);
			p.setpDiscount(discount);
			p.setpQuantity(quantity);
			p.setCategory(c);
			p.setpPhoto(part.getSubmittedFileName());

			boolean f = ProductDao.updateProduct(p);

			if (f) {
				Message msg = new Message("Product updated successfully...", "alert-success");
				session.setAttribute("msg", msg);
				res.sendRedirect("edit_product.jsp");
			} else {
				Message msg = new Message("Oops! Something went wrong...", "alert-danger");
				session.setAttribute("msg", msg);
				res.sendRedirect("update_product.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
