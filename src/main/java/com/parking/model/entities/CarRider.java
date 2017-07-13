package com.parking.model.entities;

import javax.persistence.*;

/**
 * Created by Yurii on 17.01.2017.
 */
@Entity
@Table(name="car_rider")
public class CarRider extends Item<CarRider> {

    @Column(length = 50)
    private String name;
    @Column(nullable = false,columnDefinition = "int(10) UNSIGNED")
    private Integer phone_number;
    @OneToOne(optional = false,cascade= CascadeType.ALL, orphanRemoval = true)
    @PrimaryKeyJoinColumn
    private Car car;

    public CarRider() {
    }

    public CarRider(Long id,String name, Integer phone_number,Car car,Integer enabled) {
        setId(id);
        this.name = name;
        this.phone_number = phone_number;
        setEnabled(enabled);
        this.car=car;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(Integer phone_number) {
        this.phone_number = phone_number;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    @Override
    public String toString() {
        return "CarRider{id=" + getId() +
                ", name=" + name +
                ", phone_number=" + phone_number +
                ", enabled="+getEnabled()+'}';
    }
}
