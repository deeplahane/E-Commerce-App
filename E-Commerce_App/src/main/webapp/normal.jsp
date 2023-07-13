<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
</head>
<body>
	<%@ include file="components/message.jsp"%>
	<%
	User user1=(User) session.getAttribute("userobj");
	if (user1 == null) {
		Message msg = new Message("Please login first...", "alert-danger");
		session.setAttribute("msg", msg); 
		response.sendRedirect("login.jsp");
		return;
	} else {
		if (user1.getUserType().equals("admin")) {
			Message msg = new Message("You cannot access this page...", "alert-warning");
			session.setAttribute("msg", msg);
			response.sendRedirect("admin.jsp");
			return;
		}
	}
	%>
	<h1>This is normal page</h1>
</body>
</html>