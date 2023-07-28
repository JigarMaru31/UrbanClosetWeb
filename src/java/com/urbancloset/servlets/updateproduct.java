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
@WebServlet(name = "updateproduct", urlPatterns = {"/updateproduct"})
public class updateproduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try 
        {
            Connection con = DbConnection.connect();
            String updatecategory = "UPDATE productdetails SET ProductName = ProductName, ProductDescription = ProductDescription,ProductPrice = ProductPrice,ProductColour = ProductColour,ProductSize = ProductSize,ProductQuantity = ProductQuantity WHERE Productid ==  id ";
            PreparedStatement stmt = con.prepareStatement(updatecategory);
            int check = stmt.executeUpdate();
            
            JsonResponse jsonResponse = new JsonResponse();
                if(check > 0)
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
            int pid = Integer.parseInt(request.getParameter("id")) ;
           out.println(pid);
            String pname = request.getParameter("ProductName");
//            out.println(pname);
            String pdes = request.getParameter("ProductDescription");
//            out.println(pdes);
            String pcolour = request.getParameter("ProductColour");
//            out.println(pname);
            String psize = request.getParameter("ProductSize");
//            out.println(psize);
            String pquantity = request.getParameter("ProductQuantity");
//            out.println(pquantity);
             String pprice = request.getParameter("ProductPrice");
//            out.println(pprice);
             String pcat = request.getParameter("ProductCategory");

            Connection con = DbConnection.connect();
            String updatecategory = "UPDATE productdetails SET ProductName = ?, ProductDescription = ?,ProductPrice = ?,ProductColour = ?,ProductSize = ?,ProductQuantity = ? WHERE productid =  "+pid+" ";
            PreparedStatement stmt = con.prepareStatement(updatecategory);
            stmt.setString(1, pname);
            stmt.setString(2, pdes);
            stmt.setInt(3, Integer.parseInt(pprice));
            stmt.setString(4, pcolour);
            stmt.setString(5, psize);
            stmt.setInt(6, Integer.parseInt(pquantity) );
//            stmt.setInt(7, Integer.parseInt(, pid);

            int check = stmt.executeUpdate();
            
                if(check > 0)
                {
                    jsonResponse.setStatus(true);
                    jsonResponse.setMessage("product Updated.");
                    
                }
                else
                {
                    jsonResponse.setStatus(false);
                    jsonResponse.setMessage("Error In product category .");
                }
            
            
        } catch (Exception e) {
            out.print(e);
        }
                    out.println(new Gson().toJson(jsonResponse));

    }

}
