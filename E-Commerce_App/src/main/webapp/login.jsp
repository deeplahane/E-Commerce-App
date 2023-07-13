<%@page import="com.entities.Message"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title> 
</head>
<body style="background-color:#f2f3f5">
	<%@ include file="components/message.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4" style="margin-top:100px;">
				<div class="card mt-2 pb-0 " style="box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
					<div class="card-header text-center">
						<h3 class="text-dark">
							<i class="fa-solid fa-right-to-bracket"></i> Login page
						</h3>
					</div>
					<div class="card-body">
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="jhondoe@gmail.com" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="JhonDoe@123" name="password">
							</div>
							<div class="container text-center" >
								<button type="reset" class="btn btn-warning px-4">Reset</button>
								<button type="submit" class="btn btn-dark px-4">Login</button>
							</div>
							<div class="text-center mt-2">Don't have an account <a href="register.jsp">Create One...</a></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>