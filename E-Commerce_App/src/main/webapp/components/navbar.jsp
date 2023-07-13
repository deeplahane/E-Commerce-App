<%@page import="com.dao.ProductDao"%>
<%@page import="com.entities.Product"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.User"%>
<%@ page isELIgnored="false"%>
<%
User user = (User) session.getAttribute("userobj");
	String cat1 = request.getParameter("category");

	List<Category> clist1 = CategoryDao.getCategory();
	/* out.println(cat); */
	List<Product> plist1 = null;

	if (cat1 == null || cat1.trim().equals("all")) {
		plist1 = ProductDao.getAllProducts();
	} else {
		int cid = Integer.parseInt(cat1.trim());
		plist1 = ProductDao.getProductsById(cid);
	}
	%>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark ">
	<a class="navbar-brand" href="about.jsp"><i
		class="fa-solid fa-cart-shopping"></i> MyCart</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fa-solid fa-list"></i> All
					categories</a> 
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<%
 for (Category c : clist1) {
 %>
					<a class="dropdown-item"
						href="index.jsp?category=<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></a>
					<%
					}
					%>
				</div></li>
		</ul>

		<ul class="navbar-nav ml-auto">

			<li class="nav-item active mt-2 mr-2"><a href="#"
				style="text-decoration: none;" class="m-2  text-light"
				data-toggle="modal" data-target="#cart"> <i
					class="fa-solid fa-cart-plus mr-1"
					style="font-size: 25px; text-decoration: none;"></i><span
					class="cart-items"
					style="margin font-size: 20px; text-decoration: none;">( 0 )</span>
			</a></li>
			<%
			if (user == null) {
			%>
			<li class="nav-item active"><a href="login.jsp"><button
						type="button" class="btn btn-outline-light mr-2">
						<i class="fa-solid fa-right-to-bracket"></i> Login
					</button></a></li>
			<li class="nav-item active"><a href="register.jsp"><button
						type="button" class="btn btn-outline-light">
						<i class="fa-solid fa-user-plus"></i> Register
					</button></a></li>
		</ul>
		<%
		} else {
		%>
		<a href="#"><button type="button"
				class="btn btn-outline-light mr-2">
				<i class="fa-solid fa-user"></i>
				<%=user.getUserName()%>
			</button></a> <a href="logout"><button type="button"
				class="btn btn-outline-light">
				<i class="fa-solid fa-right-to-bracket fa-rotate-180"></i> Logout
			</button></a>
		<%
		}
		%>
	</div>
</nav>