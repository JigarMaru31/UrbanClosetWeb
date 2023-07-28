<!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title">Dashboard</h2>
        <div class="row stat-cards">
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Total Users</p>
                <p class="stat-cards-info__progress">
                    <span class="stat-cards-info__profit success" >
                        <h2>{{mydata.user[0].productcount}}</h2>
                  </span>
                </p>
              </div>
            </article>
          </div>
            <div class="col-md-6 col-xl-12">&nbsp;</div>
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Total Products</p>
                <p class="stat-cards-info__progress">
                    <span class="stat-cards-info__profit success" >
                        <h2>{{mydata.product[0].productcount}}</h2>
                  </span>
                </p>
              </div>
            </article>
          </div>
            <div class="col-md-6 col-xl-12">&nbsp;</div>
            <div class="col-md-6 col-xl-12 ">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Total Categories</p>
                <p class="stat-cards-info__progress">
                    <span class="stat-cards-info__profit success" >
                        <h2>{{mydata.category[0].productcount}}</h2>
                  </span>
                </p>
              </div>
            </article>
          </div>
            <div class="col-md-6 col-xl-12">&nbsp;</div>
          <div class="col-md-6 col-xl-12">
            <article class="stat-cards-item">
              <div class="stat-cards-info">
                <p class="stat-cards-info__num">Total Orders</p>
                <p class="stat-cards-info__progress">
                    <span class="stat-cards-info__profit success" >
                        <h2>{{mydata.order[0].productcount}}</h2>
                  </span>
                </p>
              </div>
            </article>
          </div>
          
        </div>
       
            
            
      </div>
    </main>
