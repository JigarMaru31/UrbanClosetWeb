<section class="my-5">
    <div class="container" >
        <header class="text-center">
            <h3 class="text-uppercase mb-5">Profile</h3>
          </header>
          <div class="col-12 col-lg-6 detail-option mb-5" ng-repeat="d in mydata">
            <h4 class="text-uppercase fw-bold">Personal Information</h4>
            <br>
            <label class="detail-option-heading fw-bold">Name</label>
            <input class="form-control detail-text" style="font-size:20px" name="items" type="text" value="{{d.UserName}}" disabled>
            <br>
            <label class="detail-option-heading fw-bold">Mobile Number</label>
            <input class="form-control detail-text" style="font-size:20px" name="items" type="text" value="{{d.UserPhNo}}" disabled>
            <br>
            <label class="detail-option-heading fw-bold">Email Address</label>
            <input class="form-control detail-text" style="font-size:20px" name="items" type="text" value="{{d.UserEmail}}" disabled>
            <br>
            <label class="detail-option-heading fw-bold">Address</label>
            <textarea class="form-control detail-text" style="font-size:20px" name="items" type="text"  disabled>{{d.Address1}}</textarea>
            <br>
            <a class="btn btn-outline-dark" href = "#editprofile/{{userid}}">Edit Profile</a>

          </div>
    </div>
    </div>
</section>


