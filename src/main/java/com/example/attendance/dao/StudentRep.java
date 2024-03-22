package com.example.attendance.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.attendance.entites.Student;

@Repository
public interface StudentRep extends CrudRepository<Student, Integer> {
//	public List<Student> findByName(String name);
	
//	@Query("SELECT * FROM `student` WHERE `name` LIKE \"%?1%\"")
//	@Query(value = "SELECT * FROM student WHERE name LIKE %?1%", nativeQuery = true)
//	public List<Student> searchByName(String name);
//	
//	 @Query("SELECT s FROM Student s WHERE s.name = :name")
//	 List<Student> getByName(@Param("name") String name);
//	
//	public List<Student> findByNameLike(String name);
}
