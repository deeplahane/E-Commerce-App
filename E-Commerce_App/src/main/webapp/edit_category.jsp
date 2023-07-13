<%@page import="com.entities.Category"%>
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
<title>Edit Category</title>
</head>
<body style="background-color: #f2f3f5;">

	<%@ include file="components/message.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="text-center mt-4 mb-4" style="color: #54626F;">
			<h3>All Categories</h3>
		</div>
		<div>
			<a class="btn btn-success mb-2" href="add_new_category.jsp" role="button"><i class="fa-solid fa-plus"></i> Add Category</a>
		</div>
		<table class="table" style="background-color: white">
			<thead style="background-color: #dcdcdc;">
				<tr style="color: #3E424B;">
					<th scope="col" style="width: 50px;">Id</th>
					<th scope="col" style="width: 150px;">Category</th>
					<th scope="col" style="width: 400px;">Description</th>
					<th scope="col" style="width: 100px;">Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				Session s = FactoryProvider.getFactory().openSession();
				@SuppressWarnings("unchecked")
				TypedQuery<Category> q = s.createQuery("from Category order by id");
				List<Category> categories = q.getResultList();

				for (Category c : categories) {
				%>
				<tr>
					<th scope="row"><%=c.getCategoryId()%></th>
					<td class="text-capitalize"><%=c.getCategoryTitle()%></td>
					<td><%=c.getCategoryDescription()%></td>
					<td><a class="btn-sm btn-primary mr-3 px-3 "
						style="text-decoration: none;"
						href="update_category.jsp?id=<%=c.getCategoryId()%>" role="button">Edit</a><a
						class="btn-sm btn-danger px-3" style="text-decoration: none;"
						href="delete_category?id=<%=c.getCategoryId()%>" role="button">Delete</a></td>
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