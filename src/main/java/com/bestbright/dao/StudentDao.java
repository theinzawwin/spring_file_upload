package com.bestbright.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bestbright.models.Student;

@Repository
public class StudentDao {
	@Autowired
	SessionFactory sessionFactory;
	public Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void saveStudent(Student std){
		getCurrentSession().save(std);
	}
	public List<Student> getStudentList(){
		return getCurrentSession().createCriteria(Student.class).list();
	}
}
