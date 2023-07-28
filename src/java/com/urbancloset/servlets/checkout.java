
package com.urbancloset.servlets;

import com.google.gson.Gson;
import com.urbancloset.models.JsonResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Vivek
 */
public class checkout extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonResponse jsonResponse = new JsonResponse();
        try {
            Object data = session.getAttribute("UserID");
            int userId = -1;

            if (data != null) {
                userId = Integer.parseInt(data.toString());
            }
            Connection con = DbConnection.connect();

            PreparedStatement stmt;
            ResultSet rs;
            
            String  order = "select * from `order` where Userid="+userId+"";
            stmt = con.prepareStatement(order);
            rs = stmt.executeQuery();
            String selectorderedproducts = "SELECT `productdetails`.*,`productimage`.*,`orderedproduct`.*,`order`.*,`useraddress`.*,`orderstatus`.*  FROM orderedproduct INNER JOIN `order` ON orderedproduct.Orderid = ` INNER JOIN productdetails ON orderedproduct.Productid = productdetails.productid INNER JOIN productimage ON productimage.Productid = productdetails.productid   inner join useraddress on useraddress.Userid = `order`.`Userid` INNER JOIN orderstatus on  orderstatus.statusid = `order`.Statusid where `order`.Userid = 5 and `order`.Statusid!=2";
            stmt = con.prepareStatement(selectorderedproducts);
            JSONArray json = new JSONArray();
            JSONArray items = new JSONArray();
            rs = stmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();

            JSONObject mainObj = new JSONObject();

            int tp = 0;

            while (rs.next()) {
                int numColumns = rsmd.getColumnCount();

                JSONObject obj = new JSONObject();
                for (int i = 1; i < numColumns + 1; i++) {
                    String column_name = rsmd.getColumnName(i);
                    if (rsmd.getColumnType(i) == java.sql.Types.ARRAY) {
                        obj.put(column_name, rs.getArray(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.BIGINT) {
                        obj.put(column_name, rs.getInt(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.BOOLEAN) {
                        obj.put(column_name, rs.getBoolean(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.BLOB) {
                        obj.put(column_name, rs.getBlob(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.DOUBLE) {
                        obj.put(column_name, rs.getDouble(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.FLOAT) {
                        obj.put(column_name, rs.getFloat(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.INTEGER) {
                        obj.put(column_name, rs.getInt(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.NVARCHAR) {
                        obj.put(column_name, rs.getNString(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.VARCHAR) {
                        obj.put(column_name, rs.getString(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.TINYINT) {
                        obj.put(column_name, rs.getInt(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.SMALLINT) {
                        obj.put(column_name, rs.getInt(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.DATE) {
                        obj.put(column_name, rs.getDate(column_name));
                    } else if (rsmd.getColumnType(i) == java.sql.Types.TIMESTAMP) {
                        obj.put(column_name, rs.getTimestamp(column_name));
                    } else {
                        obj.put(column_name, rs.getObject(column_name));
                    }
                }
                json.put(obj);

                tp += rs.getInt("TotalPrice");
            }

            mainObj.put("totalPrice", tp);
            mainObj.put("items", json);

            response.setContentType("Application/JSON");
            response.setCharacterEncoding("utf-8");
            out.println(mainObj);
        } catch (Exception e) {
            out.println(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
                JsonResponse jsonResponse = new JsonResponse();

        try {
            int orderid = Integer.parseInt(request.getParameter("orderid"));
            Connection con = DbConnection.connect();
            String checkout = "update `order` set Statusid = ? where orderid="+orderid+"";
            PreparedStatement stmt = con.prepareStatement(checkout);
            stmt.setInt(1, 1);
            int check = stmt.executeUpdate();
            if(check>0)
            {
                jsonResponse.setStatus(true);
                jsonResponse.setMessage("Order Placed");
            }
            else
            {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("Error in Placeing order");
            }
            }
            

            
         catch (Exception e) {
            out.print(e);
        }
                out.println(new Gson().toJson(jsonResponse));

    }

  

}
