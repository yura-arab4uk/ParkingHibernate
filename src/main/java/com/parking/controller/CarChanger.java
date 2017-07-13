package com.parking.controller;

import com.parking.model.business.impl.CarEvent;
import com.parking.model.business.impl.singleton.ParkingSingleton;
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
import java.util.List;

/**
 * Created by Yurii on 21.01.2017.
 */
@WebServlet("/changeCar")
public class CarChanger extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        CarRider carRider = SQLDAOSingleton.getInstance(CarRider.class).get(new Long(request.getParameter("id")));
        carRider.setName(request.getParameter("name"));
        carRider.setPhone_number(new Integer(request.getParameter("phone_number")));
        Car car = carRider.getCar();
        car.setCar_number(request.getParameter("car_number"));
        car.setParking_time(new Long(request.getParameter("parking_time")));
        car.setBrand(new Brand(new Long(request.getParameter("brand_id")),null,null,null));
        car.setColor(new Color(new Long(request.getParameter("color_id")),null,null,null));
        SQLDAOSingleton.getInstance(CarRider.class).update(carRider);
        List<CarEvent> carEventList=ParkingSingleton.getInstance().carEventList;
        List<Car> timedCars=ParkingSingleton.getInstance().timedCars;
        CarEvent carEvent=null;
        for (int i = 0; i < carEventList.size(); i++) {
            carEvent = carEventList.get(i);
            if (carEvent.getCar().getId().equals(car.getId())) {
                carEventList.remove(i);
                carEventList.add(new CarEvent(car));
            }
        }
        for (int i = 0; i < timedCars.size(); i++) {

            if (timedCars.get(i).getId().equals(car.getId())) {
                timedCars.remove(i);
                carEvent = new CarEvent(car);
                if (carEvent.ready())
                timedCars.add(car);
                else carEventList.add(carEvent);
            }
        }
        response.sendRedirect("/cars");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
