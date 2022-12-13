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

//    public ReplyDto getById(String replyName) {
//        return replyMapper.select(replyName);
//    }

    public int addReply(ReplyDto reply) {
        return replyMapper.addReply(reply);
    }


    public int update(ReplyDto reply) {
        System.out.println("서비스" + reply);
        return replyMapper.updateReply(reply); }

    public int register(ReplyDto reply) {
        // db에 게시물 정보 저장
        int cnt = replyMapper.insert(reply);


        return cnt;
    }

    public int remove(int replyId) {
        return replyMapper.removeById(replyId);
    }

    public ReplyDto get(int replyId) {return replyMapper.select(replyId);
    }
}

