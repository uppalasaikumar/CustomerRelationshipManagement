package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.luv2code.springdemo.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	//inject hibernate session Factory
	
	@Autowired
	private SessionFactory sesssionFactory;
	
	
	@Override
	public List<Customer> getCustomers() {
		
		//get current hibernate session
		Session currentSession = sesssionFactory.getCurrentSession();
		
		//query
		Query<Customer> theQuery = currentSession.createQuery("from Customer order by lastName", Customer.class);
		
		//execute and get result list
		
		List<Customer> customers = theQuery.getResultList();
		
		return customers;
	}


	@Override
	public void saveCustomer(Customer theCustomer) {


		Session currentSession = sesssionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(theCustomer);
	
		
	}


	@Override
	public Customer getCustomers(int theId) {
		Session currentSession = sesssionFactory.getCurrentSession();
		
		Customer theCustomer = currentSession.get(Customer.class, theId);
		
		return theCustomer;
	}


	@Override
	public void deleteCustomer(int theId) {
		Session currentSession = sesssionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from Customer where id=:customerId");
		theQuery.setParameter("customerId", theId);
		
		theQuery.executeUpdate();
		
	}




}



















