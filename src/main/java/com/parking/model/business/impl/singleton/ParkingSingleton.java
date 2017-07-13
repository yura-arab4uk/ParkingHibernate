package com.parking.model.business.impl.singleton;

import com.parking.model.business.impl.Parking;

/**
 * Created by Yurii on 19.01.2017.
 */
public class ParkingSingleton {

    private static Parking parking = new Parking();

    private ParkingSingleton() {
    }

    public static Parking getInstance() {
        return parking;
    }
}
