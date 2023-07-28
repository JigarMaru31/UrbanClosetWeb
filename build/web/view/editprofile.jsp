<section class="my-5">
    <div class="container">
        <header class="text-center">
            <h3 class="text-uppercase mb-5">Change Profile Information</h3>
          </header>
        <div class="col-12 col-lg-6 detail-option mb-5"ng-repeat="d in mydata">
            <h4 class="text-uppercase fw-bold">Personal Information</h4>
            <br>
            <label class="detail-option-heading fw-bold">Name</label>
            <input class="form-control detail-text" style="font-size:20px" name="items" type="text" value="{{d.UserName}}" id="uname" >
            <br>
            <label class="detail-option-heading fw-bold">Mobile Number</label>
            <input class="form-control detail-text" style="font-size:20px" name="items" type="text" value="{{d.UserPhNo}}" id="uphno">
            <br>
            <label class="detail-option-heading fw-bold">Email Address</label>
            <input class="form-control detail-text" style="font-size:20px" name="items" type="text" value="{{d.UserEmail}}" id="uemail" >
            <br>
            <label class="detail-option-heading fw-bold">Address</label>
            <textarea class="form-control detail-text" style="font-size:20px" name="items" type="text"  id="add">{{d.Address1}}</textarea>
            <br>
            <button class="btn btn-outline-dark"  data-id="{{d.userid}}" onclick="editprofile(this)">Submit Changes</button>

          </div>
    </div>
    </div>
</section>


