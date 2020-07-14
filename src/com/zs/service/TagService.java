package com.zs.service;

import com.zs.bean.Tag;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: DengLong
 * Date: 2020-03-22
 * Time: 16:06
 */
public interface TagService {

    List<Tag> selectAllTag();

    void insertTag(Tag tag);

    Tag selectTagByTId(Integer tId);

    List<Tag> selectTagsByLId(Integer lId);

}
