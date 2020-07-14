package com.zs.service;

import com.zs.bean.RankDate;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: DengLong
 * Date: 2020-03-22
 * Time: 16:06
 */
public interface RankDateService {

    List<RankDate> selectByRId(Integer rId);

}
