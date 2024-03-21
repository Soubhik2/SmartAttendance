package com.example.attendance.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.attendance.entites.Student;
import com.example.attendance.entites.Users;

@Repository
public interface UsersRep extends CrudRepository<Users, Integer> {
	public Users findByEmail(String email);
}
