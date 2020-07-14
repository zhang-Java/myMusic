package com.zs.service.impl;

import com.zs.bean.RankList;
import com.zs.mapper.RankListMapper;
import com.zs.service.RankListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RankListServiceImpl implements RankListService {

    @Autowired
    RankListMapper rankListMapper;

    @Override
    public void insertRank(RankList rankList) {
        rankListMapper.insertRank(rankList);
    }

    @Override
    public List<RankList> selectAllRank() {
        return rankListMapper.selectAllRank();
    }

    @Override
    public List<RankList> selectRankByRType(String rType) {
        return rankListMapper.selectRankByRType(rType);
    }

    @Override
    public RankList selectRankByRId(Integer rId) {
        return rankListMapper.selectRankByRId(rId);
    }
}
