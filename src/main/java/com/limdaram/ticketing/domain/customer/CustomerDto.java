package com.limdaram.ticketing.domain.customer;

import lombok.Data;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;


@Data
public class CustomerDto {
    private String customerId;
    private String customerName;
    private int customerUniqueNumber;
    private String customerPassword;
    private String customerEmail;
    private String customerAddress;
    private String customerPhoneNumber;
    private Date customerBirth;
    private String customerGrade;
    private int customerTotalPaid;

    private List<String> auth;

    private LocalDateTime customerInserted;

}
