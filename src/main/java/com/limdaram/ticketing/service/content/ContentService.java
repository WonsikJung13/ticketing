package com.limdaram.ticketing.service.content;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.mapper.content.ContentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentService {

    @Autowired
    private ContentMapper mapper;

    public int register(ContentDto content) {
        return mapper.insert(content);
    }

    public List<ContentDto> listContent() {
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
