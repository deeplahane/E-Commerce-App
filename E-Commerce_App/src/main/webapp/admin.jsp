<%@page import="com.dao.ProductDao"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body style="background-color:#fafafa">
	<%@ include file="components/message.jsp"%>
	<%
	User user2 = (User) session.getAttribute("userobj");
	if (user2 == null) {
		Message msg = new Message("Please login first...", "alert-danger");
		session.setAttribute("msg", msg);
		response.sendRedirect("login.jsp");
		return;
	} else {
		if (user2.getUserType().equals("normal")) {
			Message msg = new Message("You cannot access this page...", "alert-warning");
			session.setAttribute("msg", msg);
			response.sendRedirect("normal.jsp");
			return;
		}
	}
	%>
	<div class="container " >
		<div class="row mt-4">
			<div class="col-md-2 offset-md-3">
				<div  class="card" style=" box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 50px"  class="img-fluid " src="img/icon/users.png">
						</div>
						<h3 class=""><%=UserDao.getTotalusers() %></h3>
						<h4 class="text-muted">Users</h4>
					</div>
				</div>
			</div>
			<div class="col-md-2 ">
				<div class="card" style=" box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 50px"  class="img-fluid " src="img/icon/categories.png">
						</div>
						<h3 class=""><%=CategoryDao.getTotalCategories() %></h3>
						<h4 class="text-muted">Categories</h4>
					</div>
				</div>
			</div>
			<div class="col-md-2 ">
				<div class="card" style=" box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid " style="max-width: 50px"  src="img/icon/Products.png">
						</div>
						<h3 class=""><%=ProductDao.getTotalProducts() %></h3>
						<h4 class="text-muted">Products</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4 admin">
			<div class="col-md-2 offset-md-3 ">
				<div class="card " style=" box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-body text-center">
						<a href="edit_user.jsp" class="container">
							<img style="max-width: 50px" class="img-fluid "
								src="img/icon/edit_user.png">
						</a>

						<h4 class=" mb-0 mt-1">Edit</h4>
						<h4 class=" mt-0 ">Users</h4>
					</div>
				</div>
			</div>
			<div class="col-md-2 ">
				<div class="card" style=" box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-body text-center">
						<a href="edit_category.jsp" class="container">
							<img style="max-width: 50px" class="img-fluid "
								src="img/icon/edit_category.png">
						</a>

						<h4 class=" mt-1">Edit Categories</h4>
					</div>
				</div>
			</div>
			<div class="col-md-2 ">
				<div class="card" style=" box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-body text-center">
						<a href="edit_product.jsp" class="container">
							<img style="max-width: 50px" class="img-fluid "
								src="img/icon/edit_product.png">
						</a>

						<h4 class=" mt-1">Edit Products</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>