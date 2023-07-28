var app = angular.module("App", ["ngRoute"])
app.config(function($routeProvider) {
  $routeProvider
      .when("/category/:id", {
        templateUrl: "./view/category.jsp",
        controller: "CategoryController",
      })
      .when("/order", {
        templateUrl: "./view/order.jsp",
        controller: "ordercontroller",
      })
      .when("/checkout", {
        templateUrl: "./view/checkout.jsp",
        controller: "viewcartcontroller",
      })
        .when("/", {
        templateUrl: "./view/Home.jsp",
        controller: "HomeController",
      })
      .when("/detail/:id", {
        templateUrl: "./view/detail.jsp",
        controller: "DetailController",
      })
      .when("/wishlist", {
        templateUrl: "./view/wish.jsp",
        controller: "wishlistcontroller"
      })
      .when("/profile", {
        templateUrl: "./view/profile.jsp",
        controller: "usercontroller"
      })
      .when("/editprofile", {
        templateUrl: "./view/editprofile.jsp",
        controller: "usercontroller"
      })
      .when("/cart", {
        templateUrl: "./view/cart.jsp",
        controller: "viewcartcontroller"
      })
      .otherwise({redierectTo: "/"});
});


  
app.controller('wishlistcontroller',function($scope,$http){
            $scope.mydata = null;
            $http.get('./getwishlist').success(function(data){
            console.log(data);
            $scope.mydata = data;
            console.log($scope.mydata);

            });
        });
        
app.controller('usercontroller',function($scope,$http){
            $scope.mydata = null;
            $http.get('./getuser').success(function(data){
            console.log(data);
            $scope.mydata = data;
            console.log($scope.mydata);
            });
        });
app.controller('ordercontroller',function($scope,$http){
            $scope.mydata = null;
            $http.get('./orderwisedetail').success(function(data){
            console.log(data);
            $scope.mydata = data;
            console.log($scope.mydata);

            });
        });        
app.controller('viewcartcontroller',function($scope,$http){
            $scope.mydata = null;
            $http.get('./addtocart').success(function(data){
            console.log(data);
            $scope.mydata = data;
            console.log($scope.mydata);

            });
            
            
        });
        
app.controller('CategoryController',['$scope','$http','$location','$routeParams',function($scope,$http,$location,$routeParams){
            $scope.mydata = null;
            $scope.wishdata = null;
            $http.get('./getproduct').success(function(data){
            console.log(data);
            console.log($routeParams);

            var data_filter = data.filter(element => element.Categoryid == $routeParams.id);
            console.log(data_filter);
            $scope.mydata = data_filter;
            console.log($scope.mydata);
            });
          
        }]);       
app.controller('HomeController',['$scope','$http',function($scope,$http){
    $scope.mydata = null;
    $http.get('./getcategory').success(function(data){
    console.log(data);
    var men_filter = data.filter(element=>element.CategoryId == 6);
    $scope.mendata = men_filter;
    var women_filter = data.filter(element=>element.CategoryId==7);
    $scope.womendata = women_filter;
    });
    $scope.newdata = null;
    $http.get('./newproduct').success(function(data){
    console.log(data);
    $scope.newdata = data;
        console.log($scope.newdata);

    });
}]);

app.controller('DetailController',['$scope','$http','$routeParams',function($scope,$http,$routeParams){
            $scope.mydata = null;
            $scope.fulldata = null;
            $http.get('./getproduct').success(function(data){
            console.log(data);
            $scope.fulldata = data;
            console.log($scope.fulldata);
            var data_filter = data.filter(element => element.productid == $routeParams.id);
            console.log(data_filter);
            $scope.mydata = data_filter;
            console.log($scope.mydata);
            
            });
            $scope.addtocart = function()
            {
                var quantity = document.getElementById("quantity").value;
                var size = document.getElementById("size").value;
                const id = $routeParams.id;
//                console.log(id)
//                console.log(quantity);
                console.log(size);
                $http({
                    method: 'post',
                    url: './addtocart?id='+id+'&quantity='+quantity+'&size='+size,
                    
                })
                        .then(function (res){
                    console.log(res.data.message);
                    if(res.status)
                    {
                        window.location.href = "#/cart"; 
                    }
                    if(res.data.message == "User Not Logged In")
                    {
                        
                        window.location.href = "./login.jsp"; 
                    }
                })
            }
        }]);
app.controller('index',['$scope','$location','$anchorScroll',function($scope,$location,$anchorScroll){
     $scope.scrollTo = function (id) {
                let old = $location.hash();
                console.log(id);
                $location.hash(id);
                $anchorScroll();
                $location.hash(old);
            }
        }]);
    
   
app.directive('onFinishRender', function($timeout){
    return{
        link:function($scope,element,attr){
            if($scope.$last ==true)
            {
                $timeout(function(){
                    $scope.$emit('ngRepeatFinished');
                })
            }
        }
    }
})
//ajax
function addtowishlist(e)
            {
                let id = e.getAttribute("data-product-id");
                let cid = e.getAttribute("data-category-id");
                $.ajax({
                    url: './addtowishlist?id=' + id,
                    method: 'get',
                    accepts: 'application/json;charset=utf8',
                    success: function (res)
                    {
                        console.log(res);
                        
                        if (!res.status)
                        {
                            window.location.reload(true);
                        }
                        else
                        {
                            window.location.href = '#/';
                        }
                    }
                });
            }
function removefromwishlist(e)
            {
                    let id = e.getAttribute("data-product-id");
                    $.ajax({
                    url: './removewishlist?id=' + id,
                    method: 'get',
                    accepts: 'application/json;charset=utf8',
                    success: function (res)
                    {
                        console.log(res);
                        
                        if (!res.status)
                            window.location.reload(true);
                    }
                });
            } 
            
            
 
function updatecart(e)
            {
                let orderid = e.getAttribute("data-order-id");
                let pid = e.getAttribute("data-product-id");
                let quantity = document.getElementById(pid).value;
//                let pd = document.getElementById("pd").getAttribute("data-product-id");
//                let product = document.getElementById("pd");
//                let quantity = document.querySelectorAll("#quan");
                let size = document.getElementById("size").innerHTML;
                console.log(pid);
                console.log(quantity);
                $.ajax({
                    url: './addtocart?id='+pid+'&quantity=' + quantity + '&size='+size,
                    method: 'post',
                    accepts: 'application/json;charset=utf8',
                    success:function (res)
                    {
                        console.log(res);
                        if(res.status)
                        {
                            window.location.reload(true);
                        }
                    }
                   
                });
                
            }
function checkout(e)
            {
                let orderid = e.getAttribute("data-order-id");
//                let pd = document.getElementById("pd").getAttribute("data-product-id");
//                let quantity = document.getElementById("quan").value;
//                let size = document.getElementById("size").innerHTML;
//                console.log(pd);
//                console.log(orderid);
                $.ajax({
                    url: './checkout?orderid='+orderid,
                    method: 'post',
                    accepts: 'application/json;charset=utf8',
                    success:function (res)
                    {
                        console.log(res);
                        if(res.status)
                        {
                            window.location.href="#/order";
                        }
                    }
                   
                });
                
            }
function removecart(e)
            {
                let orderid = e.getAttribute("data-order-id");
                let pid = e.getAttribute("data-id");
                let size = document.getElementById("size").innerHTML;
                console.log(pid);
                console.log(orderid);
                $.ajax({
                    url: '  ./deletecart?pid='+pid+'&orderid=' + orderid,
                    method: 'get',
                    accepts: 'application/json;charset=utf8',
                    success:function (res)
                    {
                        console.log(res);
                        if(res.status)
                        {
                            window.location.reload(true);
                        }
                    }
                   
                });
                
            }
function editprofile(e)
            {
                let uid = e.getAttribute("data-id");
                let uname = document.getElementById("uname").value;
                let uphno = document.getElementById("uphno").value;
                let uemail = document.getElementById("uemail").value;
                let add = document.getElementById("add").value;
                console.log(uid);
                console.log(uname);
                console.log(uphno);
                console.log(uemail);
                console.log(add);
                $.ajax({
                    url: './getuser?uid='+uid+'&uname='+uname+'&uphno='+uphno+'&add='+add+'&uemail='+uemail,
                    method: 'post',
                    accepts: 'application/json;charset=utf8',
                    success:function (res)
                    {
                        console.log(res);
                        if(res.status)
                        {
                            window.location.href="#/profile";
                        }
                    }
                   
                });
            }            