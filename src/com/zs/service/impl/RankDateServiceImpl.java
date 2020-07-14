package com.zs.service.impl;

import com.zs.bean.RankDate;
import com.zs.mapper.RankDateMapper;
import com.zs.service.RankDateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RankDateServiceImpl implements RankDateService {

    @Autowired
    private RankDateMapper rankDateMapper;

    @Override
    public List<RankDate> selectByRId(Integer rId) {
        return rankDateMapper.selectByRId(rId);
    }
}
