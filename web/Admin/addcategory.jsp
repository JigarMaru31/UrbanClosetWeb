<main class="page-center" id="addcategory">
          <article class="sign-up">
            <h1 class="sign-up__title">Add Category</h1>
            <form class="sign-up-form form" method="post" action="../addcategory" enctype="multipart/form-data" >
              <label class="form-label-wrapper">
                <p class="form-label">Category Name</p>
                <input class="form-input" type="text" placeholder="Enter Category Name" name="CategoryName" required>
              </label>
                <label class="form-label-wrapper">
                <p class="form-label">Category Description</p>
                <input class="form-input" type="text" placeholder="Enter Category Description" name="CategoryDescription"required>
              </label>
              <label class="form-label-wrapper">
              <p class="form-label">Main Category</p>
              <select  class = "form-input" name="CategoryId">
                  <option ng-repeat="d in mydata" value="{{d.id}}">{{d.CategoryName}}</option>
              </select>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Category Images</p>
              <input class="form-input" type="file" placeholder="Enter Category Image" name="file-name" required>
            </label>
              <button class="form-btn primary-default-btn transparent-btn" type="submit">ADD</button>
            </form>
          </article>
        </main>