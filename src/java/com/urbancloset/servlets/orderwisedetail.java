
package com.urbancloset.servlets;

import com.urbancloset.models.JsonResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
@WebServlet(name = "orderwisedetail", urlPatterns = {"/orderwisedetail"})
public class orderwisedetail extends HttpServlet {

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
            
            String  order = "select `order`.*, orderstatus.* from `order` inner join orderstatus on orderstatus.statusid=`order`.Statusid  where Userid="+userId+"";
            stmt = con.prepareStatement(order);
            rs = stmt.executeQuery();
            
            ArrayList<Integer> orderids = new ArrayList<Integer>();
            Dictionary <Integer,String> d = new Hashtable<Integer, String>();
            while(rs.next())
            {
                orderids.add(rs.getInt("orderid"));
                d.put(rs.getInt("orderid"),rs.getString("StatusName"));
            }
         // out.println(orderids);
            JSONArray orderarray = new JSONArray();
            int j;
            for(j=0; j<orderids.size(); j++)
            {
                String  orderproduct = "SELECT `order`.*, orderedproduct.*, productdetails.*, useraddress.*, orderstatus.* FROM orderedproduct INNER JOIN `order` ON orderedproduct.Orderid = "+orderids.get(j)+" INNER JOIN productdetails ON orderedproduct.Productid = productdetails.productid INNER JOIN useraddress ON `order`.Addressid = useraddress.addressid INNER JOIN orderstatus ON `order`.Statusid = orderstatus.statusid where `order`.Userid = "+userId+" and `order`.`orderid`="+orderids.get(j)+" and `order`.Statusid!=2";
                stmt = con.prepareStatement(orderproduct);
                rs = stmt.executeQuery();
                JSONArray json = new JSONArray();
                JSONArray items = new JSONArray();
                ResultSetMetaData rsmd = rs.getMetaData();
                JSONObject mainObj = new JSONObject();

            int tp = 0;
                try {
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
            mainObj.put("mainorderid",orderids.get(j));
            mainObj.put("status",d.get(orderids.get(j)));
            mainObj.put("totalPrice", tp);
            mainObj.put("items", json);
            orderarray.put(mainObj);
            
                } catch (Exception e) {
                    out.print(e);
                }
            
            }
            response.setContentType("Application/JSON");
            response.setCharacterEncoding("utf-8");            
            out.println(orderarray);
            
        }
        catch(IOException | NumberFormatException | SQLException | ServletException e)
        {
            out.print(e);
        }
        
    }


}
