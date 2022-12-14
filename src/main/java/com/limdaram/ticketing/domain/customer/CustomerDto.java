package com.limdaram.ticketing.domain.customer;

import lombok.Data;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;


@Data
public class CustomerDto {
    private int customerUniqueNumber;
    private String customerName;
    private Date customerBirth;
    private String customerAddress;
    private String customerId;
    private String customerPassword;
    private String customerEmail;
    private String customerPhoneNumber;
    private String customerGrade;
    private LocalDateTime customerInserted;

    private int customerTotalPaid;

    private List<String> auth;

    private String social;


}
