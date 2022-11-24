package com.limdaram.ticketing.domain.customer;

import lombok.Data;

import java.sql.Date;
import java.time.LocalDateTime;


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


    private LocalDateTime customerInserted;

}
