package com.parking.model.business.impl;

import com.parking.model.entities.Car;

/**
 * Created by Yurii on 19.01.2017.
 */
public class CarEvent {

        private long eventTime;
        private final long delayTime;
        private Car car;

        public CarEvent(Car car) {
            this.car=car;
            this.delayTime = car.getParking_time()*60*1000;
            start();
        }
        public void start() { // Allows restarting



                eventTime=car.getCheckin_datetime().getTime()+ delayTime;

            //eventTime = System.currentTimeMillis() + delayTime;
        }
        public boolean ready() {
            return System.currentTimeMillis() >= eventTime;
        }
        public Car getCar() {
              return car;
         }
        public void setCar(Car car) {
            this.car=car;
    }
}
