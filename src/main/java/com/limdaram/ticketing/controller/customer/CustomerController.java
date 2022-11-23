package com.limdaram.ticketing.controller.customer;

import com.limdaram.ticketing.service.customer.CustomerService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("customer")
public class CustomerController {

    @Setter(onMethod_ = @Autowired)
    private CustomerService customerService;

    @RequestMapping("get")
    public void method(int id, Model model) {
        String customer = customerService.getCustomer(id);
        System.out.println(customer);

        model.addAttribute("customer", customer);


    }

}
