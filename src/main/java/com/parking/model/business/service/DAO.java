package com.parking.model.business.service;

import java.util.List;

public interface DAO<T> {

	Long add(T item);

	List<Long> add(Iterable<T> items);

	void update(T item);

	void remove(T item);
	
	T get(Long id);

	List<T> getAll();
}