<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body style="background-color: #f2f3f5">
	<%@ include file="components/message.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card my-4 "
					style="box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-header text-center">
						<h4 class="text-dark">
							<i class="fa-solid fa-user-plus"></i> Signup page
						</h4>
					</div>
					<div class="card-body pb-0">
						<form action="register" method="post">
							<div class="form-group">
								<label for="name">Enter Full Name</label> <input type="text"
									class="form-control" id="name" placeholder="Jhon Doe"
									name="name">
							</div>
							<div class="form-group">
								<label for="email">Enter Email</label> <input type="text"
									class="form-control" id="email" placeholder="jhondoe@gmail.com"
									name="email">
							</div>
							<div class="form-group">
								<label for="password">Enter Password</label> <input
									type="password" class="form-control" id="password"
									placeholder="Jhondoe@123" name="password">
							</div>
							<div class="form-group">
								<label for="phone">Enter Phone Number</label> <input type="text"
									class="form-control" id="phone" placeholder="1234567890"
									name="phone">
							</div>
							<div class="form-group">
								<label for="address">Enter Address</label>
								<textarea class="form-control" id="address"
									placeholder="flat no.10, shree yash building
 mogalwadi road, khopoli"
									name="address" rows="3"></textarea>
							</div>
							<div class="container text-center">
								<button type="reset" class="btn btn-warning ">Reset</button>
								<button type="submit" class="btn btn-dark ">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>