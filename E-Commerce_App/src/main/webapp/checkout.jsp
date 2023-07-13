<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ include file="components/all_css.jsp"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
</head>
<body>
	<%
	if (user == null) {
		Message msg = new Message("You need to Login first...", "alert-danger");
		session.setAttribute("msg", msg);
		response.sendRedirect("login.jsp");
		return;
	}
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7">
				<div class="card mt-4">
					<div class="card-header text-center">
						<h4>
							<i class="fa-solid fa-bag-shopping"></i> Your Selected Products
						</h4>
					</div>
					<div class="card-body">
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="card my-4 "
					style="box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-header text-center">
						<h4 class="text-dark">
							<i class="fa-solid fa-circle-info"></i> Your Details
						</h4>
					</div>
					<div class="card-body ">
						<form action="register" method="post">
							<div class="form-group">
								<label for="name">Enter Full Name</label> <input type="text"
									class="form-control" id="name" placeholder="Jhon Doe"
									name="name" value="<%=user.getUserName() %>">
							</div>
							<div class="form-group">
								<label for="email">Enter Email</label> <input type="text"
									class="form-control" id="email" placeholder="jhondoe@gmail.com"
									name="email" value="<%=user.getUserEmail() %>">
							</div>
							<div class="form-group">
								<label for="phone">Enter Phone Number</label> <input type="text"
									class="form-control" id="phone" placeholder="1234567890"
									name="phone" value="<%=user.getUserPhone() %>">
							</div>
							<div class="form-group">
								<label for="address">Enter Address</label>
								<textarea class="form-control" id="address"
									placeholder="flat no.10, shree yash building
 mogalwadi road, khopoli"
									name="address" rows="3"><%=user.getUserAddress() %></textarea>
							</div>
							<div class="container text-center">
								<button type="reset" class="btn btn-warning ">Reset</button>
								<button type="submit" class="btn btn-dark ">Order</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="components/common_modals.jsp"%>
</body>
</html>