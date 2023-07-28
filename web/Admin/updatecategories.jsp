<link rel="stylesheet" href="../css/alert.css">
<main class="page-center" id="addcategory" ng-repeat="d in mydata" style="margin-bottom: 100px">
          <article class="sign-up">
            <h1 class="sign-up__title">Update Category</h1>
            <form class="sign-up-form form" id="upc" data-category-id="{{d.id}}" onsubmit="return updatecat(this);">
              <label class="form-label-wrapper">
                <p class="form-label">Category Name</p>
                <input class="form-input" type="text" placeholder="Enter Category Name" name="CategoryName" value="{{d.CategoryName}}" required>
              </label>
              <label class="form-label-wrapper">
                <p class="form-label">Category Description</p>
                <input class="form-input" type="text" placeholder="Enter Category Description" name="CategoryDescription" value ="{{d.CategoryDescription}}" required>
              </label>
                
            </label>
              
            <button class="form-btn primary-default-btn transparent-btn" type="submit">ADD</button>
            </form>
          </article>
        </script>


        </main>

