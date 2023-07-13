package com.dao;

import javax.persistence.TypedQuery;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.db.FactoryProvider;
import com.entities.User;

public class UserDao {
	private static SessionFactory f;
	private static Transaction tx;
	private static Session s;

	public UserDao(SessionFactory f) {
		super();
		this.f = f;
	}

	public static boolean saveUser(User user) {
		boolean f = false;
		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();
			s.save(user);
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

	public static User getUser(String email, String password) {
		User user = null;

		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			Query<User> q = s.createQuery("from User where userEmail=:em and userPassword=:pas");
			q.setParameter("em", email);
			q.setParameter("pas", password);
			user = (User) q.uniqueResult();

			s.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public static boolean updateUser(User u) {
		boolean f = false;

		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();

			TypedQuery<User> q = s.createQuery(
					"update User set userName=:usn,userEmail=:use,userPassword=:usp,userPhone=:usph,userPic=:uspi,userAddress=:usa,userType=:ust where userId=:usi ");
			q.setParameter("usn", u.getUserName());
			q.setParameter("use", u.getUserEmail());
			q.setParameter("usp", u.getUserPassword());
			q.setParameter("usph", u.getUserPhone());
			q.setParameter("uspi", u.getUserPic());
			q.setParameter("usa", u.getUserAddress());
			q.setParameter("ust", u.getUserType());
			q.setParameter("usi", u.getUserId());
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

	public static boolean deleteUser(int id) {
		boolean f = false;
		try {

			s = (Session) FactoryProvider.getFactory().openSession();
			tx = s.beginTransaction();

			TypedQuery<User> q = s.createQuery("delete from User where userId=:uid ");
			q.setParameter("uid", id);
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

	public static Long getTotalusers() {
		Long v = null ;
		try {
			s = (Session) FactoryProvider.getFactory().openSession();

			Query q = s.createQuery("select count(*) from User");
			v=(Long) q.uniqueResult();
			

			s.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

}
