package com.zs.mapper;

import com.zs.bean.Tag;

import java.util.List;

public interface TagMapper {
    void insertTag(Tag tag);

    Tag selectTagByTId(Integer tId);

    List<Tag> selectTagsByLId(Integer lId);

    List<Tag> selectAllTag();

}
