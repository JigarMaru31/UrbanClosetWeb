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
 * @author Lenovo
 */
@WebServlet(name = "addproduct", urlPatterns = {"/addproduct"})
public class addproduct extends HttpServlet {

    
    private static String uploadPath;
    private static final long serialVersionUID = 1L;
    
    // upload settings
   
    @Override
    public void init()
    {
//        this.uploadPath = getServletContext().getRealPath("/") + "images";
        uploadPath = "D:/Files/UrbanClosetApache/web/images";
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                       PrintWriter out = response.getWriter();

        
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
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
            String[] ProductName = d.get("ProductName");
            String[] ProductDes = d.get("ProductDescription");
            String[] ProductPrice = d.get("ProductPrice");
            String[] ProductSize = d.get("ProductSize");
            String[] ProductColour = d.get("ProductColour");
            String[] ProductQuantity = d.get("ProductQuantity");
            String[] ProductCategory = d.get("ProductCategory");
            out.println(files[0]);
            out.println(files[1]);
            out.println(files[2]);

            
            String sql = "INSERT INTO productdetails (ProductName,ProductDescription,ProductPrice,ProductSize,ProductColour,ProductQuantity,Categoryid) VALUES(?,?,?,?,?,?,?)";
                    
            PreparedStatement stmt;
                   stmt = con.prepareStatement(sql);
                    stmt.setString(1,ProductName[0]);
                    stmt.setString(2,ProductDes[0]);
                    stmt.setInt(3,Integer.parseInt(ProductPrice[0]));
                    stmt.setString(4,ProductSize[0]);
                    stmt.setString(5,ProductColour[0]);
                    stmt.setInt(6,Integer.parseInt(ProductQuantity[0]));
                    stmt.setInt(7,Integer.parseInt(ProductCategory[0]));

                    int j = stmt.executeUpdate();
            
            String Pdetails = "Select * from productdetails";
            Statement p = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
            ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = p.executeQuery(Pdetails);
            int lastid=0;
            if(rs.last())
            {
                lastid = rs.getInt("productid");
            }
            
            out.print(lastid);
            String insertimage = "INSERT INTO productimage(image,image2,image3,Productid) VALUES(?,?,?,?)";
             stmt = con.prepareStatement(insertimage);
                    stmt.setString(1,files[0]);
                    stmt.setString(2,files[1]);
                    stmt.setString(3,files[2]);
                    stmt.setInt(4,(lastid));
             int k = stmt.executeUpdate();
             
            if(k > 0)
            {
                jsonResponse.setStatus(true);
                jsonResponse.setMessage("Product Inserted");
                                out.println("M.toast({html:'inserted'})");

                response.sendRedirect("Admin/index.jsp#/addproduct");

            }
            else
            {
                jsonResponse.setStatus(false);
                jsonResponse.setMessage("Product Not Inserted");
                response.sendRedirect("Admin/index.jsp#/addproduct");
            }
            
        } catch (Exception e) {
            out.print(e);
        }
                        
    }
            

}