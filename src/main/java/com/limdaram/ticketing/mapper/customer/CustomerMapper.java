package com.limdaram.ticketing.mapper.customer;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.domain.customer.GoogleUser;


public interface CustomerMapper {
//    CustomerDto select(int customerUniqueNumber);

    int insert(CustomerDto customer);

    int insert(GoogleUser user);

//    CustomerDto getByCustomerUniqueNumber(int customerUniqueNumber);

//    int update(CustomerDto customer);

    int delete(CustomerDto customer);

    CustomerDto getByCustomerId(String customerId);

    CustomerDto getByCustomerEmail(String customerEmail);

    int passwordModify(String customerId, String customerPassword);

    int phoneNumberModify(String customerId, String customerPhoneNumber);

    int addressModify(String customerId, String customerAddress);

    int nameModify(String customerId, String customerName);

    int birthModify(String customerId, String customerBirth);
}
