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
@WebServlet(name = "deletecategory", urlPatterns = {"/deletecategory"})
public class deletecategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
                    JsonResponse jsonResponse = new JsonResponse();

        try 
        {
            String id = request.getParameter("id");
//            out.println(id);
            Connection con = DbConnection.connect();
            String deleteproduct = "DELETE FROM productdetails WHERE Categoryid = '"+id+"' ";
            PreparedStatement stmt;
            stmt= con.prepareStatement(deleteproduct);
            String deletecategory = "DELETE FROM categorydetails WHERE id = '"+id+"' ";
            stmt = con.prepareStatement(deletecategory);
            
            int check = stmt.executeUpdate();
            
            
                if(check > 0)
                {
                    jsonResponse.setStatus(true);
                    jsonResponse.setMessage("Category Removed.");
                    
                }
                else
                {
                    jsonResponse.setStatus(false);
                    jsonResponse.setMessage("Error In Removing Category.");
                }
            
            
            
        } catch (Exception e) {
            out.println();
        }
        out.println(new Gson().toJson(jsonResponse));

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
