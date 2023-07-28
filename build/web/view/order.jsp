<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- cart -->
<div class="container">
    <div ng-repeat="d in mydata">
    <div class="cart-product-wrapper w-100  border-secondary border p-auto " >
    
    <!-- cart item-->
     <div class="navbar-cart-product "> 
      <div class="d-flex align-items-center">
        <div class="w-100 p-4 text-center text-uppercase">
         <h5 id="pd">ORDER Details</h5>
         <span class="detail-text fw-bold ">Payment Mode:</span><span> COD(Cash On Delivery)</span><br>
         <span class="detail-text fw-bold ">Order Status:</span><span> {{d.status}}</span>
        </div>
      </div>
        
    </div>
    <div class="navbar-cart-product " ng-repeat="p in d.items"> 
            
      <div class="d-flex align-items-center">
        <div class="w-100 p-4">
         <h5 data-product-id="{{p.productid}}" id="pd">{{p.ProductName}}</h5>
         <span class=" fw-bold "id="size">SIZE: {{p.Size}}</span>&nbsp;
         <span class=" fw-bold "id="size">QUANTITY: {{p.Quantity}}</span><BR>
         <span class=" fw-bold ">PRICE: ₹{{p.TotalPrice}}</span>
        </div>
            
      </div>
    </div>
    <div class="navbar-cart-product ">
        <div class="w-100 p-4 text-center text-uppercase">
         <h5 id="pd">Delivery address</h5>
        </div>
        <div class="d-flex align-items-center justify-content-around">
            <h4 class=" fw-bold ">{{d.items[0].Address1}}</h4>
        </div>
    </div>
    <div class="navbar-cart-total d-flex align-items-center"><span class="text-uppercase ">Total</span><h4><strong class="text-uppercase">₹{{d.totalPrice}}</strong></h4></div>
    <div>
    </div>

</div>
                        <div class="row">&nbsp;</div>

</div>
</div>
<div class="d-flex align-items-center justify-content-center w-100 p-4">
    <a class="btn btn-outline-dark " href="#/">Home Page</a>

</div>



