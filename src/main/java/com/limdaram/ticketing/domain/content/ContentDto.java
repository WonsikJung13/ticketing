package com.limdaram.ticketing.domain.content;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class ContentDto {
    private int contentId;
    private String contentName;
    private String contentRegion;
    private String contentBoard;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate contentStartDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate contentEndDate;

    private int contentPrice;
    private int countContent;

    }

