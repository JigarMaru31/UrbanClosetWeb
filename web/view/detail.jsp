
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    function sizeactive(e)
    {
        console.log(e);
        var a = e.innerText;
        console.log(a);
        console.log("size_"+a);
        var r = document.getElementById("size_"+a);
        
        r.setAttribute("checked",true);
       
        e.classList.add("active");
    }
</script>
<section class="product-details">
      <div class="container">
        <div class="row">
            <div class="col-lg-6 col-xl-7 pt-4 order-2 order-lg-1" ng-repeat="d in mydata">
              <a class="glightbox d-block mb-4" href="img/product/kyle-loftus-596319-unsplash-cropped-2.jpg" data-title="Modern Jacket 1 - Caption text" data-gallery="product-gallery">
                  <div data-bs-toggle="zoom" ><img class="img-fluid" src="./images/{{d.image}}"></div></a><a class="glightbox d-block mb-4" href="img/product/kyle-loftus-596319-unsplash-cropped.jpg" data-title="Modern Jacket 2 - Caption text" data-gallery="product-gallery">
                      <div data-bs-toggle="zoom" ><img class="img-fluid" src="./images/{{d.image2}}" alt="{{d.image2}}"></div></a><a class="glightbox d-block mb-4" href="img/product/kyle-loftus-596319-unsplash-cropped-.jpg" data-title="Modern Jacket 3 - Caption text" data-gallery="product-gallery">
                          <div data-bs-toggle="zoom" ><img class="img-fluid" src="./images/{{d.image3}}" alt="{{d.image3}}"></div></a>
          </div>
          <div class="col-lg-6 col-xl-5 ps-lg-5 pt-4 order-1 order-lg-2 "ng-repeat="d in mydata">
            <ul class="breadcrumb undefined">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item"><a href="#/category/{{d.id}}">{{d.CategoryName}}</a></li>
              <li class="breadcrumb-item active">{{d.ProductName}}</li>
            </ul>
            <div class="sticky-top" style="top: 100px;">
              <h1 class="h2 mb-4">{{d.ProductName}}</h1>
              <div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-sm-between mb-4">
                <ul class="list-inline mb-2 mb-sm-0">
                  <li class="list-inline-item h4 fw-light mb-0">₹{{d.ProductPrice}}</li>
                  <li class="list-inline-item text-muted fw-light"> 
                  </li>
                </ul>
                
              </div>
              <p class="mb-4 text-muted">{{d.ProductDescription}}</p>
              <form id="cart">
                <div class="row">
                    <h6 class="detail-option-heading">Size <span>(required)</span></h6>
                  <div class="col-sm-6 col-lg-12 detail-option mb-3">
                      <select class="form-control"  for="size_{{x}}" onclick="sizeactive(this)" id="size"> 
                          <option class="input-invisible" ng-repeat="x in d.ProductSize.split(',')"  type="radio" name="size" value="{{x}}"   required>{{x}}</option>
                    </select>
                  </div>
                  <div class="col-12 detail-option mb-3">
                   
                  </div>
                  <div class="col-12 col-lg-6 detail-option mb-5">
                    <label class="detail-option-heading fw-bold">Quantity <span>(required)</span></label>
                    <input class="form-control detail-quantity" max="{{d.ProductQuantity}}" name="items"  id="quantity" type="number" value="1">
                  </div>
                </div>
                <ul class="list-inline">
                  <li class="list-inline-item">
                      <button class="btn btn-dark btn-lg mb-1" data-product-id="{{d.productid}}" ng-click="addtocart()" id=""> <i class="fa fa-shopping-cart me-2"></i>Add to Cart</button>
                  </li>
                  <button ng-if="d.inwishlist" id="fav" data-like="false"  style="background: none; border: none; "  data-product-id="{{d.productid}}" onclick="removefromwishlist(this)">
                          <i class="bi bi-heart-fill" style="font-size: 19px; color:#5252ed"></i>
                    </button>
                    <button ng-if="!d.inwishlist" id="fav" data-like="false"  style="background: none; border: none; "  data-product-id="{{d.productid}}"  data-category-id="{{d.id}}" onclick="addtowishlist(this)">
                          <i class="bi bi-heart" style="font-size: 19px; color:#5252ed"></i>
                    </button>          
                </ul>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
<section>&nbsp;</section>
<section>&nbsp;</section>
<section>&nbsp;</section>
<section>&nbsp;</section>

    


