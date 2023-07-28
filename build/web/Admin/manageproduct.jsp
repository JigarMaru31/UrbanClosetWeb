<style>
    tbody tr:nth-child(odd) {
   background-color: #f8f8f8
}

tbody tr:nth-child(even) {
   background-color: #f8f8f8;
}
</style>
<div class="row">&nbsp; </div>
<main class="page-center" style="margin-bottom:100px;">
                    <h3 class="sign-up__title">Products</h3>

<div class="container">
    
               <div class="row">
          <div class="col-lg-12">
            
            <article class="white-block">
              <div class="top-cat-title">
              </div>
                <table>
                    <thead>
                        <tr>
                        <th>
                            Product Image
                        </th>
                        <th>
                            Product Name
                        </th>
                        <th>
                            Product Quantity
                        </th>
                        <th>
                            Product Price
                        </th>
                        <th>
                            Product Colour
                        </th>
                        <th>
                            Action
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="d in mydata">
                        <td style="text-align: center; vertical-align: central;">
                            <img src="../images/{{d.image}}" style="width:60px; height: 80px" >
                        </td>
                        <td style="text-align: center; vertical-align: central;">
                            <h4>{{d.ProductName}}</h4>
                        </td>
                        <td style="text-align: center; vertical-align: central;">
                            <h4>{{d.ProductQuantity}}</h4>
                        </td>
                        <td style="text-align: center; vertical-align: central;">
                            <h4>{{d.ProductPrice}}</h4>
                        </td>
                        <td style="text-align: center; vertical-align: central;">
                            <h4>{{d.ProductColour}}</h4>
                        </td >
                        <td style="list-style-type:none; text-align: center; vertical-align: central;">
                            <a href="#/updateproduct/{{d.productid}}"><li style="display: inline" class="bi bi-pencil-fill"></li></a>
                            <a data-product-id="{{d.productid}}" onclick="return deleteproduct(this)"><li style="display:inline" class="bi bi-trash-fill"></li></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </article>
          </div>
        </div>
    </div>
    </main>