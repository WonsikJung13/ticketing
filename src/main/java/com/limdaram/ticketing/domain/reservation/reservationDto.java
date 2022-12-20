package com.limdaram.ticketing.domain.reservation;

import lombok.Data;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class reservationDto {
    private int reservId;
    private String reservName;
    private String reservPhone;
    private String contentName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate reservDate;

    private String reservTime;
    private String reservRegion;
    private int reservPrice;

}
