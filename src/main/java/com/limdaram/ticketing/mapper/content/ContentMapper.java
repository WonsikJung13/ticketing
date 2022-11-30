package com.limdaram.ticketing.mapper.content;

import com.limdaram.ticketing.domain.content.ContentDto;

import java.util.List;

public interface ContentMapper {
    int insert(ContentDto content);

    List<ContentDto> list();

    ContentDto select(int contentId);

    int update(ContentDto content);

    int delete(int contentId);

    int countAll();

    int insertFile(int contentId, String fileName);

    int insertFile2(int contentId, String fileName);
    
    int deletePosterByContentId(int contentId);

    int deleteDetailByContentId(int contentId);

    int deleteByContentIdAndDetailName(int contentId, String fileName);
}
