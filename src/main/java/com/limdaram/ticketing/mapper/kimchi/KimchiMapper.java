package com.limdaram.ticketing.mapper.kimchi;

import com.limdaram.ticketing.domain.kimchi.KimchiDto;

import java.util.List;

public interface KimchiMapper {
    int insert(KimchiDto content);

    List<KimchiDto> list();

    KimchiDto select(int contentId);

    int update(KimchiDto content);

    int delete(int contentId);

    int countAll();

    int insertFile(int contentId, String fileName);

    int insertFile2(int contentId, String fileName);

    int deletePosterByContentId(int contentId);

    int deleteDetailByContentId(int contentId);

    int deleteByContentIdAndDetailName(int contentId, String fileName);

    List<KimchiDto> selectContent();

    List<KimchiDto> selectDetailName(int contentId);
}
