package com.parking.controller;

import com.parking.model.business.impl.singleton.SQLDAOSingleton;
import com.parking.model.entities.Brand;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Yurii on 22.01.2017.
 */
@WebServlet("/brands")
public class Brands extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("brands", SQLDAOSingleton.getInstance(Brand.class).getAll());
        request.getRequestDispatcher("/WEB-INF/views/brands.jsp").forward(request,response);
    }
}
