package com.parking.model.business.impl.singleton;

import com.parking.model.business.impl.CarRiderSQLDAO;
import com.parking.model.business.impl.SQLDAO;
import com.parking.model.entities.*;

/**
 * Created by Yurii on 18.01.2017.
 */
public class SQLDAOSingleton  {

    private static SQLDAO<Brand> brandSQLDAO = new SQLDAO<>(Brand.class);
    private static SQLDAO<Color> colorSQLDAO = new SQLDAO<>(Color.class);
    private static SQLDAO<Car> carSQLDAO = new SQLDAO<>(Car.class);
    private static SQLDAO<CarRider> carRiderSQLDAO = new CarRiderSQLDAO();

    private SQLDAOSingleton() {
    }

    public static <T extends Item<T>> SQLDAO<T> getInstance(Class<T> tClass) {
        SQLDAO sqldao = null;
        if (tClass.isAssignableFrom(Brand.class)) sqldao=brandSQLDAO;
        else if (tClass.isAssignableFrom(Color.class)) sqldao=colorSQLDAO;
        else if (tClass.isAssignableFrom(Car.class)) sqldao=carSQLDAO;
        else if (tClass.isAssignableFrom(CarRider.class)) sqldao=carRiderSQLDAO;
        return sqldao;
    }
}
