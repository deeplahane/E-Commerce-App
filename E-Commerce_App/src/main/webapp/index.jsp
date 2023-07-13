<%@page import="com.dao.ExtraFunctions"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.entities.Product"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.db.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<%@ include file="components/message.jsp"%>
	<%
	String cat = request.getParameter("category");

	List<Category> clist = CategoryDao.getCategory();
	/* out.println(cat); */
	List<Product> plist = null;

	if (cat == null || cat.trim().equals("all")) {
		plist = ProductDao.getAllProducts();
	} else {
		int cid = Integer.parseInt(cat.trim());
		plist = ProductDao.getProductsById(cid);
	}
	%>
	<div class="row m-4">
		<div class="col-md-2">

			<div class="list-group ">
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-action  active">All
					Categories</a>
				<%
				for (Category c : clist) {
				%>
				<a href="index.jsp?category=<%=c.getCategoryId()%>"
					class="list-group-item list-group-item-action "><%=c.getCategoryTitle()%></a>
				<%
				}
				%>

			</div>
		</div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-12">
					<div class="card-columns">
						<%
						for (Product p : plist) {
						%>
						<div class="card card-css"
							style="width: 18rem; box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;">
							<div class="container text-center" >
								<img class="card-img-top p-2 "
								style="max-height:250px; max-width: 100%; width:auto; "
								src="img/products/<%=p.getpPhoto()%>" alt="Card image cap">
							</div>
							<div class="card-body">
								<h6 class="card-title"><%=ExtraFunctions.get6Words(p.getpTitle())%>&nbsp;<small><a
										href="#">see more</a></small>
								</h6>
								<%-- <p class="card-text"><%=ExtraFunctions.get10Words(p.getpDesc()) %></p> --%>
								<div class="text-center center-stuff">
									<div class="center-stuff">
										<h4 class="text-dark">
											&#8377;<%=p.getDiscountPrice()%>&nbsp;
										</h4>
										<h6 class="text-dark" style="text-decoration: line-through;">
											&#8377;<%=p.getpPrice()%></h6>
										<small class="text-success"><strong> &nbsp;-<%=p.getpDiscount()%>%
												off
										</strong></small>

									</div>
									<button
										onclick="add_to_cart(<%=p.getpPId()%>,'<%=p.getpTitle()%>',<%=p.getDiscountPrice()%>)"
										class="btn bg-custom button-css text-white">
										<i class="fa-solid fa-cart-plus"></i>
									</button>
								</div>
							</div>
						</div>
						<%
						}
						%>

					</div>
					<%
					if (plist.size() == 0) {
					%>
					<div class="text-center mt-4">
						<img src="img/not.png" height="150px" />
						<h4 class="mt-2 text-dark">Products not available</h4>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="components/common_modals.jsp" %>
</body>
</html>