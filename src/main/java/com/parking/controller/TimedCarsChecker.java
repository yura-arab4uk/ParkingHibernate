package com.parking.controller;

import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.parking.model.business.impl.singleton.ParkingSingleton;
import com.parking.model.business.impl.singleton.SQLDAOSingleton;
import com.parking.model.entities.Car;
import com.parking.model.entities.CarRider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Yurii on 21.01.2017.
 */
@WebServlet("/checkTimedCars")
public class TimedCarsChecker extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strId = request.getParameter("id");
        boolean write=true;
        Long id=new Long(0);
        if (!strId.equals("")) {
            write=false;
            id = new Long(strId);
        }
        List<Car> carsToDisplay=new ArrayList<>();

        for (Car car: ParkingSingleton.getInstance().timedCars){
            if (write) carsToDisplay.add(car);
            if (car.getId().equals(id)) write=true;
        }
        List<CarRider> carRidersToDisplay=new ArrayList<>();
        for (Car car:carsToDisplay) {
            CarRider carRider=SQLDAOSingleton.getInstance(CarRider.class).get(car.getId());
            carRidersToDisplay.add(carRider);
        }
//        Map<Car,CarRider> carsMap = new LinkedHashMap<>();
//        for (int i=0;i<carsToDisplay.size();i++){
//            carsMap.put(carsToDisplay.get(i),carRidersToDisplay.get(i));
//        }
        Object[][] carsArray = new Object[carsToDisplay.size()][2];
        for (int i=0;i<carsToDisplay.size();i++){
            carsToDisplay.get(i).setCarRider(null);
            carRidersToDisplay.get(i).setCar(null);
            carsArray[i][0]=carsToDisplay.get(i);
            carsArray[i][1]=carRidersToDisplay.get(i);
        }
        ObjectMapper mapper = new ObjectMapper();
        mapper.setVisibilityChecker(mapper.getVisibilityChecker().withFieldVisibility(Visibility.ANY));
        String carsJson=mapper.writeValueAsString(carsArray);
        System.out.println("JSON"+carsJson);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(carsJson);
    }
}
