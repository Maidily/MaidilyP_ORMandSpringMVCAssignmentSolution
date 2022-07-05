package com.customer.service;

import java.util.List;
import java.util.Optional;

import com.customer.model.Customer;

public interface CustomerService {
	
	public Customer saveCustomer(Customer customer);

	public List<Customer> fetchAllCustomers();

	public Optional<Customer> findCustomerById(int customerId);
	
	public void deleteCustomerById(int customerId);

}
