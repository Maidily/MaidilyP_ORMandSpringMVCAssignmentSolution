package com.customer.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.customer.repository.CustomerRepository;
import com.customer.model.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerRepository customerRepository;
	
	
	@Override
	public Customer saveCustomer(Customer customer) {
		return this.customerRepository.save(customer);
	}
	
	@Override
	public List<Customer> fetchAllCustomers() {
		return this.customerRepository.findAll();
	}
	
	@Override
	public Optional<Customer> findCustomerById(int customerId) {
		return Optional.of(this.customerRepository.findById(customerId)
				.orElseThrow( () -> new IllegalArgumentException("Invalid customer id received") ));
	}
	
	@Override
	public void deleteCustomerById(int customerId) {
		this.customerRepository.deleteById(customerId);
	}

}
