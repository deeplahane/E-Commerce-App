package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.db.FactoryProvider;
import com.entities.Category;
import com.entities.User;

public class CategoryDao {
	private static SessionFactory f;
	private static Transaction tx;
	private static Session s;

	public CategoryDao(SessionFactory f) {
		super();
		this.f = f;
	}

	public static boolean saveCategory(Category c) {
		boolean f = false;
		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();
			s.save(c);
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

	public static boolean updateCategory(Category c) {
		boolean f = false;

		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();

			TypedQuery<User> q = s.createQuery(
					"update Category set categoryTitle=:cat,categoryDescription=:desc  where categoryId=:cid ");
			q.setParameter("cid", c.getCategoryId());
			q.setParameter("cat", c.getCategoryTitle());
			q.setParameter("desc", c.getCategoryDescription());

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

	public static boolean deleteCategory(int id) {
		boolean f = false;
		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();

			TypedQuery<User> q = s.createQuery("delete from Category where categoryId=:cid ");
			q.setParameter("cid", id);
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

	public static List<Category> getCategory() {
		List<Category> list = null;
		try {
			s = (Session) FactoryProvider.getFactory().openSession();
			s.beginTransaction();
			TypedQuery<Category> c = s.createQuery("from Category order by CategoryId");
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

	public static Category getCategoryById(int id) {
		Category cat = null;
		try {
			s = (Session) FactoryProvider.getFactory().openSession();
			s.beginTransaction();
			Query q = s.createQuery("from Category where CategoryId=:id");
			q.setParameter("id", id);
			cat = (Category) q.uniqueResult();

			s.close();

		} catch (Exception e) {
			if (tx != null) {
				;
				e.printStackTrace();
			}
		}
		return cat;
	}
	
	public static Long getTotalCategories() {
		Long v = null ;
		try {
			s = (Session) FactoryProvider.getFactory().openSession();

			Query q = s.createQuery("select count(*) from Category");
			v=(Long) q.uniqueResult();
			

			s.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

}
