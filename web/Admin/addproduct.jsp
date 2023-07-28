<main class="page-center" id="addproduct" style="margin-bottom: 100px;">
        <article class="sign-up">
          <h1 class="sign-up__title">Add Product</h1>
          <form class="sign-up-form form" id="adddproduct" enctype="multipart/form-data" method="post" action="../addproduct">
            <label class="form-label-wrapper">
              <p class="form-label">Product Name</p>
              <input class="form-input" type="name" placeholder="Enter Product Name" name="ProductName" required>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Product Description</p>
              <input class="form-input" type="text" placeholder="Enter Product Description" name="ProductDescription" required>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Product Price</p>
              <input class="form-input" type="text" placeholder="Enter Product Price" name="ProductPrice" required>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Product Colour</p>
              <input class="form-input" type="text" placeholder="Enter Product Description"name="ProductColour" required>
            </label>
              <label class="form-label-wrapper">
              <p class="form-label">Product Size</p>
              <input class="form-input" type="text" placeholder="Enter Product Size"name="ProductSize" required>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Product Quantity</p>
              <input class="form-input" type="text" placeholder="Enter Product Quantity"name="ProductQuantity" required>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Product Category</p>
              <select  class = "form-input" name="ProductCategory">
                  <option ng-repeat="d in mydata" value="{{d.id}}" >{{d.CategoryName}}</option>
              </select>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Product Images</p>
              <input class="form-input" type="file" placeholder="Enter Product Image" name="file-name" id="files" required multiple>
            </label>
              <button class="form-btn primary-default-btn transparent-btn" type="submit">ADD</button>
          </form>
        </article>
      
      </main>