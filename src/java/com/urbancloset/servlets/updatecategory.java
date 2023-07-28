/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.urbancloset.servlets;

import com.google.gson.Gson;
import com.urbancloset.models.JsonResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jigar
 */
@WebServlet(name = "updatecategory", urlPatterns = {"/updatecategory"})
public class updatecategory extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out  = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8"); 
        JsonResponse jsonResponse = new JsonResponse();

        try 
        {
            int cid = Integer.parseInt(request.getParameter("id")) ;
//           out.println(cid);
            String cname = request.getParameter("CategoryName");
//            out.println(cname);
            String cdes = request.getParameter("CategoryDescription");
//            out.println(cdes);
            Connection con = DbConnection.connect();
            String updatecategory = "UPDATE categorydetails SET CategoryName = ?, CategoryDescription = ? WHERE id =  "+cid+" ";
            PreparedStatement stmt = con.prepareStatement(updatecategory);
            stmt.setString(1,cname);
            stmt.setString(2, cdes);
            int check = stmt.executeUpdate();
            
                if(check  >0)
                {
                    jsonResponse.setStatus(true);
                    jsonResponse.setMessage("category Updated.");
                    
                }
                else
                {
                    jsonResponse.setStatus(false);
                    jsonResponse.setMessage("Error In Updating category .");
                }
            
            
            
        } catch (Exception e) {
            out.println(e);
        }
        out.println(new Gson().toJson(jsonResponse));

    }

}
