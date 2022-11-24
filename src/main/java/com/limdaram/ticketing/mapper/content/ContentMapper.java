package com.limdaram.ticketing.mapper.content;

import com.limdaram.ticketing.domain.content.ContentDto;

import java.util.List;

public interface ContentMapper {
    int insert(ContentDto content);

    List<ContentDto> list();

    ContentDto select(int contentId);
}
