<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.urbancloset.servlets.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.JSONArray"%>
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
                    <h3 class="sign-up__title">Orders</h3>

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
                            OrderID
                        </th>
                        <th>
                            Date And Time
                        </th>
                        <th>
                            Total Price
                        </th>
                        <th>
                            Current Status
                        </th>
                        <th>
                            Change Status
                        </th>
                    </tr>
                    </thead>
                        <tr ng-repeat="d in mydata">
                        <td style="text-align: center; vertical-align: central;">
                            <h4 class="logo-title">{{d.orderid}}</h4>
                        </td>
                        <td style="text-align: center; vertical-align: central;">
                            <h4 class="logo-title">{{d.Date}}</h4>
                        </td>
                        <td style="vertical-align: central;">
                            <h4>{{d.TotalPrice}}</h4>
                        </td>
                        <td style="vertical-align: central;">
                            <h4 ng-if="d.Statusid===1">Order Placed</h4>
                            <h4 ng-if="d.Statusid===2" >In Cart</h4>
                            <h4 ng-if="d.Statusid===3" >Pending</h4>
                            <h4 ng-if="d.Statusid===4" >Delivered</h4>
                        </td>
                        <td style="vertical-align: central">
                            <select  class = "form-input" name="" id="{{d.orderid}}">
                      <%
                          String cat = "Select * from orderstatus";
                          Connection con = DbConnection.connect();
                          Statement stmt = con.createStatement();
                          ResultSet rs; 
                           rs = stmt.executeQuery(cat);

                           while(rs.next()) 
                           {
                               
                           %>
                           <option  value="<%out.println(rs.getInt("statusid"));%>"> <%out.println(rs.getString("Statusname"));%></option>
                           <%
                               }
                      %>
              </select>
              <button class="form-btn primary-default-btn transparent-btn col-lg-4" data-id="{{d.orderid}}" style="margin-left: 150px" onclick="changestatus(this)">Change Status</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </article>
          </div>
        </div>
    </div>
    </main