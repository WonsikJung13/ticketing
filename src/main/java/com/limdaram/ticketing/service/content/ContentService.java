package com.limdaram.ticketing.service.content;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.mapper.content.ContentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Service
public class ContentService {

    @Autowired
    private ContentMapper mapper;

    public int register(
            ContentDto content,
            MultipartFile file) {
        // db에 게시물 정보 저장
        int cnt = mapper.insert(content);

        if (file != null && file.getSize() > 0) {
            // db에 파일 정보 저장(id, filename)
            mapper.insertFile(content.getContentId(), file.getOriginalFilename());

            // 파일 저장// board id 이름의 새폴더 만들기
            File folder = new File("/Users/sunggyu-lim/Desktop/kukbi/study/upload/ticket/content/" + content.getContentId());
            folder.mkdirs();

            File dest = new File(folder, file.getOriginalFilename());

            try {
                file.transferTo(dest);
            } catch (Exception e) {
                // @Transactional은 RuntimeException에서만 rollback 됨
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }
        return mapper.insert(content, file);
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
