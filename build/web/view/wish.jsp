<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="../js/app.js"></script>    

<section class="my-5">
                          <h3 class="text-uppercase mb-5 text-center" >Your Wishlist</h3>

            <div class='container p-5 '>

                <div class="row d-flex justify-content-center"  ng-repeat="d in mydata">
                    <div class="col col-lg-2 bg-gray-100">
                        <div style="background-image: url('./images/{{d.image}}');height:30vh; margin:10px ;background-repeat:no-repeat; background-size: contain; background-position: center; "></div>
                    </div>
                    <div class="col col-lg-5 bg-gray-100" style="padding: 0px" >
                        <div class="card" style=" border: none">
                            <div class="card-body bg-gray-100" >
                                <h5 class="card-subtitle text-muted mb-2">{{d.CategoryName}}</h5>
                                <br><h3 class="card-title">{{d.ProductName}}</h3>
                                <h5 class="text-muted">₹{{d.ProductPrice}}</h5>
                                <div class="product-hover-overlay-buttons">
                                <a class="btn btn-dark btn-buy" href="#detail/{{d.productid}}">
                                <i class="fa-search fa"></i>
                                <span class="btn-buy-label ms-2">View</span>
                                </a>
                                </div>
                                <br><a class="card-link" data-product-id="{{d.productid}}" style="cursor:pointer;" onclick="removefromwishlist(this)">Remove From Wishlist</a>
                            </div>
                        </div>
                    </div>
                    <div class='row'>&nbsp;</div>
                    <div class='row'>&nbsp;</div>
                </div>
            </div>

        </section>
