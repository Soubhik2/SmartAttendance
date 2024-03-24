package com.example.attendance.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.attendance.entites.AttendanceLog;

public interface AttendanceLogRep extends CrudRepository<AttendanceLog, Integer>{
	
	@Query(value = "SELECT * FROM `attendance_log` WHERE `seid` = ?1 AND `AUP` LIKE %?2%", nativeQuery = true)
	public List<AttendanceLog> getAttendance(int seid, String AUP);
	
}
