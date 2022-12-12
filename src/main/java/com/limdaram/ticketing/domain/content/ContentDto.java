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
    private int contentPrice;
    private int countContent;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate contentStartDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate contentEndDate;
    // 이미지 관련
    private String contentAddrDetail;
    private int contentPosterId;
    // 지도 관련
    private String contentAddress;
    private float contentMapEntX;
    private float contentMapEntY;

    private LocalDateTime contentInserted;

    // 예약 관련
    private int startTime;
    private int endTime;
    private String dayLimit;

    public String getTime() {
        String result = "";

        result = contentInserted.toLocalDate().toString() + " " + contentInserted.toLocalTime().toString();
        return result;
    }

}

