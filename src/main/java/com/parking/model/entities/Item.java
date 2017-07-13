package com.parking.model.entities;

import javax.persistence.*;
import java.io.Serializable;

@MappedSuperclass
public class Item<T extends Item<T>> implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@Column(columnDefinition = "bigint(20) UNSIGNED")
    @Column(name = "id", unique = true, nullable = false)

    private Long id;

    @Column(nullable = false,length = 5,columnDefinition = "smallint UNSIGNED DEFAULT 1")
    private Integer enabled;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getEnabled() {
        return enabled;
    }

    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        T item = (T) o;

        return getId() != null ? getId().equals(item.getId()) : item.getId() == null;
    }
}