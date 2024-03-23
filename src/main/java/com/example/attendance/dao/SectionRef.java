package com.example.attendance.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.attendance.entites.Section;

public interface SectionRef extends CrudRepository<Section, Integer>{
	public List<Section> findByUid(int uid);
}
