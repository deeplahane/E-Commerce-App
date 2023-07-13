package com.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.db.FactoryProvider;
import com.entities.Category;
import com.entities.Product;
import com.entities.User;

public class ProductDao {
	private static SessionFactory f;
	private static Transaction tx;
	private static Session s;

	public ProductDao(SessionFactory f) {
		super();
		this.f = f;
	}

	public static boolean saveProduct(Product p) {
		boolean f = false;
		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();
			s.save(p);
			tx.commit();
			f = true;
			s.close();

		} catch (Exception e) {
			if (tx != null) {
				f = false;
				e.printStackTrace();
			}
		}
		return f;
	}

	public static Product getProduct(int id) {
		Product p = null;

		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();
			TypedQuery<Product> q = s.createQuery("from Product where pPId=:id");
			q.setParameter("id", id);
			p = q.getSingleResult();
			tx.commit();
			s.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	public static boolean updateProduct(Product p) {
		boolean f = false;

		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();

			TypedQuery<User> q = s.createQuery(
					"update Product set pTitle=:pt, pDesc=:pd,pPrice=:pp,pDiscount=:pdi,pQuantity=:pq,category_categoryId=:cci,pPhoto=:pph  where pPId=:ppid ");
			q.setParameter("pt", p.getpTitle());
			q.setParameter("pd", p.getpDesc());
			q.setParameter("pp", p.getpPrice());
			q.setParameter("pdi", p.getpDiscount());
			q.setParameter("pq", p.getpQuantity());
			q.setParameter("cci", p.getCategory().getCategoryId());
			q.setParameter("pph", p.getpPhoto());
			q.setParameter("ppid", p.getpPId());

			q.executeUpdate();

			tx.commit();
			f = true;
			s.close();

		} catch (Exception e) {
			if (tx != null) {
				f = false;
				e.printStackTrace();
			}
		}

		return f;
	}

	public static boolean deleteProduct(int id) {
		boolean f = false;
		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();

			TypedQuery<User> q = s.createQuery("delete from Product where pPId=:id ");
			q.setParameter("id", id);
			q.executeUpdate();

			tx.commit();
			f = true;
			s.close();

		} catch (Exception e) {
			if (tx != null) {
				f = false;
				e.printStackTrace();
			}
		}
		return f;
	}

	public static List<Product> getAllProducts() {
		List<Product> list = null;
		try {
			s = (Session) FactoryProvider.getFactory().openSession();
			s.beginTransaction();
			TypedQuery<Product> c = s.createQuery("from Product");
			list = c.getResultList();

			s.close();

		} catch (Exception e) {
			if (tx != null) {
				;
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public static List<Product> getProductsById(int id) {
		List<Product> list = null;
		try {
			s = (Session) FactoryProvider.getFactory().openSession();
			s.beginTransaction();
			TypedQuery<Product> q = s.createQuery("from Product where category_categoryId=:id");
			q.setParameter("id", id);
			list = q.getResultList();

			s.close();

		} catch (Exception e) {
			if (tx != null) {
				;
				e.printStackTrace();
			}
		}
		return list;
	}

	public static Product getProductById(int id) {
		Product p = null;
		try {
			s = (Session) FactoryProvider.getFactory().openSession();
			s.beginTransaction();
			Query q = s.createQuery("from Product where pPid=:id");
			q.setParameter("id", id);
			p = (Product) q.uniqueResult();

			s.close();

		} catch (Exception e) {
			if (tx != null) {
				;
				e.printStackTrace();
			}
		}
		return p;
	}
	
	public static Long getTotalProducts() {
		Long v = null ;
		try {
			s = (Session) FactoryProvider.getFactory().openSession();

			Query q = s.createQuery("select count(*) from Product");
			v=(Long) q.uniqueResult();
			

			s.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

}
