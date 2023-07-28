<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- cart -->
<div class="container d-flex justify-content-center align-items-center border-secondary p-1">
<div class="cart-product-wrapper w-100">
    
    <!-- cart item-->
     <div class="navbar-cart-product "> 
      <div class="d-flex align-items-center">
        <div class="w-100 p-4 text-center text-uppercase">
         <h5 id="pd">ORDER Details</h5>
        </div>
      </div>
        
    </div>
    <div class="navbar-cart-product " ng-repeat="d in mydata.items"> 
      <div class="d-flex align-items-center">
        <div class="w-100 p-4">
         <h5 data-product-id="{{d.productid}}" id="pd">{{d.ProductName}}</h5>
         <span class=" fw-bold "id="size">SIZE: {{d.Size}}</span>&nbsp;
         <span class=" fw-bold "id="size">QUANTITY: {{d.Quantity}}</span><BR>
         <span class=" fw-bold ">PRICE: ₹{{d.TotalPrice}}</span>
        </div>
            
      </div>
    </div>
    <div class="navbar-cart-product">
        <div class="w-100 p-4 text-center text-uppercase">
         <h5 id="pd">Delivery address</h5>
        </div>
        <div class="d-flex align-items-center">
            <div class="w-100 p-4">
                <br>
            <h4 class=" fw-bold ">{{mydata.items[0].Address1}}</h4>
                    <div class="d-flex justify-content-center"><a class="btn btn-outline-dark" data-order-id ="{{mydata.items[0].orderid}}" href="#/cart" id="btn">Change Address</a></div>

            </div>
        </div>
    </div>
    <div class="navbar-cart-total"><span class="text-uppercase text-muted">Total</span><h4><strong class="text-uppercase">₹{{mydata.totalPrice}}</strong></h4></div>

    <div class="navbar-cart-product d-flex justify-content-around" >
        <!-- buttons-->
        <div class="d-flex justify-content-center"><a class="btn btn-outline-dark" data-order-id ="{{mydata.items[0].orderid}}" href="#/cart" id="btn">View Cart</a></div>
        <div class="d-flex justify-content-center"><button class="btn btn-outline-dark" data-order-id ="{{mydata.items[0].orderid}}" onclick="checkout(this)" id="btn">Place Order</button></div>
    </div>
  </div>
  


