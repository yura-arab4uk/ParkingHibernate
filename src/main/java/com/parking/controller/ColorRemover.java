package com.parking.controller;

import com.parking.model.business.impl.singleton.SQLDAOSingleton;
import com.parking.model.entities.Color;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Yurii on 22.01.2017.
 */
@WebServlet("/removeColor")
public class ColorRemover extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long id=new Long(request.getParameter("id"));
        Color color = SQLDAOSingleton.getInstance(Color.class).get(id);

        SQLDAOSingleton.getInstance(Color.class).remove(color);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write("{\"status\":\"ok\"}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
