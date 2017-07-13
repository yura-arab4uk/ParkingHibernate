package com.parking.model.entities;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Yurii on 17.01.2017.
 */
@Entity
public class Car extends Item<Car> implements Comparable<Car> {
    @Column(nullable = false,length=10)
    private String car_number;
    @Column(nullable = false,columnDefinition = "DATETIME",unique = true)
    private Timestamp checkin_datetime;
    @Column(columnDefinition = "DATETIME")
    private Timestamp checkout_datetime;
    @Column(length = 20,columnDefinition = "bigint UNSIGNED")
    private Long parking_time;
    @ManyToOne
    @JoinColumn(name="brand_id")
    private Brand brand;
    @ManyToOne
    @JoinColumn(name="color_id")
    private Color color;
    @OneToOne(mappedBy="car")
    private CarRider carRider;
    public Car() {
    }

    public Car(Long id,String car_number, Timestamp checkin_datetime, Timestamp checkout_datetime, Long parking_time, Brand brand, Color color,CarRider carRider,Integer enabled) {
        setId(id);
        this.car_number = car_number;
        this.checkin_datetime = checkin_datetime;
        this.checkout_datetime = checkout_datetime;
        this.parking_time = parking_time;
        this.brand = brand;
        this.color = color;
        this.carRider=carRider;
        setEnabled(enabled);
    }

    public String getCar_number() {
        return car_number;
    }

    public void setCar_number(String car_number) {
        this.car_number = car_number;
    }

    public Timestamp getCheckin_datetime() {
        return checkin_datetime;
    }

    public void setCheckin_datetime(Timestamp checkin_datetime) {
        this.checkin_datetime = checkin_datetime;
    }

    public Timestamp getCheckout_datetime() {
        return checkout_datetime;
    }

    public void setCheckout_datetime(Timestamp checkout_datetime) {
        this.checkout_datetime = checkout_datetime;
    }

    public Long getParking_time() {
        return parking_time;
    }

    public void setParking_time(Long parking_time) {
        this.parking_time = parking_time;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public CarRider getCarRider() {
        return carRider;
    }

    public void setCarRider(CarRider carRider) {
        this.carRider = carRider;
    }

    @Override
    public String toString() {
        return "Car{id=" + getId() +
                ", car_number=" + car_number +
                ", checkin_datetime=" + checkin_datetime +
                ", checkout_datetime=" + checkout_datetime +
                ", parking_time=" + parking_time +
                ", brand_id=" + brand.getId() +
                ", color_id=" + color.getId() +
                ", enabled="+getEnabled()+


                '}';
    }



    @Override
    public int compareTo(Car o) {
        return (this.getId() < o.getId()) ? -1 : (this.getId() == o.getId()) ? 0 : 1;
    }

    @Override
    public int hashCode() {
        int result = car_number != null ? car_number.hashCode() : 0;
        result = 31 * result + (checkin_datetime != null ? checkin_datetime.hashCode() : 0);
        return result;
    }
}
