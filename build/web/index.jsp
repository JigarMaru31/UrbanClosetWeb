<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

Object data = session.getAttribute("UserID");
int userId = -1;
    
if (data != null)
    userId = Integer.parseInt(data.toString());
%>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Price Slider Stylesheets -->
<link rel="stylesheet" href="./css/nouislider.css">
<!-- Google fonts - Playfair Display-->
<link rel="stylesheet" href="./css/css.css">
<!-- owl carousel-->
<link rel="stylesheet" href="./css/owl.carousel.css">
<!-- Lightbox -->
<link rel="stylesheet" href="./css/glightbox.min.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="./css/theme.css">

<!-- Custom stylesheet - for your changes-->
<!--<link rel="stylesheet" href="./css/bootstrap-grid.min.css">-->
<!-- Favicon-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css" integrity="sha512-xnP2tOaCJnzp2d2IqKFcxuOiVCbuessxM6wuiolT9eeEJCyy0Vhcwa4zQvdrZNVqlqaxXhHqsSV1Ww7T2jSCUQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/solid.css" integrity="sha384-TbilV5Lbhlwdyc4RuIV/JhD8NR+BfMrvz4BL5QFa2we1hQu6wvREr3v6XSRfCTRp" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/regular.css" integrity="sha384-avJt9MoJH2rB4PKRsJRHZv7yiFZn8LrnXuzvmZoD3fh1aL6aM6s0BBcnCvBe6XSD" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/brands.css" integrity="sha384-7xAnn7Zm3QC1jFjVc1A6v/toepoG3JXboQYzbM0jrPzou9OFXm/fY6Z/XiIebl/k" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/fontawesome.css" integrity="sha384-ozJwkrqb90Oa3ZNb+yKFW2lToAWYdTiF1vt8JiH5ptTGHTGcN7qdoR1F95e0kYyG" crossorigin="anonymous">
<script src="./js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
            
            function logOut()
            {
                $.ajax({
                    url: './users',
                    method: 'get',
                    accepts: 'application/json;charset=utf8',
                    success: function (res)
                    {
                        console.log(res);
                        
                        if (res.status)
                            window.location.href = './index.jsp';
                    }
                });
            }
            
        </script>
<!--        <script>
            window.onload=function(){
            const fav = document.querySelector("#fav");
            let flag=0;
            fav.addEventListener("click",(e)=>
            {   
            console.log(fav);
            var dataId = fav.getAttribute('data-id');
            console.log(dataId);
            
                if(flag==0)
                {
                    fav.children[0].classList.add("bi-heart-fill");
                fav.children[0].classList.remove("bi-heart");
                
                console.log(fav.children[0].getAttribute("style"));
                flag=1;
                }
                else
                {
                    fav.children[0].classList.add("bi-heart");
                fav.children[0].classList.remove("bi-heart-fill");
                flag=0;
                }
            });
            }

        </script>-->
</head>
<body ng-app="App" ng-controller="index">
    <header class="header">
        <!-- Navbar-->
        <nav class="navbar navbar-expand-lg navbar-sticky navbar-airy navbar-light bg-white bg-fixed-white">
          <div class="container-fluid">  
              <!-- Navbar Header  --><a class="navbar-brand" href="#/"><h4 class="d-flex align-items-center">Urban Closet</h4></a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
            <!-- Navbar Collapse -->
            <div class="collapse navbar-collapse" id="navbarCollapse">
              <ul class="navbar-nav mx-auto">
                  
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle active" id="categoryDropdownMenuLink" href="" data-bs-target="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
                  <div class="dropdown-menu dropdown-menu-animated" aria-labelledby="categoryDropdownMenuLink">
                      <a class="dropdown-item"  ng-click="scrollTo('men')" >Mens</a>
                      <a class="dropdown-item" ng-click="scrollTo('women')">Womans</a>
                  </div>
                </li>
                <!-- Megamenu-->
                <!-- /Megamenu end-->
                <!-- Multi level dropdown    -->
                <li class="nav-item dropdown"><a class="nav-link " href="#new" >New</a>
                </li>
                <!-- Multi level dropdown end-->
                <li class="nav-item"><a class="nav-link" style="cursor: pointer;" ng-click="scrollTo('footer')">Contact</a>
                </li>
                
              </ul>
              
                
                <!-- User Dropdown-->
                <div class="nav-item dropdown"><div class="d-lg-none"> <a class="navbar-icon-link" id="cartdetails" href  data-bs-target="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                    <svg class="svg-icon">
                      <use xlink:href="#male-user-1"> </use>
                    </svg></a>
                            <div class="dropdown-menu dropdown-menu-animated dropdown-menu-end m-sm-auto p-sm-3 ">
                      <!-- Login-->
                      
                      <%
                          if (userId != -1){

                      %>
                        <div class="dropdown-item"><a href="#wishlist" style="text-decoration: none; color: black" ><strong class="text-uppercase">wishlist</strong></a></div>
                        <div class="dropdown-item"><a href="#order" style="text-decoration: none; color: black" ><strong class="text-uppercase">My orders</strong></a></div>
                        <!--profile-->
                      <div class="dropdown-item"><a href="#profile" style="text-decoration: none; color: black" ><strong class="text-uppercase">profile</strong></a></div>
                          <%}      
                          else
                          {%>
                          <div class="dropdown-item"><a href="./login.jsp" style="text-decoration: none; color: black" ><strong class="text-uppercase">Login</strong></a></div>
                          <%
                          }
                       %>
                              
                              <!--wishlist-->
                      
                              <!--Logout-->
                              <%
                          if (userId != -1){
                          %>
                          <div class="dropdown-item"><a onclick="logOut();" style="text-decoration: none; color: black; cursor: pointer" ><strong class="text-uppercase">
                      
                              Logout</strong></a></div>
                          <%}%>      
                              
                      
                    </div>
                        </div>
                  <div class="d-none d-lg-block"><a class="navbar-icon-link" id="cartdetails" href  data-bs-target="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <svg class="svg-icon">
                        <use xlink:href="#male-user-1"> </use>
                      </svg>
                      </a>
                    <div class="dropdown-menu dropdown-menu-animated dropdown-menu-end p-4">
                      <!-- Login-->
                      
                      <%
                          if (userId != -1){

                      %>
                        <div class="dropdown-item"><a href=".   /login.jsp" style="text-decoration: none; color: black" ><strong class="text-uppercase">User</strong></a></div>
                        <div class="dropdown-item"><a href="#wishlist" style="text-decoration: none; color: black" ><strong class="text-uppercase">wishlist</strong></a></div>
                        <div class="dropdown-item"><a href="#order" style="text-decoration: none; color: black" ><strong class="text-uppercase">My orders</strong></a></div>
                        <!--profile-->
                      <div class="dropdown-item"><a href="#profile" style="text-decoration: none; color: black" ><strong class="text-uppercase">profile</strong></a></div>
                          <%}      
                          else
                          {%>
                          <div class="dropdown-item"><a href="./login.jsp" style="text-decoration: none; color: black" ><strong class="text-uppercase">Login</strong></a></div>
                          <%
                          }
                       %>
                              
                              <!--wishlist-->
                      
                              <!--Logout-->
                              <%
                          if (userId != -1){
                          %>
                          <div class="dropdown-item"><a onclick="logOut();" style="text-decoration: none; color: black; cursor: pointer" ><strong class="text-uppercase">
                      
                              Logout</strong></a></div>
                          <%}%>      
                              
                      
                    </div>
                      
                  </div>
                          
                </div>
                    
                 <div class="nav-item navbar-icon-link" data-bs-toggle="search">
                     <a href="#/cart" style="color:black">
                     <svg class="svg-icon">
                    <use xlink:href="#cart-1"> </use>
                  </svg>
                  </a>
                </div> 
                </div>
              </div>
            </div>
          </div>
        </nav>
        <!-- /Navbar -->
        
      </header>

  <div ng-view>
      
  </div>
  <a name="footer">
    <footer class="main-footer" name="footer">
      <!-- Services block-->
      <div class="bg-gray-100 text-dark-700 py-6">
        <div class="container">
          <div class="row">
            <div class="col-lg-4 service-column">
              <svg class="svg-icon service-icon">
                <use xlink:href="#delivery-time-1"> </use>
              </svg>
              <div class="service-text">
                <h6 class="text-uppercase">Free shipping</h6>
              </div>
            </div>
            <div class="col-lg-4 service-column">
              <svg class="svg-icon service-icon">
                <use xlink:href="#money-1"> </use>
              </svg>
              <div class="service-text">
                <h6 class="text-uppercase">Quality guarantee</h6>
              </div>
            </div>
            <div class="col-lg-4 service-column">
              <svg class="svg-icon service-icon">
                <use xlink:href="#customer-support-1"> </use>
              </svg>
              <div class="service-text">
                <h6 class="text-uppercase">020-800-456-747</h6>
                <p class="text-muted fw-light text-sm mb-0">24/7 Available Support</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Main block - menus, subscribe form-->
      <div class="py-6 bg-gray-300 text-muted"> 
        <div class="container">
          <div class="row">
            <div class="col-lg-4 mb-5 mb-lg-0">
              <div class="fw-bold text-uppercase text-lg text-dark mb-3">Urban Closet<span class="text-primary">.</span></div>
              <p>Urban Closet is one of the largest local fashion companies. The customer is at the heart of our unique business model, which includes design, production and sales through our retail network.</p>
              <ul class="list-inline">
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="twitter"><i class="fab fa-twitter"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="facebook"><i class="fab fa-facebook"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="instagram"><i class="fab fa-instagram"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="pinterest"><i class="fab fa-pinterest"></i></a></li>
              </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
              <h6 class="text-uppercase text-dark mb-3">Shop</h6>
              <ul class="list-unstyled">
                <li> <a class="text-muted" href="#woman">For Women</a></li>
                <li> <a class="text-muted" href="#men">For Men</a></li>
                <li> <a class="text-muted" href="#">Shop</a></li>
              </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
              <h6 class="text-uppercase text-dark mb-3">Company</h6>
              <ul class="list-unstyled">
                <li> <a class="text-muted" href="login.jsp">Login</a></li>
                <li> <a class="text-muted" href="signup.jsp">Register</a></li>
                <li> <a class="text-muted" href="#">Wishlist</a></li>
                <li> <a class="text-muted" href="#new">Our Products</a></li>
                <li> <a class="text-muted" href="#">Checkouts</a></li>
              </ul>
            </div>
            <div class="col-lg-4">
                <h6 class="text-uppercase text-dark mb-3">Contact Us Via Mail</h6>
                <h5 class="text-muted">urbancloset4321@gmail.com</h5>
                
                
            </div>
          </div>
        </div>
      </div>
      <!-- Copyright section of the footer-->
      <div class="py-4 fw-light  text-gray-300" style="background-color: #5252ed;">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
              <p class="mb-md-0">&copy; 2020 Your company.  All rights reserved.</p>
            </div>
            
          </div>
        </div>
      </div>
    </footer>
  </a>
<!-- JavaScript files-->
    <script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite - 
      //   see more here 
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
      function injectSvgSprite(path) {
      
          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      }
      // this is set to Bootstrapious website as you cannot 
      // inject local SVG sprite (using only 'icons/orion-svg-sprite.a4dea202.svg' path)
      // while using file:// protocol
      // pls don't forget to change to your domain :)
      injectSvgSprite('https://demo.bootstrapious.com/sell/1-2-0/icons/orion-svg-sprite.svg'); 
      
    </script>
  <!-- jQuery-->
  <!--<script src="./js/jquery.min.js"></script>-->
<!-- Bootstrap JavaScript Bundle (Popper.js included)-->
<script src="./js/bootstrap.bundle.min.js"></script>
<!-- Owl Carousel-->
<!--<script src="./js/owl.carousel.js"></script>-->
<!--<script src="./js/owl.carousel2.thumbs.min.js"></script>-->
<!-- NoUI Slider (price slider)-->
<script src="./js/nouislider.min.js"></script>
<!-- Smooth scrolling-->
<script src="./js/smooth-scroll.polyfills.min.js"></script>
<!-- Lightbox gallery-->
<script src="./js/glightbox.min.js"> </script>
<!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
<script src="./js/ofi.min.js"></script>
<script>var basePath = ''</script>
<!--<script src="./js/jquery.zoom.min.js"></script>-->
<!--<script src="./js/jquery.cookie.js"> </script>-->
<script src="./js/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular-route.min.js"></script>
<script src="./js/app.js"></script>
  </body>
  </html>
