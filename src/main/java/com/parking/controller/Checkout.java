package com.parking.controller;

import com.parking.model.business.impl.singleton.ParkingSingleton;
import com.parking.model.business.impl.singleton.SQLDAOSingleton;
import com.parking.model.entities.CarRider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Yurii on 21.01.2017.
 */
@WebServlet("/checkout")
public class Checkout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id=new Long(request.getParameter("id"));
        CarRider carRider = SQLDAOSingleton.getInstance(CarRider.class).get(id);
        SQLDAOSingleton.getInstance(CarRider.class).remove(carRider);
        ParkingSingleton.getInstance().timedCars.remove(carRider.getCar());
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write("{\"status\":\"ok\"}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
