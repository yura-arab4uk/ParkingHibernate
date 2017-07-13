package com.parking.controller;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;

/**
 * Created by Yurii on 17.01.2017.
 */
@WebServlet("")
public class Home extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {


        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request,response);
    }
}
