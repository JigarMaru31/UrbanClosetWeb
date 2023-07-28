<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- cart -->
<div class="container d-flex justify-content-center align-items-center">
<div class="cart-product-wrapper w-100">
    
    <!-- cart item-->
    <div class="navbar-cart-product" ng-repeat="d in mydata.items"> 
      <div class="d-flex align-items-center"><a href=""><img class="img-fluid" style="width: 150px; height: 200px;"  src="./images/{{d.image}}" alt="..."></a>
        <div class="w-100 p-4">
         <h3 >{{d.ProductName}}</h3>
         <p class="lh-md">{{d.ProductDescription}}</p>
         <h4  >₹{{d.TotalPrice}}</h4>
         <label>Size:
            <span class="detail-option-heading fw-bold text-lowercase"id="size">{{d.Size}}</span>
         </label>
         <div class="d-flex  align-items-center">
             <label class="detail-option-heading fw-bold">Quantity
                          <input class="form-control detail-quantity" name="items" type="number" value="{{d.Quantity}}" min="1" max="{{d.ProductQuantity}}" id="{{d.productid}}">
             </label>
             <a class=" mt-4 link-info " style="cursor: pointer" data-id="{{d.Productid}}" data-order-id="{{d.orderid}}" onclick="removecart(this);">Remove</a>
         </div>
         <div class="d-flex justify-content-center"><button class="btn btn-outline-dark" data-order-id ="{{mydata.items[0].orderid}}"  data-product-id="{{d.productid}}" onclick="updatecart(this)" id="btn">Update Cart</button></div>

        </div>
            
      </div>
    </div>
            <div class="navbar-cart-total"><span class="text-uppercase text-muted">Total</span><h4><strong class="text-uppercase">₹{{mydata.totalPrice}}</strong></h4></div>

    <div class="navbar-cart-product" >
        <!-- total price-->
        <!-- buttons-->
        <div class="d-flex justify-content-center"><a class="btn btn-outline-dark"  data-order-id ="{{mydata.items[0].orderid}}" href="#/checkout"  id="btn">Checkout</a></div>
    </div>
  </div>
  

