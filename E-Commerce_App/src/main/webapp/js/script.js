/* for navbar height*/
document.addEventListener("DOMContentLoaded", function() {
	// add padding top to show content behind navbar
	navbar_height = document.querySelector('.navbar').offsetHeight;
	document.body.style.paddingTop = navbar_height + 'px';
});

function add_to_cart(pid, pname, pprice) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		let products = []
		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: pprice }
		products.push(product)
		localStorage.setItem("cart", JSON.stringify(products))
		console.log("first time")
		showToast('Product added to cart')
	} else {
		let pcart = JSON.parse(cart)
		let oldProduct = pcart.find((item) => item.productId == pid)
		if (oldProduct) {
			oldProduct.productQuantity = oldProduct.productQuantity + 1;
			pcart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart))
			console.log("quantity increased");
			showToast('Product quantity is increased')
		} else {
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: pprice }
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart))
			console.log("new product added");
			showToast('Product added to cart')
		}
	}

	updateCart();
}

function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString)
	if (cart == null || cart.length == 0) {
		console.log("cart is empty");
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<div class='text-center'><h3 class='text-dark'>Cart is Empty!</h3></div>")
		$(".checkout-btn").attr('disabled',true)
	} else {
		console.log(cart);
		$(".cart-items").html(`( ${cart.length} )`);
		let table = `
		
			<table class='table'>
				<thead	class='thread-light'>
					<tr>
						<th>Product</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total Price</th>
						<th>Action</th>
					</tr>
				</thead>
		
		`;
		let totalPrice = 0;
		cart.map((item) => {

			table += `
				<tr>
					<td>${item.productName}</td>
					<td>&#8377;&nbsp;${item.productPrice}</td>
					<td>${item.productQuantity}</td>
					<td>&#8377;&nbsp;${item.productQuantity * item.productPrice}</td>
					<td><button onclick='deleteItemFromCart(${item.productId})' class="btn-sm btn-danger " style="border:0;">Remove</button></td>
				</tr>
			`
			totalPrice += item.productPrice * item.productQuantity;
		})
		table = table + `
		<tr><td class='text-right font-weight-bold' colspan='4' >Final Price : &#8377;&nbsp;${totalPrice} </td></tr>
		</table>`
		$(".cart-body").html(table)
		$(".checkout-btn").attr('disabled',false)
	}

}

function deleteItemFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newCart = cart.filter((item) => item.productId != pid);
	localStorage.setItem('cart', JSON.stringify(newCart));

	updateCart();
	showToast('Product removed from cart')
}


$(document).ready(function() {
	updateCart();
})

/*function showToast() {
  // Get the snackbar DIV
  var x = document.getElementById("snackbar");

  // Add the "show" class to DIV
  x.className = "show";

  // After 3 seconds, remove the show class from DIV
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}*/

function showToast(content) {
	$("#snackbar").addClass("show");
	$("#snackbar").html(content);
	setTimeout(() => { $("#snackbar").removeClass("show"); }, 3000);
}

function goToCheckout(){
	window.location="checkout.jsp"
}





