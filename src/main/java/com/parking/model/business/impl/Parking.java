package com.parking.model.business.impl;

import com.parking.model.entities.Car;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;

/**
 * Created by Yurii on 19.01.2017.
 */
public class Parking {
    // A class from java.util to hold Event objects:
    public final List<CarEvent> carEventList = new CopyOnWriteArrayList<>();
    public final List<Car> timedCars = new CopyOnWriteArrayList<>();
    public void addCar(Car c) { carEventList.add(new CarEvent(c)); }
    public final Thread thread;
    public Parking(){
        thread=new Thread(){
            @Override
            public void run() {
try {
    while (!Thread.interrupted()) {

        for (CarEvent ce : carEventList)
            if (ce.ready()) {
                System.out.println(ce.getCar());
                timedCars.add(ce.getCar());
                carEventList.remove(ce);
            }
        TimeUnit.MILLISECONDS.sleep(500);

    }
}catch (InterruptedException e){
    System.out.println("Exit from thread");
}
            }

        };
        thread.start();
    }

}
