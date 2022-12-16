package com.limdaram.ticketing.domain.reply;

import lombok.Data;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
public class ReplyDto {
    private int replyId;
    private String replyName;
    private String replyContent;
    private LocalDateTime replyInserted;
    private int contentId;
    private String replyMainText;
    private String customerName;

    public String getTime(){
        String result = "";

        result = replyInserted.toLocalDate().toString() + " " + replyInserted.toLocalTime().toString();
        return result;
    }

}
