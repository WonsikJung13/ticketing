package com.limdaram.ticketing.service.reply;

import com.limdaram.ticketing.domain.reply.ReplyDto;
import com.limdaram.ticketing.mapper.reply.ReplyMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ReplyService {

    @Setter(onMethod_ = @Autowired)
    private ReplyMapper replyMapper;

    public List<ReplyDto> listReply(){
        return replyMapper.list();
    }

    public ReplyDto getDuo(String replyName, int replyId){
        return replyMapper.selectDuo(replyName, replyId);
    }


    public int addReply(ReplyDto reply) {
        return replyMapper.addReply(reply);
    }


    public int update(ReplyDto reply) {
        return replyMapper.updateReply(reply); }

    public int register(ReplyDto reply) {
        int cnt = replyMapper.insert(reply);
        return cnt;
    }

    public int remove(int replyId) {
        return replyMapper.removeById(replyId);
    }

    public ReplyDto get(int replyId) {return replyMapper.select(replyId);
    }

    public List<ReplyDto> getContentId(int contentId) {return replyMapper.selectContentId(contentId);
    }
}

