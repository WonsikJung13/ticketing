package com.limdaram.ticketing.mapper.admin;

import com.limdaram.ticketing.domain.customer.CustomerDto;

import java.util.List;

public interface AdminMapper {
    List<CustomerDto> getCustomerList();

    int getGradeCountForSilver();

    int getGradeCountForGold();

    List<CustomerDto> getGradeList();
}
