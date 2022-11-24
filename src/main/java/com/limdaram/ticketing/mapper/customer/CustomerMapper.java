package com.limdaram.ticketing.mapper.customer;

import com.limdaram.ticketing.domain.customer.CustomerDto;


public interface CustomerMapper {
    CustomerDto select(int customerUniqueNumber);

    int insert(CustomerDto customer);

    CustomerDto getByCustomerId(int customerUniqueNumber);

    int update(CustomerDto customer);
}
