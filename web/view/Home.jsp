<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--Slider-->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="overflow: auto;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
        <img src="./images/womenBanner.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
        <img src="./images/menBanner.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- Categories section -->
<a id="men">
<section class="my-5" >
    <div class="container">
      <header class="text-center">
        <h3 class="text-uppercase mb-5">Shop for Mens</h3>
      </header>
      <div class="row">
        <!-- product-->
        <div class="col-lg-3 offset-lg-2 col-md-4 col-6"  ng-repeat="d in mendata">
            <div class="product">
              <div class="product-image">
                  <div class="ribbon ribbon-info">{{d.CategoryName}}</div><img class="img-fluid" src="./images/{{d.catimage}}"product"/>
                <div class="product-hover-overlay"><a class="product-hover-overlay-link" href="#category/{{d.id}}"></a>
                    <div class="product-hover-overlay-buttons"><a class="btn btn-dark btn-buy" href="#category/{{d.id}}"><i class="fa-search fa"></i><span class="btn-buy-label ms-2" >View</span></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
  </section>
    </a>
<a id="women">
    <div class="row">&nbsp;</div>
  <section class="my-5">
    <div class="container">
      <header class="text-center">
        <h3 class="text-uppercase mb-5">Shop For Woman</h3>
      </header>
      <div class="row">
        <!-- product-->
        <div class="col-lg-3 offset-lg-2 col-md-4 col-6" ng-repeat="d in womendata">
          <div class="product">
            <div class="product-image">
                <div class="ribbon ribbon-info">{{d.CategoryName}}</div><img class="img-fluid" src="./images/{{d.catimage}}" alt="product"/>
              <div class="product-hover-overlay"><a class="product-hover-overlay-link" href="#category/{{d.id}}"></a>
                <div class="product-hover-overlay-buttons"><a class="btn btn-dark btn-buy" href="#category/{{d.id}}"><i class="fa-search fa"></i><span class="btn-buy-label ms-2">View</span></a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /product-->
      </div>
    </div>
  </section>
    </a>

  <!-- New Section -->
  <a id="new">
              <div class="row">&nbsp;</div>

  <section class="my-5">
    <div class="container">
      <header class="text-center">
        <h3 class="text-uppercase mb-5">Newest Collection</h3>
      </header>
      <div class="row">
        <!-- product-->
        <div class="col-lg-3 col-md-4 col-6" ng-repeat="n in newdata">
            <div class="product" >
            <div class="product-image">
                <div class="ribbon ribbon-info">new</div><img class="img-fluid" src="./images/{{n.image}}" alt="{{n.image}}"/>
              <div class="product-hover-overlay"><a class="product-hover-overlay-link" href="#detail/{{n.productid}}"></a>
                <div class="product-hover-overlay-buttons"><a class="btn btn-dark btn-buy" href="#detail/{{n.productid}}"><i class="fa-search fa"></i><span class="btn-buy-label ms-2">View</span></a>
                </div>
              </div>
            </div>
            <div class="py-2">
              <p class="text-muted text-sm mb-1">{{n.CategoryName}}</p>
              <h3 class="h6 text-uppercase mb-1"><a class="text-dark" href="#detail/{{n.productid}}">{{n.ProductName}}</a></h3><span class="text-muted">₹{{n.ProductPrice}}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  </a>
