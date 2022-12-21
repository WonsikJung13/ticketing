package com.limdaram.ticketing.mapper.admin;

import com.limdaram.ticketing.domain.admin.GradeDto;
import com.limdaram.ticketing.domain.customer.CustomerDto;

import java.util.List;

public interface AdminMapper {
    List<CustomerDto> getCustomerList();

    int getGradeCountForSilver();

    int getGradeCountForGold();

    List<GradeDto> getGradeList();

    int updateGrade(String customerId, String customerGrade);

    int resetPassword(CustomerDto customer);

    int deleteAuth(CustomerDto customer);
}
