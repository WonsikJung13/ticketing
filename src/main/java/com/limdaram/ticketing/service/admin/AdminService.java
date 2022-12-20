package com.limdaram.ticketing.service.admin;

import com.limdaram.ticketing.domain.admin.GradeDto;
import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.mapper.admin.AdminMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminService {

    @Setter(onMethod_ = @Autowired)
    private AdminMapper adminMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;

    public List<CustomerDto> getCustomerList() {
        return adminMapper.getCustomerList();
    }

    public int getGradeCountForSilver() {
        return adminMapper.getGradeCountForSilver();
    }

    public int getGradeCountForGold() {
        return adminMapper.getGradeCountForGold();
    }

    public List<GradeDto> getGradeList() {
        return adminMapper.getGradeList();
    }

    public int updateGrade(String customerId, String customerGrade) {
        return adminMapper.updateGrade(customerId, customerGrade);
    }

    public int resetPassword(CustomerDto customer) {
        customer.setCustomerPassword(passwordEncoder.encode("1111"));
        return adminMapper.resetPassword(customer);
    }
}
