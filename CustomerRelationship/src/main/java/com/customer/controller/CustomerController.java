package com.customer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.customer.model.Customer;
import com.customer.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	

	@RequestMapping("/")
	public String showMainPage() {
		
		// returning the jsp home-page name
		return "homePage";
	}
	
	
	@RequestMapping("/customer/list")								// add mapping for "/customer/list"
	public String fetchAllCustomers(Model theModel) {
		
		// get all student details from database table
		List<Customer> customers = customerService.fetchAllCustomers();

		// add data to spring model
		theModel.addAttribute("Customers", customers);
		
		// returning the jsp page name
		return "list-Customers";
	}
	
	
	@RequestMapping("/customer/showFormForAdd")						// add mapping to "/customer/showFormForAdd"
	public String showFormForAdd(Model theModel) {
		
		// create model attribute to bind form data
		Customer customer = new Customer();
		
		theModel.addAttribute("Customer", customer);
		
		return "Customer-form";
	}
	
		
	@RequestMapping("/customer/showFormForUpdate")					// add mapping to "/customer/showFormForUpdate"
	public String showFormForUpdate(@RequestParam("customerId") int id, Model theModel) {
		
		// get customer based on the id
		Customer customer = customerService.findCustomerById(id).get();
		
		// set customer as model attribute to pre-populate the form
		theModel.addAttribute("Customer", customer);
		
		return "Customer-form";
	}
	
	
	@PostMapping("/customer/save")									// add post mapping to "/customer/save"
	public String saveCustomer(@RequestParam("id") int id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("email") String email) {
		
		System.out.println("Save customer details :: Customer id - " + id);		
		Customer customer;
		
		if (id != 0) {
			// get customer based on the id
			customer = customerService.findCustomerById(id).get();
			
			customer.setFirstName(firstName);
			customer.setLastName(lastName);
			customer.setEmail(email);
		}
		else {
			customer = new Customer(id, firstName, lastName, email);
		}
		
		// save the customer data 
		customerService.saveCustomer(customer);
		
		// using redirect to prevent duplicate submissions -- go back to previous page
		return "redirect:/customer/list";
	}
	
	
	@RequestMapping("/customer/delete")								// add mapping to "/customer/delete"
	public String delete(@RequestParam("customerId") int id) {
		
		System.out.println("Deleting customer :: Customer id - " + id);		
		
		// delete customer data based on id
		customerService.deleteCustomerById(id);
		
		// using redirect to prevent duplicate submissions -- go back to previous page
		return "redirect:/customer/list";
	}

}
