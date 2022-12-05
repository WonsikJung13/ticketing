package com.limdaram.ticketing.security;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.mapper.customer.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerSecurity {

    @Autowired
    private CustomerMapper customerMapper;

    public boolean checkCustomerId(String username, String customerId) {
        CustomerDto customer = customerMapper
                .getByCustomerId(customerId);

        return customer.getCustomerId().equals(username);
    }
}
