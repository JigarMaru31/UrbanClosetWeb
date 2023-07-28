
package com.urbancloset.servlets;

import com.urbancloset.models.JsonResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Dictionary;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Vivek
 */
@WebServlet(name = "getorder", urlPatterns = {"/getorder"})
public class getorder extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
        try 
        {
            Connection con = DbConnection.connect();
            String selectorder = "SELECT  `order`.*, orderstatus.*, userdetails.*, orderedproduct.* FROM `order` INNER JOIN orderstatus ON `order`.Statusid = orderstatus.statusid INNER JOIN orderedproduct ON orderedproduct.Orderid = `order`.orderid INNER JOIN userdetails ON `order`.Userid = userdetails.userid where `order`.Statusid!=2";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(selectorder);
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();

               try {
                   response.setContentType("application/json");
                   response.setCharacterEncoding("UTF-8");
        
        
        JsonResponse jsonResponse = new JsonResponse();
                   
            response.setContentType("text/html");
            Connection con = DbConnection.connect();
            
            int id = Integer.parseInt(request.getParameter("id"));
//            out.println(id);
            int status = Integer.parseInt(request.getParameter("status"));
//            out.println(status);
            String sql = "update `order` set Statusid=? where orderid="+id+"";
                    
            PreparedStatement stmt;
                   stmt = con.prepareStatement(sql);
                    stmt.setInt(1, status);
             int k = stmt.executeUpdate();
             
            if(k > 0)
            {
                jsonResponse.setStatus(true);
                jsonResponse.setMessage("Status Updated");
                out.println("M.toast({html:'inserted'})");

                response.sendRedirect("Admin/index.jsp#/manageorders");

            }
            else
            {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("errors");
            }
            
        } catch (Exception e) {
            out.print(e);
        }
                        
    }
            
}
