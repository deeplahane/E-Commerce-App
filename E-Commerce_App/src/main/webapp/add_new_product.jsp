<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="com.db.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="components/all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
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
							<i class="fa-solid fa-plus"></i> Add Product
						</h4>
					</div>
					<div class="card-body pb-0">
						<form action="add_new_product" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="name">Enter Product</label> <input type="text"
									class="form-control" id="name"
									placeholder="ASUS Vivobook 15 Core i5 11th Gen" name="title">
							</div>

							<div class="form-group">
								<label for="address">Enter Description</label>
								<textarea class="form-control" id="address" name="desc"
									placeholder="Stylish & Portable Thin and Light Laptop
15.6 Inch Full HD 16:9 Aspect ratio, LCD Backlit, 200nits, 45% NTSC Color Gamut, Anti-glare display
Finger Print Sensor for Faster System Access
Light Laptop without Optical Disk Drive"
									rows="5"></textarea>
							</div>
							<div class="form-group">
								<label for="name">Enter Price</label> <input type="number"
									class="form-control" id="name" placeholder="42,990"
									name="price">
							</div>
							<div class="form-group">
								<label for="name">Enter Discount</label> <input type="number"
									class="form-control" id="name" placeholder="10" name="discount">
							</div>
							<div class="form-group">
								<label for="name">Enter Quantity</label> <input type="number"
									class="form-control" id="name" placeholder="50" name="quantity">
							</div>
							<div class="form-group">
								<label for="name">Select the Product Image</label><br /> <input
									type="file" class="form-control" name="pic">
							</div>
							<div class="form-group">

								<label for="name">Enter Category</label> <select
									class="form-control" name="category">
									<%
									List<Category> cat = CategoryDao.getCategory();
									for (Category c : cat) {
									%>
									<option value="<%=c.getCategoryId() %>" ><%=c.getCategoryTitle()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div class="container text-center">
								<button type="reset" class="btn btn-warning ">Reset</button>
								<button type="submit" class="btn btn-dark ">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>