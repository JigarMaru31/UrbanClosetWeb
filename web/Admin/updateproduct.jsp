<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.urbancloset.servlets.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.JSONArray"%>
<main class="page-center" id="addproduct" style="margin-bottom: 100px;" ng-repeat="d in mydata">
        <article class="sign-up">
          <h1 class="sign-up__title">Update Product</h1>
          <form class="sign-up-form form" id="upd" data-product-id="{{d.productid}}" onsubmit="return update(this);">
            <label class="form-label-wrapper">
              <p class="form-label">Product Name</p>
              <input class="form-input" type="TEXT" placeholder="Enter Product Name" name = "ProductName" id="pname"value="{{d.ProductName}}" required>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Product Description</p>
              <input class="form-input" type="text" placeholder="Enter Product Description" name = "ProductDescription" id="pdes"  value="{{d.ProductDescription}}" required>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Product Price</p>
              <input class="form-input" type="text" placeholder="Enter Product Price" name = "ProductPrice" id="pprice" value="{{d.ProductPrice}}" required>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Product Colour</p>
              <input class="form-input" type="text" placeholder="Enter Product Colour"name = "ProductColour" id="pcolour" value="{{d.ProductColour}}" required>
            </label>
            <label class="form-label-wrapper">
              <p class="form-label">Product Quantity</p>
              <input class="form-input" type="text" placeholder="Enter Product Quantity" name = "ProductQuantity" id="pquantity" value="{{d.ProductQuantity}}" required>
            </label>
               <label class="form-label-wrapper">
              <p class="form-label">Product Size</p>
              <input class="form-input" type="text" placeholder="Enter Product Size" name = "ProductSize" id="pquantity" value="{{d.ProductSize}}" required>
            </label>
              <label class="form-label-wrapper">
              <p class="form-label">Product Category</p>
              <select  class = "form-input" name="ProductCategory">
                      <%
                          String cat = "Select * from categorydetails";
                          Connection con = DbConnection.connect();
                          Statement stmt = con.createStatement();
                          ResultSet rs; 
                           rs = stmt.executeQuery(cat);

                           while(rs.next()) 
                           {
                               
                           %>
                           <option value="<%out.println(rs.getString("id"));%>"> <%out.println(rs.getString("CategoryName"));%></option>
                           <%
                               }
                      %>
              </select>
            </label>
              <button class="form-btn primary-default-btn transparent-btn"  type="submit" >ADD</button>
          </form>
        </article>
      
      </main>