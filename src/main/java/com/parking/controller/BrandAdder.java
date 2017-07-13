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
@WebServlet("/addBrand")
public class BrandAdder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Brand brand = new Brand(null,
                request.getParameter("name"),
                null,
                1
        );

        SQLDAOSingleton.getInstance(Brand.class).add(brand);
        response.sendRedirect("/brands");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
