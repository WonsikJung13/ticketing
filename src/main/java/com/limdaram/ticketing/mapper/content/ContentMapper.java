package com.limdaram.ticketing.mapper.content;

import com.limdaram.ticketing.domain.content.ContentDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ContentMapper {
    int insert(ContentDto content, MultipartFile file);

    List<ContentDto> list();

    ContentDto select(int contentId);

    int update(ContentDto content);

    int delete(int contentId);

    int countAll();

    int insertFile(int contentId, String fileName);

    int insert(ContentDto content);
}
