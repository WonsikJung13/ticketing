package com.limdaram.ticketing.mapper.reply;


import com.limdaram.ticketing.domain.reply.ReplyDto;

import java.util.List;

public interface ReplyMapper {

    List<ReplyDto> list();

    ReplyDto selectDuo(String replyName, int replyId);

    int deleteById(String replyName);

    int addReply(ReplyDto reply);

    int insert(ReplyDto reply);

    int updateReply(ReplyDto reply);

    int removeById(int replyId);

    ReplyDto select(int replyId);
}
