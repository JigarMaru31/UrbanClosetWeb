var app = angular.module("App", ["ngRoute"])
app.config(function($routeProvider) {
  $routeProvider
        .when("/addproduct", {
        templateUrl: "./addproduct.jsp",
        controller: "managecategories",
      })
        .when("/", {
        templateUrl: "./dashboard.jsp",
        controller:"dashboardcontroller",
      })
        .when("/manageorders", {
        templateUrl: "./manageorders.jsp",
        controller:"manageorder",
      })
      .when("/addcategory", {
        templateUrl: "./addcategory.jsp",
        controller: "managecategories",
      })
      .when("/managecategories", {
        templateUrl: "./managecategories.jsp",
        controller: "managecategories",
      })
      .when("/manageproduct", {
        templateUrl: "./manageproduct.jsp",
        controller: "manageproduct"
      })
      .when("/updateproduct/:id", {
        templateUrl: "./updateproduct.jsp",
        controller: "updatecontroller",
      })
      .when("/updatecategories/:id", {
        templateUrl: "./updatecategories.jsp",
        controller: "updatecategories",
      })
      
      .otherwise({redierectTo: "/"})
})



app.controller('manageproduct',['$scope','$http',function($scope,$http){
            $scope.mydata = null;
            $http.get('../getproduct').success(function(data){
            console.log(data);

            $scope.mydata = data;
            console.log($scope.mydata);
            });
        }]);       
    app.controller('manageorder',['$scope','$http',function($scope,$http){
            $scope.mydata = null;
            $http.get('../getorder').success(function(data){
            console.log(data);

            $scope.mydata = data;
            console.log($scope.mydata);
            });
        }]);    
    app.controller('dashboardcontroller',['$scope','$http',function($scope,$http){
            $scope.mydata = null;
            $http.get('../dashboard').success(function(data){
            console.log(data);

            $scope.mydata = data;
            console.log($scope.mydata);
            });
        }]);   
app.controller('managecategories',['$scope','$http',function($scope,$http){
            $scope.mydata = null;
            $http.get('../getcategory').success(function(data){
            console.log(data);

            $scope.mydata = data;
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
}]);
app.controller('updatecontroller',['$scope','$http','$routeParams',function($scope,$http,$routeParams){
            $scope.mydata = null;
            $scope.fulldata = null;
            $http.get('../getproduct').success(function(data){
            console.log(data);
            var data_filter = data.filter(element => element.productid == $routeParams.id);
            console.log(data_filter);
            $scope.mydata = data_filter;
            console.log("in controller");
            console.log($scope.mydata);
            });
//            $scope.update = function()
//            {
//                console.log("in function");
//                console.log(angular.element('#upd').serialize());
//                var quantity = document.getElementById("pquantity").value;
//                var colour = document.getElementById("pcolour").value;
//                const id = $routeParams.id;
//                console.log(id)
//                console.log(quantity);
//                console.log(colour);
//                $http({
//                    method: 'post',
//                    url: '../updateproduct?id='+id,
//                    
//                }).then(function (res){
//                    console.log(res.data.message);
//                    if(res.status)
//                    {
//                        window.location.href = "#/cart"; 
//                    }
//                    if(res.data.message == "User Not Logged In")
//                    {
//                        window.location.href = "./login.jsp"; 
//                    }
//                })
//            }
        }]);
app.controller('updatecategories',['$scope','$http','$routeParams',function($scope,$http,$routeParams){
            $scope.mydata = null;
            $scope.fulldata = null;
            $http.get('../getcategory').success(function(data){
            console.log(data);
            $scope.fulldata = data;
            console.log($scope.fulldata);
            var data_filter = data.filter(element => element.id == $routeParams.id);
            console.log(data_filter);
            $scope.mydata = data_filter;
            console.log($scope.mydata);
            });
        }]);  
    
//.directive('onFinishRender', function($timeout){
//    return{
//        link:function($scope,element,attr){
//            if($scope.$last ==true)
//            {
//                $timeout(function(){
//                    $scope.$emit('ngRepeatFinished');
//                })
//            }
//        }
//    }
//})
    
//ajax
function update(e)
            {
                let formData = $('#upd').serialize();
                let id = e.getAttribute("data-product-id");
                var alert = document.getElementById("alert");
                console.log(id);
                $.ajax({
                    
                    url: '../updateproduct?id='+id,
                    method: 'post',
                    accepts: 'application/json;charset=utf8',
                    data: formData,
                    processData: false,
                    success: function (res)
                    {
                        console.log(res.status);
                        if (res.status)
                        {
                            // stop progress
//                            window.location.href = './login.jsp';
                            alert.classList.add("show");
                            alert.classList.remove("hide");
                        }
                        else
                        {
                            alert("not updatde");
                        }
                    }
                });
                
                // start progress bar
                
                return false;
            }   
function updatecat(e)
            {
                let formData = $('#upc').serialize();
                let id = e.getAttribute("data-category-id");
                var alert = document.getElementById("alert");
                var close = document.getElementById("close");
                console.log(id);
                $.ajax({
                    
                    url: '../updatecategory?id='+id,
                    method: 'post',
                    accepts: 'application/json;charset=utf8',
                    
                    data: formData,
                    processData: false,
                    success: function (res)
                    {
                        console.log(res);
                        if (res.status)
                        {
                          
                            M.toast({html:" Category Updated",completeCallback: function(){window.location.reload(true);},nDuration: 200});
                         }
                        else
                        {
                            M.toast({html:"failed to update category",completeCallback: function(){window.location.reload(true);},nDuration: 200});
                        }
                    }
                });
                
                // start progress bar
                
                return false;
            }            
function deleteproduct(e)
            {
                    let id = e.getAttribute("data-product-id");
                    console.log(id);
                    $.ajax({
                    url: "../deleteproduct?id=" + id,
                    method: 'get',
                    accepts: 'application/json;charset=utf8',
                    processData: false,
                    success: function (res)
                    {
                        console.log(res);
                        
                        if (!res.status)
                            window.location.reload(true);
                    }
                });
            }    
function deletecategory(e)
            {
                    let id = e.getAttribute("data-category-id");
                    $.ajax({
                    url: "../deletecategory?id=" + id,
                    method: 'get',
                    accepts: 'application/json;charset=utf8',
                    processData: false,
                    success: function (res)
                    {
                        
                        if (!res.status)
                        {
                            console.log(res);
                            window.location.reload(true);
//                            alert("deleted");
                        }
                        else
                        {
//                            alert("not deleted");
                        }
                    }
                });
            } 
//function addproduct()
//    {
//      let fd= new FormData();
//      let formData = $('#addproduct').serialize();
//      let d = formData.split("&");
//      for(let i=0; i<d.length; i++){
//          fd.append(d[i].split("=")[0], d[i].split("=")[1]);
//      }
//      var files = document.getElementById("files");
//      console.log(fd);
//      for(let i=0; i<3; i++)
//      {
//        fd.append("file-name[]",files.files[i],files.files[i].name);
//      }
//      $.ajax({
//        url: '../addproduct',
//        method: 'put',
//        accepts: 'application/json;charset=utf8',
//        data: fd,
//        processData: false,
//        success: function (res)
//        {
//          console.log(res.status);
//
////          if (res.status)
////          {
////            // stop progress
////            window.location.reload(true);
////
////          }
////          else
////          {
////            window.location.href = '#/';
////          }
//        }
//      });
//       return false;
//    }
function logOut()
            {
                $.ajax({
                    url: '../adminlogin',
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
function changestatus(e)
{
                    let id = e.getAttribute("data-id");
                    let status = document.getElementById(id).value
                    
                    $.ajax({
                    url: "../getorder?id=" + id+'&status='+status,
                    method: 'post',
                    accepts: 'application/json;charset=utf8',
                    processData: false,
//                    success: function (res)
//                    {
//                        
//                        if (!res.status)
//                        {
//                            console.log(res);
//                            window.location.reload(true);
////                            alert("deleted");
//                        }
//                        else
//                        {
////                            alert("not deleted");
//                        }
//                    }
                });
}