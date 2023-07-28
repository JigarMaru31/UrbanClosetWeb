/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.urbancloset.servlets;

import com.urbancloset.models.JsonResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import com.urbancloset.servlets.DbConnection;
import java.util.Dictionary;
import org.json.JSONObject;
import org.json.JSONArray;
import com.urbancloset.servlets.FileUploader;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author Jigar
 */
@WebServlet(name = "addcategory", urlPatterns = {"/addcategory"})
public class addcategory extends HttpServlet {


 private static String uploadPath;
    private static final long serialVersionUID = 1L;
    
    // upload settings
   
    @Override
    public void init()
    {
//        this.uploadPath = getServletContext().getRealPath("/") + "images";
        uploadPath = "D:/";
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                       PrintWriter out = response.getWriter();

        
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
            
            Dictionary<String, String[]> d = FileUploader.fileUpload(request, uploadPath);
            String[] files = d.get("file-name");
            String[] CategoryName = d.get("CategoryName");
            String[] CategoryDes = d.get("CategoryDescription");
            String[] CategoryId = d.get("CategoryId");
            out.println(files[0]);
            out.println(files[1]);
            out.println(files[2]);

            
            String sql = "INSERT INTO categorydetails (CategoryName,CategoryDescription,catimage,Categoryid) VALUES(?,?,?,?)";
                    
            PreparedStatement stmt;
                   stmt = con.prepareStatement(sql);
                    stmt.setString(1,CategoryName[0]);
                    stmt.setString(2,CategoryDes[0]);
                    stmt.setString(3,files[0]);
                    stmt.setInt(4,Integer.parseInt(CategoryId[0]));

                    int j = stmt.executeUpdate();
            
            if(j > 0)
            {
                jsonResponse.setStatus(true);
                jsonResponse.setMessage("Product Inserted");
                response.sendRedirect("Admin/index.jsp#/addcategory");
            }
            else
            {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("Product Not Inserted");
                response.sendRedirect("Admin/index.jsp#/addcategory");
            }
            
        } catch (Exception e) {
            out.print(e.getStackTrace()[0]);
        }
                        
    }
                
}
