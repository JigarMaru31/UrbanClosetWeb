package com.urbancloset.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.json.JSONArray;

@WebServlet(name = "getproduct", urlPatterns = {"/getproduct"})
public class getproduct extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        try 
        {

            HttpSession session = request.getSession();
            Object data = session.getAttribute("UserID");
            int userId = -1;
    
            if (data != null)
            userId = Integer.parseInt(data.toString());

            Connection con = DbConnection.connect();
            String selectproduct = "SELECT productimage.*, productdetails.*, categorydetails.* FROM productimage INNER JOIN productdetails ON productimage.Productid=  productdetails.productid INNER JOIN categorydetails ON productdetails.Categoryid = categorydetails.id";
            Statement stmt = con.createStatement();
            ResultSet rs;
            List<Integer> wishlistdata = null;
            if(userId !=-1)
            {
                String selectwishlist = "select ProductId from wishlist where UserId = "+userId+" ";
                 rs = stmt.executeQuery(selectwishlist);
                wishlistdata = new ArrayList<Integer>();
            while(rs.next())
            {
                wishlistdata.add(rs.getInt("ProductId"));
            }
            
            }
            
            
            JSONArray json = new JSONArray();
            rs = stmt.executeQuery(selectproduct);

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
      if(wishlistdata != null)
        obj.put("inwishlist", wishlistdata.indexOf(new Integer(obj.getInt("productid"))) !=-1?true:false);
      else
          obj.put("inwishlist",false);
      json.put(obj);
      obj.toJSONArray(json);
      

    }
        response.setContentType("Application/JSON");
        response.setCharacterEncoding("utf-8");
        out.println(json);
        } 
        catch (Exception e) {
            out.println(e);
        }
    }
    }

   
        
    


