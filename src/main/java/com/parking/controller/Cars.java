package com.parking.controller;

import com.parking.model.business.impl.singleton.SQLDAOSingleton;
import com.parking.model.entities.Brand;
import com.parking.model.entities.Car;
import com.parking.model.entities.CarRider;
import com.parking.model.entities.Color;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Yurii on 20.01.2017.
 */
@WebServlet("/cars")
public class Cars extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Car> cars = SQLDAOSingleton.getInstance(Car.class).getAll();
        List<CarRider> carRiders = SQLDAOSingleton.getInstance(CarRider.class).getAll();
        Map<Car,CarRider> carsMap = new LinkedHashMap<>();
        for (int i=0;i<cars.size();i++){
            carsMap.put(cars.get(i),carRiders.get(i));
        }

        List<Brand> brands = SQLDAOSingleton.getInstance(Brand.class).getAll();
        Map<Long,Brand> brandsMap = new LinkedHashMap<>();
        for (int i=0;i<brands.size();i++){
            brandsMap.put(brands.get(i).getId(),brands.get(i));
        }
        List<Color> colors = SQLDAOSingleton.getInstance(Color.class).getAll();
        Map<Long,Color> colorsMap = new LinkedHashMap<>();
        for (int i=0;i<colors.size();i++){
            colorsMap.put(colors.get(i).getId(),colors.get(i));
        }

        request.setAttribute("colorsMap", colorsMap);
        request.setAttribute("brandsMap", brandsMap);
        request.setAttribute("carsMap", carsMap);
        request.getRequestDispatcher("/WEB-INF/views/cars.jsp").forward(request,response);
        //response.sendRedirect("/cars.jsp");
    }
}
