package com.example.attendance.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.attendance.entites.AttendanceLog;
import java.sql.Date;


public interface AttendanceLogRep extends CrudRepository<AttendanceLog, Integer>{
	
	@Query(value = "SELECT * FROM `attendance_log` WHERE `seid` = ?1 AND `AUP` LIKE %?2%", nativeQuery = true)
	public List<AttendanceLog> getAttendance(int seid, String AUP);
	
	@Query(value = "SELECT * FROM `attendance_log` WHERE `roll_no` = ?1 AND `seid` = ?2 AND `AUP` LIKE %?3%", nativeQuery = true)
	public List<AttendanceLog> getAttendance(String roll ,int seid, String AUP);
	
	@Query(value = "SELECT * FROM `attendance_log` WHERE `roll_no` = ?1 AND `seid` = ?2 AND `AUP` LIKE %?3% AND `attendance` = ?4", nativeQuery = true)
	public List<AttendanceLog> getAttendance(String roll ,int seid, String AUP, String attendance);
	
	@Query(value = "SELECT COUNT(*) FROM `attendance_log` WHERE `roll_no` = ?1 AND `seid` = ?2 AND `AUP` LIKE %?3% AND `attendance` = ?4", nativeQuery = true)
	public long countAttendance(String roll ,int seid, String AUP, String attendance);
}
