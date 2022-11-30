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

    public ReplyDto get(int id){
        return replyMapper.select(id);
    }

    public ReplyDto getById(int id) {
        return replyMapper.select(id);
    }

    public int addReply(ReplyDto reply) {
        return replyMapper.addReply(reply);
    }


    public int update(ReplyDto reply) {
        System.out.println("서비스" + reply);
        return replyMapper.updateReply(reply); }

    public int register(ReplyDto reply) {
        // db에 게시물 정보 저장
        int cnt = replyMapper.insert(reply);

//        for (MultipartFile file : files) {
//            if (file != null && file.getSize() > 0) {
//                // db에 파일 정보 저장
//                boardMapper.insertFile(board.getId(), file.getOriginalFilename());
//
//                // 파일 저장
//                // board id 이름의 새폴더 만들기
//                File folder = new File("C:\\Users\\user\\Desktop\\study\\upload\\prj1\\board\\" + board.getId());
//                folder.mkdirs();
//
//                File dest = new File(folder, file.getOriginalFilename());
//
//                try {
//                    file.transferTo(dest);
//                } catch (Exception e) {
//                    // @Transactional은 RuntimeException에서만 rollback 됨
//                    e.printStackTrace();
//                    throw new RuntimeException(e);
//                }
//            }
//        }

        return cnt;
    }

    public int remove(int id) {
        return replyMapper.removeById(id);
    }
}

