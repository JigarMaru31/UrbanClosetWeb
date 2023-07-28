<style>
    tbody tr:nth-child(odd) {
   background-color: #F8F8F8;
}

tbody tr:nth-child(even) {
   background-color: #F8F8F8;
}
</style>
<div class="row">&nbsp; </div>
<main class="page-center" style="margin-bottom:100px;">
                    <h3 class="sign-up__title">Categories</h3>

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
                            Category Image
                        </th>
                        <th>
                            Category Name
                        </th>
                        <th>
                            Category Description
                        </th>
                        <th>
                            Action
                        </th>
                    </tr>
                    </thead>
                        <tr ng-repeat="d in mydata">
                        <td style="text-align: center; vertical-align: central;">
                            <img src="../images/{{d.catimage}}" style="width:60px; height: 80px" >
                        </td>
                        <td style="text-align: center; vertical-align: central;">
                            <h4 class="logo-title">{{d.CategoryName}}</h4>
                        </td>
                        <td style="vertical-align: central;">
                            <h4>{{d.CategoryDescription}}</h4>
                        </td>
                        </td >
                        <td style="list-style-type:none; text-align: center; vertical-align: central;">
                            <a href="#updatecategories/{{d.id}}"><li style="display: inline" class="bi bi-pencil-fill"></li></a>
                            <a data-category-id="{{d.id}}" onclick="return deletecategory(this)"><li style="display:inline" class="bi bi-trash-fill"></li></a>
                                                        
                        </td>
                    </tr>
                    </tbody>
                </table>
            </article>
          </div>
        </div>
    </div>
    </main>