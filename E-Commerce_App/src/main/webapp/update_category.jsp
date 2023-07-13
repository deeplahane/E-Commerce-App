<%@page import="com.entities.Category"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="com.db.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Category</title>
</head>
<body style="background-color: #f2f3f5">
	<%@ include file="components/message.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	Session s = FactoryProvider.getFactory().openSession();
	@SuppressWarnings("unchecked")
	TypedQuery<Category> q = s.createQuery("from Category where id=:id");
	q.setParameter("id", id);
	Category c = q.getSingleResult();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card my-4 "
					style="box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-header text-center">
						<h4 class="text-dark">
							<i class="fa-solid fa-user-plus"></i> Edit Category
						</h4>
					</div>
					<div class="card-body pb-0">
						<form action="update_category" method="post">
							<input type="hidden" name="id" value="<%=c.getCategoryId()%>" />
							<div class="form-group">
								<label for="name">Enter Category</label> <input type="text"
									class="form-control" id="name" placeholder="Jhon Doe"
									name="category" value="<%=c.getCategoryTitle()%>">
							</div>
							<div class="form-group">
								<label for="address">Enter Description</label>
								<textarea class="form-control" id="address" name="description"
									placeholder="A laptop is a personal computer that can be easily moved and used in a variety of locations. Most laptops are designed to have all of the functionality of a desktop computer"
									rows="5"><%=c.getCategoryDescription()%></textarea>
							</div>
							<div class="container text-center">
								<button type="reset" class="btn btn-warning ">Reset</button>
								<button type="submit" class="btn btn-dark ">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>