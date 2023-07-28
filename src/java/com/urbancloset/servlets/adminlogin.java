package com.urbancloset.servlets;

import com.google.gson.Gson;
import com.urbancloset.models.JsonResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vivek
 */
@WebServlet(urlPatterns = {"/adminlogin"})
public class adminlogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        session.removeAttribute("AdminID");

        JsonResponse jsonResponse = new JsonResponse();
        jsonResponse.setStatus(true);
        jsonResponse.setMessage("Logged out successfully");

        PrintWriter out = response.getWriter();
        out.println(new Gson().toJson(jsonResponse));
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        JsonResponse jsonResponse = new JsonResponse();
        PrintWriter out = response.getWriter();

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/urbancloset","root","")) 
            {
                String name = request.getParameter("name");
                String pass = request.getParameter("pass"); 
                
                Statement smt = connection.createStatement();
                String sql = "SELECT * from userdetails where UserName = '"+name+"' AND UserPassword = '"+pass+"' AND isAdmin=1" ;
                
                ResultSet resultSet = smt.executeQuery(sql);
                if(resultSet.next())
                {
                    jsonResponse.setStatus(true);
                    jsonResponse.setMessage("Logged in");
                    
                    String userId = resultSet.getString("userid");
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("AdminID", userId);
                    session.setAttribute("type", "admin");
                    
                }
                else
                {
                    jsonResponse.setStatus(false);
                    jsonResponse.setMessage("Wrong username or password");
                }
            }
        }
        catch (ClassNotFoundException | SQLException e)
        {
            jsonResponse.setStatus(false);
            jsonResponse.setMessage("Error: " + e.getMessage());
            out.println(e);
        }
        
        out.println(new Gson().toJson(jsonResponse));
    }
    }


