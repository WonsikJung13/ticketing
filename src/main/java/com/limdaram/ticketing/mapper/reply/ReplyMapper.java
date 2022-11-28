package com.limdaram.ticketing.mapper.reply;


import com.limdaram.ticketing.domain.reply.ReplyDto;

import java.util.List;

public interface ReplyMapper {

    List<ReplyDto> list();

    ReplyDto select(int id);

    int deleteById(int id);

    int addReply(ReplyDto reply);

    int insert(ReplyDto reply);

    int updateReply(ReplyDto reply);
}
