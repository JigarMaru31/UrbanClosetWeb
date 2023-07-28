
package com.urbancloset.servlets;

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
public class newproduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
        try 
        {


            Connection con = DbConnection.connect();
            String selectproduct = "select productdetails.*,productimage.*,categorydetails.*from productdetails inner join productimage on productimage.Productid =productdetails.productid inner join categorydetails on productdetails.Categoryid = categorydetails.id order by productdetails.productid desc, productdetails.productid asc limit 4 offset 0;";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(selectproduct);
            JSONArray json = new JSONArray();
            ResultSetMetaData rsmd = rs.getMetaData();
    
    while(rs.next()) {
      int numColumns = rsmd.getColumnCount();
      JSONObject obj = new JSONObject();
      
      for (int i=1; i<numColumns+1; i++) {
        String column_name = rsmd.getColumnName(i);
        if(rsmd.getColumnType(i)==java.sql.Types.ARRAY){
         obj.put(column_name, rs.getArray(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.BIGINT){
         obj.put(column_name, rs.getInt(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.BOOLEAN){
         obj.put(column_name, rs.getBoolean(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.BLOB){
         obj.put(column_name, rs.getBlob(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.DOUBLE){
         obj.put(column_name, rs.getDouble(column_name)); 
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.FLOAT){
         obj.put(column_name, rs.getFloat(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.INTEGER){
         obj.put(column_name, rs.getInt(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.NVARCHAR){
         obj.put(column_name, rs.getNString(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.VARCHAR){
         obj.put(column_name, rs.getString(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.TINYINT){
         obj.put(column_name, rs.getInt(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.SMALLINT){
         obj.put(column_name, rs.getInt(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.DATE){
         obj.put(column_name, rs.getDate(column_name));
        }
        else if(rsmd.getColumnType(i)==java.sql.Types.TIMESTAMP){
        obj.put(column_name, rs.getTimestamp(column_name));   
        }
        else{
         obj.put(column_name, rs.getObject(column_name));
        }
      }

      json.put(obj);
      obj.toJSONArray(json);
      
      


      
    }
            
      out.println(json);

        } 
        catch (Exception e) {
            out.println(e);
        }
    }


}
