<%@page import="java.util.*"%>
<%@page import="shoppingcart.ApplicationLogic.*"%>
<%@page import="shoppingcart.DatabaseModel.*"%>
<%@page import="shoppingcart.DatabaseConnection.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User authentication = (User) request.getSession().getAttribute("authentication");
if (authentication != null) {
	request.setAttribute("authentication", authentication);
}

ProductDataAccess productDataaccess = new ProductDataAccess(DatabaseConnection.getConnetion());
List<Product> products = productDataaccess.getAllProducts();
@SuppressWarnings("unchecked")
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="Styles.css">
</head>
<body>

<!-- Header-nav bar -->
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><i class="fas fa-hand-holding-medical"></i>Medikart</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
  </div>
  <div class="collapse navbar-collapse " id="navbarSupportedContent">
      <ul class="navbar-nav  mb-2 mb-lg-0" >
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp" >Home</a></li>
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="products.jsp">Products</a></li>
        <li class="nav-item"> <a class="nav-link" href="cart.jsp">Cart<span style="color:red;padding:.5rem">${ cart_list.size() }</span></a></li>
        
        <%
        
        if(authentication != null){ %>
        <li class="nav-item"><a class="nav-link" href="orders.jsp">orders</a></li>
        <li class="nav-item"><a class="nav-link" href="Logout"><i class="fas fa-sign-out-alt"></i></a></li>
        <%}else{ %>
        <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i></a></li>
        <%} %>
      </ul>
     
    </div>
</nav>	
	<!-- Header-nav bar ends------------------- -->
	
	<div class="container">
	
		<!-- Covid Essentials -->
		
		<div class="card-header my-3"><h3>Covid-Essentials</h3></div>
		<div class="row">
		<%
			if(!products.isEmpty()){
				for(Product product:products){
					if(product.getCategory().equals("Covid-Essentials")){
					%>
					<div class="col-md-3 my-3">
					<div class="card">
						<img src="Productimg/<%=product.getImage() %>" class="card-img-top" alt="Product Image" >
						<div class="card-body">
							<h5 class="card-title"><%=product.getName() %></h5>
							<h6 class="price">Price: INR<%=product.getPrice() %></h6>
							
							<div class="mt-3 d-fle justify-content-between">
								<a href="AddToCart?id=<%=product.getId() %>" class="btn btn-primary  btn-dark">Add to Cart</a>
								<a href="Order-Now?quantity=1&id=<%= product.getId() %>" class="btn btn-primary">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
				<%}}
			}
		%>
		</div>
	<!-- Covid Essentials end------------------- -->
	
	<!-- Body Care -->
		<div class="card-header my-3"><h3>Body Care</h3></div>
		<div class="row">
		<%
			if(!products.isEmpty()){
				for(Product product:products){
					if(product.getCategory().equals("Body Care")){
					%>
					<div class="col-md-3 my-3">
					<div class="card">
						<img src="Productimg/<%=product.getImage() %>"  class="card-img-top" alt="Product Image">
						<div class="card-body">
							<h5 class="card-title"><%=product.getName() %></h5>
							<h6 class="price">Price: INR <%=product.getPrice() %></h6>
							
							<div class="mt-3 d-fle justify-content-between">
								<a href="AddToCart?id=<%=product.getId() %>" class="btn btn-primary  btn-dark">Add to Cart</a>
								<a href="Order-Now?quantity=1&id=<%= product.getId() %>" class="btn btn-primary">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
				<%}}
			}
		%>
		</div>
		<!-- Body Care End------------------- -->
		
		<!-- Face Care -->
		<div class="card-header my-3"><h3>Face Care</h3></div>
		<div class="row">
		<%
			if(!products.isEmpty()){
				for(Product product:products){
					if(product.getCategory().equals("Face Care")){
					%>
					<div class="col-md-3 my-3">
					<div class="card">
						<img src="Productimg/<%=product.getImage() %>"  class="card-img-top"  alt="Product Image">
						<div class="card-body">
							<h5 class="card-title"><%=product.getName() %></h5>
							<h6 class="price">Price: INR<%=product.getPrice() %></h6>
							
							<div class="mt-3 d-fle justify-content-between">
								<a href="AddToCart?id=<%=product.getId() %>" class="btn btn-primary  btn-dark">Add to Cart</a>
								<a href="Order-Now?quantity=1&id=<%= product.getId() %>" class="btn btn-primary">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
				<%}}
			}
		%>
		</div>
	<!-- Face Care End-->
		
	<!-- Skin Care -->	
		<div class="card-header my-3"><h3>Skin Care</h3></div>
		<div class="row">
		<%
			if(!products.isEmpty()){
				for(Product product:products){
					if(product.getCategory().equals("Skin Care")){
					%>
					<div class="col-md-3 my-3">
					<div class="card">
						<img src="Productimg/<%=product.getImage() %>"  class="card-img-top" alt="Product Image">
						<div class="card-body">
							<h5 class="card-title"><%=product.getName() %></h5>
							<h6 class="price">Price: INR<%=product.getPrice() %></h6>
							
							<div class="mt-3 d-fle justify-content-between">
								<a href="AddToCart?id=<%=product.getId() %>" class="btn btn-primary  btn-dark">Add to Cart</a>
								<a href="Order-Now?quantity=1&id=<%= product.getId() %>" class="btn btn-primary">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
				<%}}
			}
		%>
		</div>
	<!-- Skin Care end---------------------------- -->	
		
	<!-- Hair Care -->
		<div class="card-header my-3"><h3>Hair Care</h3></div>
		<div class="row">
		<%
			if(!products.isEmpty()){
				for(Product product:products){
					if(product.getCategory().equals("Hair Care")){
					%>
					<div class="col-md-3 my-3">
					<div class="card">
						<img src="Productimg/<%=product.getImage() %>"  class="card-img-top" alt="Product Image">
						<div class="card-body">
							<h5 class="card-title"><%=product.getName() %></h5>
							<h6 class="price">Price: INR<%=product.getPrice() %></h6>
							
							<div class="mt-3 d-fle justify-content-between">
								<a href="AddToCart?id=<%=product.getId() %>" class="btn btn-primary btn-dark">Add to Cart</a>
								<a href="Order-Now?quantity=1&id=<%= product.getId() %>" class="btn btn-primary">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
				<%}}
			}
		%>
		</div>
	<!-- Hair Care End------------------------------------------ -->
		
	<!-- Mens Care -->
		<div class="card-header my-3"><h3>Mens Care</h3></div>
		<div class="row">
		<%
			if(!products.isEmpty()){
				for(Product product:products){
					if(product.getCategory().equals("Mens Care")){
					%>
					<div class="col-md-3 my-3">
					<div class="card">
						<img src="Productimg/<%=product.getImage() %>"  class="card-img-top" alt="Product Image">
						<div class="card-body">
							<h5 class="card-title"><%=product.getName() %></h5>
							<h6 class="price">Price: INR<%=product.getPrice() %></h6>
							
							<div class="mt-3 d-fle justify-content-between">
								<a href="AddToCart?id=<%=product.getId() %>" class="btn btn-primary btn-dark">Add to Cart</a>
								<a href="Order-Now?quantity=1&id=<%= product.getId() %>" class="btn btn-primary">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
				<%}}
			}
		%>
		</div>
	<!-- Mens Care end------------------------------------------- -->	
		
		
	<!-- Shampoos & Conditioners -->
	
		<div class="card-header my-3"><h3>Shampoos and Conditioners</h3></div>
		<div class="row">
		<%
			if(!products.isEmpty()){
				for(Product product:products){
					if(product.getCategory().equals("Shampoos & Conditioners")){
					%>
					<div class="col-md-3 my-3">
					<div class="card">
						<img src="Productimg/<%=product.getImage() %>"  class="card-img-top" alt="Product Image">
						<div class="card-body">
							<h5 class="card-title"><%=product.getName() %></h5>
							<h6 class="price">Price: INR<%=product.getPrice() %></h6>
							
							<div class="mt-3 d-fle justify-content-between">
								<a href="AddToCart?id=<%=product.getId() %>" class="btn btn-primary btn-dark">Add to Cart</a>
								<a href="Order-Now?quantity=1&id=<%= product.getId() %>" class="btn btn-primary">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
				<%}}
			}
		%>
		</div>
	<!-- Shampoos & Conditioners end ---------------------------- -->
	</div>
	
	
	

	
	<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>





