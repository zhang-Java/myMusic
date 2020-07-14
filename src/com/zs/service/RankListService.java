package com.zs.service;

import com.zs.bean.RankList;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: DengLong
 * Date: 2020-03-22
 * Time: 16:06
 */
public interface RankListService {

    void insertRank(RankList rankList);

    List<RankList> selectAllRank();

    List<RankList> selectRankByRType(String rType);

    RankList selectRankByRId(Integer rId);

}
