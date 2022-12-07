package com.limdaram.ticketing.service.customer;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.mapper.customer.CustomerMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class CustomerService {
    @Setter(onMethod_ = @Autowired)
    private CustomerMapper customerMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

//    public int modify(CustomerDto customer) {
//        int cnt = 0;
//        try {
//            return customerMapper.update(customer);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return cnt;
//    }

//    public CustomerDto getByCustomerUniqueNumber(int customerUniqueNumber) {
//        return customerMapper.getByCustomerUniqueNumber(customerUniqueNumber);
//    }

//    public CustomerDto getCustomer(int customerUniqueNumber) {
//        return customerMapper.select(customerUniqueNumber);
//    }

    public int insert(CustomerDto customer) {
        String password = customer.getCustomerPassword();
        customer.setCustomerPassword(passwordEncoder.encode(password));
        return customerMapper.insert(customer);
    }

    public int remove(CustomerDto customer) {
        return customerMapper.delete(customer);
    }

    public CustomerDto getByCustomerId(String customerId) {
        return customerMapper.getByCustomerId(customerId);
    }

    public CustomerDto getByCustomerEmail(String customerEmail) {
        return customerMapper.getByCustomerEmail(customerEmail);
    }

    public int passwordModify(String customerId, String customerPassword) {
        return customerMapper.passwordModify(customerId, customerPassword);
    }

    public int phoneNumberModify(String customerId, String customerPhoneNumber) {
        return customerMapper.phoneNumberModify(customerId, customerPhoneNumber);
    }

    public int addressModify(String customerId, String customerAddress) {
        return customerMapper.addressModify(customerId, customerAddress);
    }

    public int nameModify(String customerId, String customerName) {
        return customerMapper.nameModify(customerId, customerName);
    }

    public int birthModify(String customerId, String customerBirth) {
        return customerMapper.birthModify(customerId, customerBirth);
    }
}
