
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vivek
 */
@WebServlet(name = "getuser", urlPatterns = {"/getuser"})
public class getuser extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try 
        {
            HttpSession session = request.getSession();
            Object data = session.getAttribute("UserID");
            int userId = -1;
    
            if (data != null)
                userId = Integer.parseInt(data.toString());
            Connection con = DbConnection.connect();
            String selectproduct = "SELECT  useraddress.*, userdetails.* FROM useraddress INNER JOIN userdetails ON useraddress.Userid = userdetails.userid where userdetails.userid="+userId+"";
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
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out  = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8"); 
        JsonResponse jsonResponse = new JsonResponse();

        try 
        {
            HttpSession session = request.getSession();
            Object data = session.getAttribute("UserID");
            int userId = -1;

            if (data != null)
              userId = Integer.parseInt(data.toString());
            int uid = Integer.parseInt(request.getParameter("uid")) ;
//           out.println(uid);
            String uname = request.getParameter("uname");
//            out.println(uname);
            String uemail = request.getParameter("uemail");
//            out.println(uemail);
            String uphno = request.getParameter("uphno");
//            out.println(uphno);
            String add = request.getParameter("add");
//            out.println(add);

            PreparedStatement stmt;
            Connection con = DbConnection.connect();
            String updateuser = "update userdetails set UserName=? , UserEmail=?,UserPhNo=? where userid="+userId+"";
            stmt = con.prepareStatement(updateuser);
            stmt.setString(1, uname);
            stmt.setString(2, uemail);
            stmt.setString(3, uphno);
            stmt.executeUpdate();
            String updateuseradd = "update useraddress set Address1=?  where Userid="+userId+"";
            stmt = con.prepareStatement(updateuseradd);
            stmt.setString(1, add);
            int check = stmt.executeUpdate();
            
                if(check > 0)
                {
                    jsonResponse.setStatus(true);
                    jsonResponse.setMessage("User details Updated.");
                    
                }
                else
                {
                    jsonResponse.setStatus(false);
                    jsonResponse.setMessage("Error In updating USerdetails .");
                }
            
            
        } catch (Exception e) {
            out.print(e);
        }
                    out.println(new Gson().toJson(jsonResponse));

    }



}
