package com.limdaram.ticketing.domain.content;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class ContentDto {
    private int contentId;
    private String contentName;
    private String contentRegion;
    private String contentBoard;
    private String contentPosterName;
    private List<String> contentDetailName;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate contentStartDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate contentEndDate;

    public int contentPrice;
    private int countContent;

    private String contentAddress;
    private float contentMapEntX;
    private float contentMapEntY;
    private String contentAddrDetail;
    private int contentPosterId;
    private LocalDateTime contentInserted;

    private int startTime;
    private int endTime;
    private String dayLimit;

    public String getTime() {
        String result = "";

        result = contentInserted.toLocalDate().toString() + " " + contentInserted.toLocalTime().toString();
        return result;
    }

}

