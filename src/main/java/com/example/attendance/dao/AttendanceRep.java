package com.example.attendance.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.attendance.entites.Attendance;
import java.util.List;


@Repository
public interface AttendanceRep extends CrudRepository<Attendance, Integer> {
	public List<Attendance> findBySeid(int seid);
}
