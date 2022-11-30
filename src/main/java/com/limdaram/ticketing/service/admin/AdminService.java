package com.limdaram.ticketing.service.admin;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.mapper.admin.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;
    public List<CustomerDto> getCustomerList() {
        return adminMapper.getCustomerList();
    }

    public int getGradeCountForSilver() {
        return adminMapper.getGradeCountForSilver();
    }

    public int getGradeCountForGold() {
        return adminMapper.getGradeCountForGold();
    }

    public List<CustomerDto> getGradeList() {
        return adminMapper.getGradeList();
    }
}
