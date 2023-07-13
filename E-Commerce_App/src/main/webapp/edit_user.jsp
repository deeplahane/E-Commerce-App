<%@page import="java.util.List"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="com.db.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit user</title>
</head>
<body style="background-color: #f2f3f5;">

	<%@ include file="components/message.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="text-center mt-4 mb-4" style="color: #54626F;">
			<h3>All User's</h3>
		</div>
		<div>
			<a class="btn btn-success mb-2" href="add_new_user.jsp" role="button"><i class="fa-solid fa-user-plus"></i> Add User</a>
		</div>
		<table class="table" style="background-color: white">
			<thead style="background-color: #dcdcdc;">
				<tr style="color: #3E424B;">
					<th scope="col" style="width: 10px;">Id</th>
					<th scope="col" style="width: 150px;">Name</th>
					<th scope="col" style="width: 150px;">Email</th>
					<th scope="col" style="width: 100px;">Password</th>
					<th scope="col" style="width: 100px;">Phone</th>
					<th scope="col" style="width: 200px;">Address</th>
					<th scope="col" style="width: 50px;">Role</th>
					<th scope="col" style="width: 150px;">Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				Session s = FactoryProvider.getFactory().openSession();
				@SuppressWarnings("unchecked")
				TypedQuery<User> q = s.createQuery("from User order by id");
				List<User> users = q.getResultList();

				for (User t : users) {
				%>
				<tr>
					<th scope="row"><%=t.getUserId()%></th>
					<td class="text-capitalize"><%=t.getUserName()%></td>
					<td><%=t.getUserEmail()%></td>
					<td><%=t.getUserPassword()%></td>
					<td><%=t.getUserPhone()%></td>
					<td><%=t.getUserAddress()%></td>
					<td class="text-capitalize"><%=t.getUserType()%></td>
					<td><a class="btn-sm btn-primary mr-2 "
						style="text-decoration: none;"
						href="update_user.jsp?id=<%=t.getUserId()%>" role="button">Edit</a><a
						class="btn-sm btn-danger" style="text-decoration: none;"
						href="delete_user?id=<%=t.getUserId()%>" role="button">Delete</a></td>
				</tr>
				<%
				}
				s.close();
				%>

			</tbody>
		</table>
	</div>


</body>
</html>