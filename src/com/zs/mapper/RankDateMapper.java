package com.zs.mapper;

import com.zs.bean.RankDate;

import java.util.List;

public interface RankDateMapper {
    List<RankDate> selectByRId(Integer rId);

}
