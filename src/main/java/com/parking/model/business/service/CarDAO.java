package com.parking.model.business.service;

import com.parking.model.entities.Car;

/**
 * Created by Yurii on 20.01.2017.
 */
public interface CarDAO extends DAO<Car> {
    Car getLast();
}
