package com.limdaram.ticketing.mapper.customer;

import com.limdaram.ticketing.domain.customer.CustomerDto;


public interface CustomerMapper {
    CustomerDto select(int customerUniqueNumber);

    int insert(CustomerDto customer);

    CustomerDto getByCustomerUniqueNumber(int customerUniqueNumber);

//    int update(CustomerDto customer);

    int delete(CustomerDto customer);

    CustomerDto getByCustomerId(String customerId);

    CustomerDto getByCustomerEmail(String customerEmail);

    int passwordModify(int customerUniqueNumber, String customerPassword);

    int phoneNumberModify(int customerUniqueNumber, String customerPhoneNumber);

    int addressModify(int customerUniqueNumber, String customerAddress);
}
