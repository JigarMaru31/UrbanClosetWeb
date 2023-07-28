package com.urbancloset.servlets;

import com.google.gson.Gson;
import com.urbancloset.models.JsonResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Vivek
 */
public class addtocart extends HttpServlet {

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
            String selectorderedproducts = "SELECT `productdetails`.*,`productimage`.*,`orderedproduct`.*,`order`.*,`useraddress`.* FROM orderedproduct INNER JOIN `order` ON orderedproduct.Orderid = `order`.orderid INNER JOIN productdetails ON orderedproduct.Productid = productdetails.productid INNER JOIN productimage ON productimage.Productid = productdetails.productid  inner join useraddress on useraddress.Userid = `order`.`Userid` where `order`.Userid = "+userId+" and `order`.Statusid=2";
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
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonResponse jsonResponse = new JsonResponse();
        try {

            int productid = Integer.parseInt(request.getParameter("id"));
            String size = request.getParameter("size");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

//        out.println("productid = " + productid);
//        out.println("size = " + size);
//        out.println("quantity = " + quantity);
            Object data = session.getAttribute("UserID");
            int userId = -1;

            if (data != null) {
                userId = Integer.parseInt(data.toString());
            }
//        out.println(userId);
            Connection con = DbConnection.connect();

            if (userId != -1) {
                PreparedStatement stmt;
                ResultSet rs;

//            out.println("userid = " + userId);
                //select order
                String selectproduct = "select ProductPrice from `productdetails` where productid=" + productid + "";
                stmt = con.prepareStatement(selectproduct);
                rs = stmt.executeQuery();
                int productprice = 0;
                while (rs.next()) {
                    productprice = rs.getInt("ProductPrice");
                }
//            out.println("productprice = " + productprice);
                //select order
                String selectorder = "select orderid,Statusid from `order` where Userid=" + userId + "";
                stmt = con.prepareStatement(selectorder);
                rs = stmt.executeQuery();
                int orderid = 0;
                int stsid=0;
                while (rs.next()) {
                    orderid = rs.getInt("orderid");
                    stsid = rs.getInt("Statusid");
                }
                
//             out.println("orderid = " + orderid);
                //select address
                String selectaddress = "select addressid from `useraddress` where Userid=" + userId + "";
                stmt = con.prepareStatement(selectaddress);
                rs = stmt.executeQuery();
                int addressid = 0;
                while (rs.next()) {
                    addressid = rs.getInt("addressid");
                }
//            out.println("address = " + addressid);
                //select status
                String selectstatus = "select statusid from `orderstatus`";
                stmt = con.prepareStatement(selectstatus);
                rs = stmt.executeQuery();
                int[] statusid = new int[4];
                int i = 0;
                while (rs.next()) {
                    statusid[i] = rs.getInt("statusid");
                    i++;
                }
//                out.println(stsid);
//            out.println("statusid = "+statusid[2]);
                if (orderid > 0 && stsid==2) {
                    //checking if product id already in oderedproduct
                    String selectorderedproducts = "select orderedproductid from `orderedproduct` where Productid=" + productid + " and Orderid="+orderid+"";
                    stmt = con.prepareStatement(selectorderedproducts);
                    rs = stmt.executeQuery();
                    int orderedproductid = 0;
                    while (rs.next()) {
                        orderedproductid = rs.getInt("orderedproductid");
                    }
//                out.println("orderedproductid = " + orderedproductid);
                    if (orderedproductid > 0) {
                        //insert and updated orderedproduct
                        int totalprize = quantity * productprice;
                        String insertorderedproduct = "update`orderedproduct` set Quantity = ? ,TotalPrice=? where Productid = " + productid + "";
                        stmt = con.prepareStatement(insertorderedproduct);
                        stmt.setInt(1, quantity);
                        stmt.setInt(2, totalprize);
                        int op = stmt.executeUpdate();
                        if (op > 0) {
                            jsonResponse.setStatus(true);
                            jsonResponse.setMessage("orderproduct updated");
                        } else {
                            jsonResponse.setStatus(false);
                            jsonResponse.setMessage("orderproduct not updated");
                        }
                    } else {
                        //insert new orderedproduct
                        int totalprize = quantity * productprice;
                        String insertorderedproduct = "insert into `orderedproduct`(Productid,Orderid,Quantity,Size,TotalPrice) values(?,?,?,?,?)";
                        stmt = con.prepareStatement(insertorderedproduct);
                        stmt.setInt(1, productid);
                        stmt.setInt(2, orderid);
                        stmt.setInt(3, quantity);
                        stmt.setString(4, size);
                        stmt.setInt(5, totalprize);
                        int op = stmt.executeUpdate();
                        if (op > 0) {
                            jsonResponse.setStatus(true);
                            jsonResponse.setMessage("orderproduct inserted");
                        } else {
                            jsonResponse.setStatus(false);
                            jsonResponse.setMessage("orderproduct not updated");
                        }
                    }

                } else {
                    //create order and insert in ordered product
                    String insertorder = "insert into `order`(Userid,Addressid,Statusid) values(?,?,?)";
                    stmt = con.prepareStatement(insertorder);
                    stmt.setInt(1, userId);
                    stmt.setInt(2, addressid);
                    stmt.setInt(3, statusid[1]);
                    int o = stmt.executeUpdate();
                    if (o > 0) {
                        jsonResponse.setStatus(true);
                        jsonResponse.setMessage("order created");
                    } else {
                        jsonResponse.setStatus(false);
                        jsonResponse.setMessage("order not created");
                    }
                    String lastorderid = "Select * from `order`";
                    Statement p = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                            ResultSet.CONCUR_READ_ONLY);
                    rs = p.executeQuery(lastorderid);
                    int lastid = 0;
                    if (rs.last()) {
                        lastid = rs.getInt("orderid");
                    }

//            out.print(lastid);
                    //calculate total
                    int totalprize = quantity * productprice;
//                 out.println(totalprize);
                    String insertorderedproduct = "insert into `orderedproduct`(Productid,Orderid,Quantity,Size,TotalPrice) values(?,?,?,?,?)";
                    stmt = con.prepareStatement(insertorderedproduct);
                    stmt.setInt(1, productid);
                    stmt.setInt(2, lastid);
                    stmt.setInt(3, quantity);
                    stmt.setString(4, size);
                    stmt.setInt(5, totalprize);
                    int op = stmt.executeUpdate();
                    if (op > 0) {
                        jsonResponse.setStatus(true);
                        jsonResponse.setMessage("orderproduct inserted");
                    } else {
                        jsonResponse.setStatus(false);
                        jsonResponse.setMessage("orderproduct not created");
                    }
                }

            } else {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("User Not Logged In");
            }

        } catch (Exception e) {
            out.println(e);
        }
        out.println(new Gson().toJson(jsonResponse));

    }

}
