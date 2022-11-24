package com.limdaram.ticketing.mapper.customer;

import com.limdaram.ticketing.domain.customer.CustomerDto;

public interface CustomerMapper {
    String select(int customerUniqueNumber);

    int insert(CustomerDto customer);
}
