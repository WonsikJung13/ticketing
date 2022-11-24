package com.limdaram.ticketing.service.customer;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.mapper.customer.CustomerMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class CustomerService {
    @Setter(onMethod_ = @Autowired)
    private CustomerMapper customerMapper;

    public int modify(CustomerDto customer) {
        int cnt = 0;
        try {
            return customerMapper.update(customer);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cnt;
    }

    public CustomerDto getByCustomerId(int customerUniqueNumber) {
        return customerMapper.getByCustomerId(customerUniqueNumber);
    }

    public CustomerDto getCustomer(int customerUniqueNumber) {
        return customerMapper.select(customerUniqueNumber);
    }

    public int insert(CustomerDto customer) {
        return customerMapper.insert(customer);
    }
}
