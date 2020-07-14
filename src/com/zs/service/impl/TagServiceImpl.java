package com.zs.service.impl;

import com.zs.bean.Tag;
import com.zs.mapper.TagMapper;
import com.zs.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagServiceImpl implements TagService {

    @Autowired
    TagMapper tagMapper;

    @Override
    public List<Tag> selectAllTag() {
        return tagMapper.selectAllTag();
    }

    @Override
    public void insertTag(Tag tag) {
        tagMapper.insertTag(tag);
    }

    @Override
    public Tag selectTagByTId(Integer tId) {
        return tagMapper.selectTagByTId(tId);
    }

    @Override
    public List<Tag> selectTagsByLId(Integer lId) {
        return tagMapper.selectTagsByLId(lId);
    }
}
