package com.limdaram.ticketing.service.content;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.mapper.content.ContentMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Service
public class ContentService {

    @Setter(onMethod_ = @Autowired)
    private ContentMapper mapper;

    public int register(
            ContentDto content,
            MultipartFile file1,
            MultipartFile[] file2) {
        // db에 게시물 정보 저장
        int cnt = mapper.insert(content);

        File folder1 = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());

        if (file1 != null && file1.getSize() > 0) {

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

        for (MultipartFile file : file2) {
            if (file != null && file.getSize() > 0) {
//                File folder2 = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());

                String uuid2 = UUID.randomUUID().toString() + ".jpg";

                // db에 파일 정보 저장(contentid, filename)
                mapper.insertFile2(content.getContentId(), uuid2);

                // 파일 저장// board id 이름의 새폴더 만들기
                folder1.mkdirs();
                File dest2 = new File(folder1, uuid2);

                // CheckException을 RuntimeException으로 바꿔서 던져주는 역할
                try {
                    file.transferTo(dest2); // checkException을 발생시킴
                } catch (Exception e) {
                    // @Transactional은 RuntimeException에서만 rollback 됨
                    e.printStackTrace();
                    throw new RuntimeException(e);
                }
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
        // 저장소의 이미지 파일 지우기
        String path = "/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + contentId;
        File folder = new File(path);   // 폴더 만들기

        File[] listFiles = folder.listFiles();  // 폴더안의 파일들

        for (File file : listFiles) {
            file.delete();  // 파일 지우기
        }
        folder.delete();    // 폴더 지우기

        // db의 이미지 파일 records 지우기
        mapper.deletePosterByContentId(contentId);
        mapper.deleteDetailByContentId(contentId);

        // 게시물의 댓글 지우기
        // replyMapper.deleteByContentId(ContentId);

        // 게시글 지우기
        return mapper.delete(contentId);
    }
}
