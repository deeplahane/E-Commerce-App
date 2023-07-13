package com.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

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
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			
			String title = req.getParameter("title");
			String desc  = req.getParameter("desc");
			int price=Integer.parseInt(req.getParameter("price"));
			int discount=Integer.parseInt(req.getParameter("discount"));
			int quantity=Integer.parseInt(req.getParameter("quantity"));
			Part part=req.getPart("pic");
			int pic=Integer.parseInt(req.getParameter("category"));
			Category c=CategoryDao.getCategoryById(pic);

			
			Product p=new Product();
			p.setpTitle(title);
			p.setpDesc(desc);
			p.setpPrice(price);
			p.setpDiscount(discount);
			p.setpQuantity(quantity);
			p.setCategory(c);
			p.setpPhoto(part.getSubmittedFileName());
			
			boolean f=ProductDao.saveProduct(p);
			
//			upload file code
			@SuppressWarnings("deprecation")
			String path=req.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			FileOutputStream fos=new FileOutputStream(path);
			InputStream is=part.getInputStream();
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();

			
			  if (f) { Message msg = new Message("Product added Successfully...",
			  "alert-success"); session.setAttribute("msg", msg);
			  res.sendRedirect("edit_product.jsp"); } else { Message msg = new
			  Message("Oops! Something went wrong...", "alert-danger");
			  session.setAttribute("msg", msg); res.sendRedirect("add_new_product.jsp"); }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
