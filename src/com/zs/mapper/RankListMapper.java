package com.zs.mapper;

import com.zs.bean.RankList;

import java.util.List;

public interface RankListMapper {
    void insertRank(RankList rankList);

    List<RankList> selectAllRank();

    List<RankList> selectRankByRType(String rType);

    RankList selectRankByRId(Integer rId);

}
