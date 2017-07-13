package com.parking.model.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.Set;

/**
 * Created by Yurii on 17.01.2017.
 */
@Entity
public class Color extends Item<Color> {
    @Column(length = 50,nullable = false)
    private String name;
    @OneToMany(mappedBy = "color")
    private Set<Car> cars;
    public Color() {
    }

    public Color(Long id,String name,Set<Car> cars,Integer enabled) {
        setId(id);
        this.name = name;
        setEnabled(enabled);
        this.cars=cars;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Car> getCars() {
        return cars;
    }

    public void setCars(Set<Car> cars) {
        this.cars = cars;
    }

    @Override
    public String toString() {
        return "Color{id=" + getId() +
                ", name=" + name  +
                ", enabled="+getEnabled()+'}';
    }
}
