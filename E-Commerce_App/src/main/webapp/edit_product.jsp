<%@page import="com.entities.Product"%>
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
<title>Edit Product</title>
</head>
<body style="background-color: #f2f3f5;">

	<%@ include file="components/message.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="text-center mt-4 mb-4" style="color: #54626F;">
			<h3>All Product's</h3>
		</div>
		<div>
			<a class="btn btn-success mb-2" href="add_new_product.jsp" role="button"><i class="fa-solid fa-user-plus"></i> Add Product</a>
		</div>
		<table class="table" style="background-color: white">
			<thead style="background-color: #dcdcdc;">
				<tr style="color: #3E424B;">
					<th scope="col" style="width: 50px;">Id</th>
					<th scope="col" style="width: 200px;">Product</th>
					<th scope="col" style="width: 450px;">Description</th>
					<th scope="col" style="width: 50px;">Price</th>
					<th scope="col" style="width: 50px;">Discount</th>
					<th scope="col" style="width: 50px;">Quantity</th>
					<th scope="col" style="width: 50px;">Category</th>
					<th scope="col" style="width: 100px;">Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				Session s = FactoryProvider.getFactory().openSession();
				@SuppressWarnings("unchecked")
				TypedQuery<Product> q = s.createQuery("from Product order by id");
				List<Product> products = q.getResultList();

				for (Product p : products) {
				%>
				<tr>
					<th scope="row"><%=p.getpPId()%></th>
					<td class="text-capitalize"><%=p.getpTitle()%></td>
					<td class="text-capitalize"><%=p.getpDesc()%></td>
					<td><%=p.getpPrice()%></td>
					<td><%=p.getpDiscount()%></td>
					<td><%=p.getpQuantity()%></td>
					<td class="text-capitalize"><%=p.getCategory().getCategoryTitle() %></td>
					<td><a class="btn-sm btn-primary mr-2 "
						style="text-decoration: none;"
						href="update_product.jsp?id=<%=p.getpPId()%>" role="button">Edit</a><a
						class="btn-sm btn-danger" style="text-decoration: none;"
						href="delete_product?id=<%=p.getpPId()%>" role="button">Delete</a></td>
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