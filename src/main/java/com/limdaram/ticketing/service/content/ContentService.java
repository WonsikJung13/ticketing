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

    public void register(ContentDto content) {
        mapper.insert(content);
    }

    public List<ContentDto> listContent() {
        return mapper.list();
    }
}
