package com.limdaram.ticketing.service.content;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.mapper.content.ContentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Service
public class ContentService {

    @Autowired
    private ContentMapper mapper;

    public int register(
            ContentDto content,
            MultipartFile file1, MultipartFile file2) {
        // db에 게시물 정보 저장
        int cnt = mapper.insert(content);

        if (file1 != null && file1.getSize() > 0) {
            File folder1 = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());

            String uuid = UUID.randomUUID().toString()+".jpg";

            // db에 파일 정보 저장(contentid, filename)
            mapper.insertFile(content.getContentId(), uuid);

            // 파일 저장// board id 이름의 새폴더 만들기
//            File folder = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());
            folder1.mkdirs();
            File dest = new File(folder1, uuid);

            // CheckException을 RuntimeException으로 바꿔서 던져주는 역할
            try {
                file1.transferTo(dest); // checkException을 발생시킴
            } catch (Exception e) {
                // @Transactional은 RuntimeException에서만 rollback 됨
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }

        if (file2!= null && file2.getSize() > 0) {
            File folder2 = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());

            String uuid2 = UUID.randomUUID().toString()+".jpg";

            // db에 파일 정보 저장(contentid, filename)
            mapper.insertFile2(content.getContentId(), uuid2);

            // 파일 저장// board id 이름의 새폴더 만들기
            folder2.mkdirs();
            File dest2 = new File(folder2, uuid2);

            // CheckException을 RuntimeException으로 바꿔서 던져주는 역할
            try {
                file2.transferTo(dest2); // checkException을 발생시킴
            } catch (Exception e) {
                // @Transactional은 RuntimeException에서만 rollback 됨
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }
        System.out.println(content);
        return cnt;
    }

    public List<ContentDto> listContent(ContentDto contentDto) {
        int countAll = mapper.countAll();

        contentDto.setCountContent(countAll);

        return mapper.list();
    }

    public ContentDto get(int contentId) {
        return mapper.select(contentId);
    }

//    컨텐츠수정
    public int update(ContentDto content) {
        return mapper.update(content);
    }

//    컨텐츠삭제
    public int remove(int contentId) {
        return mapper.delete(contentId);
    }
}
