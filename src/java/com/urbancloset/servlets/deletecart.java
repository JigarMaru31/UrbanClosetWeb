package com.urbancloset.servlets;

import com.google.gson.Gson;
import com.urbancloset.models.JsonResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
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
public class deletecart extends HttpServlet {


   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("pid"));
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        JsonResponse jsonResponse = new JsonResponse();
        try {
            
            Connection con = DbConnection.connect();

            PreparedStatement stmt;
            String selectorderedproducts = "delete from orderedproduct where ProductId="+id+" and  Orderid="+orderid+"";
            stmt = con.prepareStatement(selectorderedproducts);
            int check = stmt.executeUpdate();
            
            if(check > 0)
            {
                jsonResponse.setStatus(true);
                jsonResponse.setMessage("product removed from cart");
            }
            else
            {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("error in removing product from cart");
            }
            
        } catch (Exception e) {
            out.println(e);
        }
                out.println(new Gson().toJson(jsonResponse));

    }

    
}
